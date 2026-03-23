# Arkived Course Generation - Complete Processing Pipeline

**Version:** 2.0.0  
**Purpose:** End-to-end course generation from raw materials (exams, lecture notes, syllabi)

---

## 📥 Input Materials (What Agents Receive)

### Required Inputs

1. **Course Syllabus** (PDF/Markdown)
   - Course code, name, university
   - Learning objectives
   - Topic list with schedule
   - Textbook references
   - Assessment structure

2. **Past Exams** (PDFs in folder)
   - 5-10 years of exams preferred
   - Midterms and finals
   - Solutions if available

3. **Lecture Notes** (Optional but recommended)
   - Topic summaries
   - Key formulas
   - Common student mistakes

### Input Directory Structure

```
input-materials/
├── syllabus.pdf                 # Course syllabus
├── exams/                       # Past exams
│   ├── 2024-winter-midterm.pdf
│   ├── 2024-winter-final.pdf
│   ├── 2023-fall-midterm.pdf
│   └── ... (5-10 years)
├── solutions/                   # Solutions (if separate)
│   ├── 2024-winter-midterm-solutions.pdf
│   └── ...
└── notes/                       # Lecture notes (optional)
    ├── week1-shm.pdf
    └── ...
```

---

## 🔄 Processing Pipeline (5 Stages)

### Stage 1: Extract & Parse (30 min)

**Goal:** Convert raw materials into structured data

#### 1.1 Parse Syllabus
```python
# Extract from syllabus:
- course_code: "PCS125"
- course_name: "Physics: Waves, Electricity & Modern Physics"
- university: "Toronto Metropolitan University"
- topics: [
    { "name": "Simple Harmonic Motion", "week": 1-2, "chapters": [1.1, 1.2, 1.3] },
    { "name": "Waves and Sound", "week": 3-4, "chapters": [2.1, 2.2] },
    ...
  ]
- learning_objectives: [...]
- assessment_structure: {
    "midterm_1": { "weight": 30, "topics": [0, 1, 2] },
    "midterm_2": { "weight": 30, "topics": [3, 4, 5] },
    "final": { "weight": 40, "topics": "all" }
  }
```

#### 1.2 Extract Exam Questions
For each exam PDF:
```python
# Extract:
- exam_id: "2024W_PCS125_M"
- year: 2024
- semester: "Winter"
- exam_type: "Midterm"
- questions: [
    {
      "number": 1,
      "text": "A spring-mass system...",
      "marks": 5,
      "topic": "Simple Harmonic Motion",
      "type": "calculation",  # calculation, conceptual, multiple_choice
      "difficulty": 3  # 1-5 scale
    }
  ]
```

#### 1.3 Extract Solutions
For each solution PDF:
```python
# Match to questions:
- question_id: "2024W_PCS125_M_Q1"
- solution_steps: [...]
- final_answer: "..."
- key_insight: "..."
- common_mistakes: [...]
```

**Output:** `stage1-extracted-data.json`

---

### Stage 2: Analyze & Identify Patterns (45 min)

**Goal:** Identify recurring problem types and techniques

#### 2.1 Cluster Questions by Type
```python
# Group similar questions:
patterns = {
  "shm-period-calculation": {
    "questions": ["2024W_Q1", "2023F_Q3", "2022W_Q2"],
    "frequency": 8,  # Appears 8 times across exams
    "avg_difficulty": 2.5,
    "avg_marks": 3
  },
  "coulomb-force-superposition": {
    "questions": ["2024W_Q5", "2023F_Q7"],
    "frequency": 6,
    ...
  }
}
```

#### 2.2 Identify Techniques
From question clusters, identify techniques:
```python
techniques = {
  "shm-kinematics": {
    "name": "SHM Kinematics",
    "description": "Analyze position, velocity, acceleration in SHM",
    "related_patterns": ["shm-period-calculation", "shm-energy"],
    "frequency_score": 95,  # % of exams include this
    "avg_difficulty": 2.8
  },
  "coulombs-law": {
    "name": "Coulomb's Law",
    "description": "Calculate electrostatic forces between charges",
    "related_patterns": ["coulomb-force-superposition", "electric-field-point"],
    "frequency_score": 88,
    "avg_difficulty": 3.2
  }
}
```

#### 2.3 Map Topics to Content
```python
topic_map = {
  "Simple Harmonic Motion": {
    "techniques": ["shm-kinematics", "shm-energy"],
    "patterns": ["shm-period-calculation", "shm-phase-analysis"],
    "exam_weight": 15  # % of total exam marks
  },
  "Waves and Sound": {
    "techniques": ["wave-superposition", "standing-waves"],
    ...
  }
}
```

**Output:** `stage2-analysis.json`

---

### Stage 3: Generate Content (3 hours)

**Goal:** Create all pedagogical content

#### 3.1 Generate Techniques (1 hour)

For each technique identified:

```typescript
// Template: techniques/TECHNIQUE-ID.json
{
  "id": "pcs125-shm-kinematics",
  "title": "SHM Kinematics",
  "description": "Analyze position, velocity, and acceleration in simple harmonic motion",
  
  "recognition": {
    "visualSignals": [
      "Mass oscillating on a spring",
      "Pendulum swinging",
      "Sinusoidal graph"
    ],
    "verbalTriggers": [
      "Find the period of oscillation",
      "Simple harmonic motion",
      "Spring-mass system"
    ],
    "keyQuantities": [
      "Amplitude A",
      "Angular frequency ω = √(k/m)",
      "Period T = 2π/ω"
    ],
    "nonExamples": [
      "Damped oscillations",
      "Forced oscillations"
    ]
  },
  
  "algorithm": {
    "overview": "Use kinematic equations for SHM",
    "decisionTree": "If period asked → T = 2π√(m/k)",
    "steps": [
      {
        "number": 1,
        "title": "Identify system type",
        "instruction": "Spring-mass or pendulum?",
        "pitfalls": ["Don't confuse the two"]
      }
    ]
  },
  
  "commonErrors": [
    {
      "id": "error-1",
      "symptom": "Thinking amplitude affects period",
      "diagnosis": "Confusing factors",
      "fix": "T = 2π√(m/k) has no A",
      "example": "Mass 4×, amplitude 4× → T doubles only"
    }
  ],
  
  "workedExamples": {
    "easy": {
      "id": "easy-1",
      "title": "Finding Period",
      "problem": "m = 2kg, k = 200N/m. Find T.",
      "solution": {
        "steps": [...],
        "finalAnswer": "T = 0.63s"
      },
      "firstMove": "Write T = 2π√(m/k)",
      "keyInsight": "Amplitude doesn't matter"
    },
    "medium": { ... },
    "hard": { ... }
  },
  
  "drillSets": {
    "recognition": [...],
    "execution": [...]
  },
  
  "cheatSheet": {
    "oneLiner": "Use x(t) = A cos(ωt + φ)",
    "formulas": ["$x(t) = A \\cos(\\omega t + \\phi)$"],
    "whenToUse": "SHM problems",
    "seeAlso": ["pcs125-shm-energy"]
  }
}
```

#### 3.2 Generate Patterns (45 min)

For each pattern identified:

```typescript
// Template: patterns/PATTERN-ID.json
{
  "id": "shm-period-mass-spring",
  "name": "Finding Period of Mass-Spring System",
  "description": "Calculate period, frequency, or angular frequency",
  
  "recognition": {
    "signals": ["k and m given", "Ask for T or f"],
    "keyPhrases": ["period of oscillation", "angular frequency"]
  },
  
  "firstMove": "Write T = 2π√(m/k). Amplitude doesn't affect period!",
  
  "fullSolution": {
    "steps": [
      "Identify m and k",
      "Use T = 2π√(m/k)",
      "Calculate numerical value"
    ],
    "keyFormulas": ["$T = 2\\pi\\sqrt{m/k}$"]
  },
  
  "relatedTechniques": ["pcs125-shm-kinematics"],
  
  "practiceQuestions": [
    {
      "question": "m = 4kg, k = 100N/m. Find T.",
      "answer": "T = 1.26s",
      "hint": "Use T = 2π√(m/k)"
    }
  ],
  
  "commonTraps": [
    "Thinking amplitude affects period",
    "Using pendulum formula by mistake"
  ]
}
```

#### 3.3 Generate Topic Briefings (30 min)

For each chapter/topic:

```typescript
// Template: topics/TOPIC-ID.json
{
  "id": "pcs125-ch1-shm",
  "courseId": "pcs125",
  "chapterNumber": 1,
  "title": "Simple Harmonic Motion",
  "description": "Kinematics and energy analysis of oscillating systems",
  
  "keyConcepts": [
    "Restoring force F = -kx",
    "Position: x(t) = A cos(ωt + φ)",
    "Period: T = 2π√(m/k)"
  ],
  
  "formulas": [
    {"name": "Position", "latex": "$x(t) = A \\cos(\\omega t + \\phi)$"},
    {"name": "Period", "latex": "$T = 2\\pi\\sqrt{m/k}$"}
  ],
  
  "commonErrors": [
    "Amplitude does NOT affect period",
    "Confusing ω with f"
  ],
  
  "examTips": [
    "At equilibrium: v = max, a = 0",
    "At extremes: v = 0, a = max"
  ],
  
  "relatedTechniques": ["pcs125-shm-kinematics"],
  "practiceFocus": ["Finding period", "Energy distribution"]
}
```

**Output:** Generated JSON files in `output/techniques/`, `output/patterns/`, `output/topics/`

---

### Stage 4: Process Exam Questions (30 min)

**Goal:** Enrich exam questions with pedagogical metadata

For each extracted question:

```typescript
{
  "id": "2024W_PCS125_M_Q1",
  "examId": "2024W_PCS125_M",
  "courseId": "pcs125",
  
  // Basic info (from extraction)
  "questionNumber": "1",
  "questionText": "A spring-mass system...",
  "points": 5,
  "difficulty": 2,
  
  // Enriched metadata
  "topicId": "shm-kinematics",
  "techniqueIds": ["pcs125-shm-kinematics"],
  "patternId": "shm-period-calculation",
  "section": "1.1",
  
  // Solution (from solutions PDF or generated)
  "solutionSteps": "1. Write T = 2π√(m/k)...",
  "answer": "T = 0.63s",
  "firstMove": "Write the period formula",
  
  // Pedagogical tags
  "isTricky": false,
  "commonMistakes": ["Using amplitude in calculation"],
  "estimatedTime": 6  // minutes
}
```

**Output:** `stage4-enriched-questions.json`

---

### Stage 5: Assemble & Generate SQL (15 min)

**Goal:** Create course manifest and SQL seed

#### 5.1 Generate Course Manifest

```typescript
// COURSE-manifest.ts
export const pcs125Manifest: CourseManifest = {
  id: 'pcs125',
  code: 'PCS125',
  name: 'Physics: Waves, Electricity & Modern Physics',
  slug: 'pcs125',
  
  structure: {
    chapters: [
      { id: 'ch1', number: 1, title: 'Mechanical Waves and Oscillations' },
      { id: 'ch2', number: 2, title: 'Electricity and Magnetism' },
      ...
    ],
    sections: {
      'pcs125-ch1-shm': { id: 'pcs125-ch1-shm', chapterId: 'ch1', order: 1, title: 'Simple Harmonic Motion' },
      ...
    },
    techniques: {
      'pcs125-shm-kinematics': { id: 'pcs125-shm-kinematics', sectionId: 'pcs125-ch1-shm', difficulty: 'medium' },
      ...
    }
  },
  
  contentRefs: {
    techniqueIds: ['pcs125-shm-kinematics', 'pcs125-shm-energy', ...],
    patternIds: ['shm-period-mass-spring', ...],
    topicBriefingIds: ['pcs125-ch1-shm', ...]
  },
  
  midtermPresets: {
    quick: { duration: 30, questionCount: 10 },
    standard: { duration: 60, questionCount: 20 },
    deep: { duration: 90, questionCount: 30 }
  }
};
```

#### 5.2 Generate SQL Seed

```sql
-- PCS125 Content Seed

-- Course manifest
INSERT INTO course_manifests (...) VALUES (...);

-- Techniques
INSERT INTO course_technique_content (id, course_id, display_name, content_json, ...) 
VALUES 
  ('pcs125-shm-kinematics', 'pcs125', 'SHM Kinematics', '{...}', ...),
  ...;

-- Patterns
INSERT INTO course_pattern_content (id, course_id, pattern_id, content, ...)
VALUES
  ('shm-period-mass-spring', 'pcs125', 'shm-period-mass-spring', '{...}', ...),
  ...;

-- Topics
INSERT INTO course_topic_content (topic_id, course_id, description, ...)
VALUES
  ('pcs125-ch1-shm', 'pcs125', 'Kinematics and energy...', ...),
  ...;

-- Section map
INSERT INTO course_section_map (course_id, section_map)
VALUES ('pcs125', '{...}');

-- Exam questions
INSERT INTO exam_questions (id, exam_id, course_id, ...)
VALUES
  ('2024W_PCS125_M_Q1', '2024W_PCS125_M', 'pcs125', ...),
  ...;
```

**Output:** `COURSE-manifest.ts`, `COURSE-content.sql`

---

## 🚀 Complete Agent Command

```bash
# Full pipeline execution
claude -p --allowed-tools "Read,Edit,Bash" PROCESSING.md << 'EOF'
INPUT_DIR: /path/to/input-materials
COURSE_CODE: PCS125
COURSE_NAME: "Physics: Waves, Electricity & Modern Physics"
UNIVERSITY: "Toronto Metropolitan University"
OUTPUT_DIR: /home/ubuntu/arkived/.agent/generated-courses/pcs125
EOF
```

---

## 📊 Output Directory Structure

```
generated-courses/COURSE/
├── manifest.ts                    # Course manifest
├── syllabus-analysis.json         # Parsed syllabus data
├── stage1-extracted-data.json     # Raw extraction
├── stage2-analysis.json           # Pattern analysis
├── stage4-enriched-questions.json # Processed questions
├── techniques/
│   ├── technique-1.json
│   └── ... (10-15 files)
├── patterns/
│   ├── pattern-1.json
│   └── ... (8-10 files)
├── topics/
│   ├── topic-1.json
│   └── ... (8-9 files)
├── exams/
│   ├── exam-2024-winter.json
│   └── ... (all exams)
├── COURSE-content.sql             # Database seed
└── validation-report.md           # Quality report
```

---

## ✅ Quality Checklist

Before marking complete:

- [ ] All PDFs parsed successfully
- [ ] Questions extracted from all exams
- [ ] Patterns identified with frequency scores
- [ ] Techniques have 4-phase content
- [ ] Patterns have 4-phase workbenches
- [ ] All worked examples have solutions
- [ ] LaTeX validates without errors
- [ ] SQL seed runs successfully
- [ ] Content loads in local dev
- [ ] Cross-references all resolve

---

## 🛠️ Processing Scripts Reference

| Script | Purpose | Location |
|--------|---------|----------|
| `extract-pdf.py` | Extract text from PDFs | `scripts/extraction/` |
| `parse-syllabus.py` | Parse syllabus structure | `scripts/extraction/` |
| `extract-exam.py` | Extract questions from exam PDFs | `scripts/extraction/` |
| `cluster-questions.py` | Identify patterns via clustering | `scripts/analysis/` |
| `generate-technique.py` | Generate technique JSON | `scripts/generation/` |
| `generate-pattern.py` | Generate pattern JSON | `scripts/generation/` |
| `enrich-questions.py` | Add pedagogical metadata | `scripts/enrichment/` |
| `validate-content.py` | Run all validation checks | `scripts/validation/` |
| `generate-sql.py` | Create SQL seed file | `scripts/assembly/` |

---

## 📈 Time Estimates

| Stage | Duration | Cumulative |
|-------|----------|------------|
| 1. Extract & Parse | 30 min | 30 min |
| 2. Analyze & Identify | 45 min | 1h 15m |
| 3. Generate Content | 3 hours | 4h 15m |
| 4. Process Questions | 30 min | 4h 45m |
| 5. Assemble & SQL | 15 min | 5 hours |
| **Total** | **5 hours** | **5 hours** |

---

**Next:** See `SKILL.md` for installation as a Claude skill.
