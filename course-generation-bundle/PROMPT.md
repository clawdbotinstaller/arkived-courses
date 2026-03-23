# Arkived Course Generation Agent - Complete Template Bundle

**Version:** 1.0.0  
**Date:** 2026-03-23  
**Purpose:** Generate complete, high-quality course content for Arkived platform  
**Reference Course:** MTH240 (Calculus 2) - the archetype

---

## 🎯 Agent Mission

Generate a complete university course following the MTH240 archetype pattern. The generated course must:

1. Follow the exact pedagogical structure of MTH240
2. Include complete technique content with 4-phase learning
3. Include pattern workbenches with worked examples
4. Include topic briefings with exam tips
5. Pass all validation gates
6. Work seamlessly with the Arkived platform

---

## 📚 Reference Materials (READ THESE FIRST)

### 1. Archetype Definition
**File:** `docs/forge/mth240-archetype-template.md`

This defines:
- Navigation architecture (Home, Technique Mastery, Pattern Workbench, etc.)
- Page structure templates
- UI/Content boundaries
- Technique structure (4 phases: recognize, understand, master, certified)
- Pattern structure (4 phases: recognition, strategy, practice, mastery)

### 2. Type Definitions
**File:** `frontend/src/types/archetypes.ts`

Study these TypeScript interfaces:
- `CourseManifest` - Course configuration
- `TechniqueContent` - Technique learning content
- `PatternContent` - Pattern workbench content
- `TopicBriefing` - Topic analysis content

### 3. Reference Implementation
**File:** `frontend/src/courses/mth240-manifest.ts`

This is the GOLD STANDARD. Study:
- How techniques are structured
- How patterns reference techniques
- How sections map to chapters
- How midterm presets are configured

### 4. Validation Schemas
**File:** `worker/src/validation/contentSchemas.ts`

All generated content MUST validate against these Zod schemas:
- `TechniqueContentSchema`
- `PatternSchema`
- `TopicContentSchema`

---

## 🏗️ Content Architecture

### Course Manifest Structure

```typescript
interface CourseManifest {
  id: string;                    // e.g., 'pcs125'
  code: string;                  // e.g., 'PCS125'
  name: string;                  // Full course name
  slug: string;                  // URL slug
  
  structure: {
    chapters: CourseChapter[];   // 3-4 chapters
    sections: Record<string, CourseSection>;  // 8-12 sections
    techniques: Record<string, CourseTechnique>; // 10-15 techniques
  };
  
  contentRefs: {
    techniqueIds: string[];      // List of technique IDs
    patternIds: string[];        // List of pattern IDs
    topicBriefingIds: string[];  // List of topic IDs
  };
  
  midtermPresets: {
    quick: { duration: number; questionCount: number; };
    standard: { duration: number; questionCount: number; };
    deep: { duration: number; questionCount: number; };
  };
}
```

### Technique Content Structure

```typescript
interface TechniqueContent {
  id: string;                    // e.g., 'pcs125-shm-kinematics'
  title: string;                 // Display title
  description: string;           // One-line description
  
  recognition: {
    visualSignals: string[];     // What to look for in diagrams
    verbalTriggers: string[];    // Keywords in problem statements
    keyQuantities: string[];     // Important variables/formulas
    nonExamples: string[];       // What this is NOT
  };
  
  algorithm: {
    overview: string;            // High-level approach
    decisionTree: string;        // When to use which formula
    steps: AlgorithmStep[];      // Numbered steps with pitfalls
  };
  
  commonErrors: CommonError[];   // 3-5 errors with fixes
  
  workedExamples: {
    easy: WorkedExample;         // Straightforward application
    medium: WorkedExample;       // Requires 2-3 steps
    hard: WorkedExample;         // Multi-concept, requires insight
  };
  
  drillSets: {
    recognition: DrillQuestion[];
    execution: DrillQuestion[];
  };
  
  cheatSheet: {
    oneLiner: string;            // Quick summary
    formulas: string[];          // Key formulas (LaTeX)
    whenToUse: string;           // Decision guidance
    seeAlso: string[];           // Related technique IDs
  };
}
```

### Pattern Workbench Structure

```typescript
interface PatternContent {
  id: string;                    // e.g., 'shm-period-mass-spring'
  name: string;                  // Display name
  description: string;           // What this pattern covers
  
  recognition: {
    signals: string[];           // When this pattern applies
    keyPhrases: string[];        // Keywords to look for
  };
  
  firstMove: string;             // Always the same first step
  
  fullSolution: {
    steps: string[];             // Step-by-step solution
    keyFormulas: string[];       // LaTeX formulas used
  };
  
  relatedTechniques: string[];   // Technique IDs
  practiceQuestions: PracticeQuestion[];
  commonTraps: string[];         // Common mistakes
}
```

---

## 📝 Content Generation Guidelines

### Quality Standards

1. **Pedagogical Accuracy**
   - All formulas must be correct
   - Explanations must be clear and accurate
   - Common errors must reflect real student mistakes

2. **LaTeX Formatting**
   - Use `$...$` for inline math
   - Use `$$...$$` for display equations
   - Proper subscripts: `x_{max}`, `v_0`
   - Greek letters: `\omega`, `\phi`, `\pi`
   - Units: `\text{m/s}` or `\mathrm{m/s}`

3. **Exam Authenticity**
   - Match the style of real university exams
   - Include common question types (MC, calculation, conceptual)
   - Reference actual exam questions where possible

4. **Progressive Difficulty**
   - Easy: Direct formula application
   - Medium: Requires 2-3 steps, some algebra
   - Hard: Multi-concept, requires problem-solving insight

### Writing Style

- **Be concise but complete**
- **Use active voice**: "Calculate the velocity" not "The velocity should be calculated"
- **Include units**: Always include proper units in examples
- **Show reasoning**: Don't just give formulas, explain why
- **Anticipate confusion**: Address common misconceptions

---

## 🔄 Generation Workflow

### Phase 1: Research & Planning (30 min)

1. Read the course syllabus
2. Identify key topics and their relationships
3. Map topics to techniques (10-15 techniques)
4. Identify recurring patterns (8-10 patterns)
5. Group into chapters (3-4 chapters)

### Phase 2: Generate Manifest (15 min)

Create `COURSE-manifest.ts`:
- Define course metadata
- Create chapter/section structure
- List all techniques with IDs
- List all patterns with IDs
- Configure midterm presets

### Phase 3: Generate Technique Content (2 hours)

For each technique:
1. Write recognition triggers (visual + verbal)
2. Create algorithm with decision tree
3. Write 3 worked examples (easy/medium/hard)
4. Document 3-5 common errors
5. Create drill sets
6. Write cheat sheet

**File:** `techniques/TECHNIQUE-ID.json`

### Phase 4: Generate Pattern Content (1 hour)

For each pattern:
1. Define recognition signals
2. Write the "first move" (always the same)
3. Create full worked solution
4. Link to related techniques
5. Add 2-3 practice questions
6. Document common traps

**File:** `patterns/PATTERN-ID.json`

### Phase 5: Generate Topic Briefings (30 min)

For each chapter/topic:
1. List key concepts
2. Document formulas
3. Identify common errors
4. Write exam tips
5. Link to techniques

**File:** `topics/TOPIC-ID.json`

### Phase 6: Create SQL Seed (15 min)

Generate SQL file for D1 database:
- Insert course manifest
- Insert technique content
- Insert pattern content
- Insert topic content
- Insert section map

### Phase 7: Validation (15 min)

Run validation checks:
1. Validate JSON against schemas
2. Check LaTeX compiles
3. Verify cross-references exist
4. Check for missing fields
5. Run test suite

---

## ✅ Validation Checklist

Before marking complete, verify:

- [ ] All technique JSON files validate against `TechniqueContentSchema`
- [ ] All pattern JSON files validate against `PatternSchema`
- [ ] All topic JSON files validate against `TopicContentSchema`
- [ ] Manifest TypeScript compiles without errors
- [ ] LaTeX renders correctly (run `npm run test:latex`)
- [ ] All cross-references resolve (techniques → patterns → topics)
- [ ] Each technique has exactly 3 worked examples (easy/medium/hard)
- [ ] Each pattern has at least 2 practice questions
- [ ] SQL seed file runs without errors
- [ ] Content displays correctly in local dev

---

## 🎓 Example: Technique Generation

**Technique ID:** `pcs125-shm-kinematics`  
**Title:** SHM Kinematics  
**Description:** Analyze position, velocity, and acceleration in simple harmonic motion

### Recognition Section
```json
{
  "visualSignals": [
    "Mass oscillating on a spring with amplitude A",
    "Pendulum swinging with small angle approximation",
    "Sinusoidal position vs time graph"
  ],
  "verbalTriggers": [
    "A mass on a spring oscillates with amplitude...",
    "Find the period/frequency of oscillation",
    "Simple harmonic motion"
  ],
  "keyQuantities": [
    "Amplitude A (maximum displacement)",
    "Angular frequency ω = 2πf = √(k/m)",
    "Period T = 2π/ω = 2π√(m/k)"
  ],
  "nonExamples": [
    "Damped oscillations (exponential decay)",
    "Forced oscillations (driving frequency ≠ natural)"
  ]
}
```

### Algorithm Section
```json
{
  "overview": "For SHM problems, identify whether you need kinematic relationships or energy relationships",
  "decisionTree": "If asked for period/frequency → Use T = 2π√(m/k)...",
  "steps": [
    {
      "number": 1,
      "title": "Identify the system type",
      "instruction": "Determine if this is a spring-mass system or pendulum",
      "pitfalls": ["Using pendulum formula for spring-mass"]
    }
    // ... more steps
  ]
}
```

### Common Errors Section
```json
[
  {
    "id": "shm-error-1",
    "symptom": "Student thinks amplitude affects period",
    "diagnosis": "Confusing amplitude with factors that determine period",
    "fix": "Memorize: T = 2π√(m/k) has NO amplitude A in it",
    "example": "Problem: Mass increases 4×, amplitude increases 4×..."
  }
  // ... more errors
]
```

### Worked Example (Medium)
```json
{
  "id": "shm-medium-1",
  "difficulty": "medium",
  "title": "Energy Distribution at Half Amplitude",
  "problem": "A mass-spring system oscillates with amplitude A. At x = A/2, what is K/U?",
  "solution": {
    "steps": [
      {
        "explanation": "Total energy E = ½kA²",
        "math": "$$E = \\frac{1}{2}kA^2$$"
      },
      {
        "explanation": "Potential energy at x = A/2",
        "math": "$$U = \\frac{1}{2}k(\\frac{A}{2})^2 = \\frac{E}{4}$$"
      }
    ],
    "finalAnswer": "K/U = 3"
  },
  "firstMove": "Write E = ½kA², then find U at x = A/2",
  "keyInsight": "At x = A/2, U = E/4 and K = 3E/4"
}
```

---

## 🔧 File Naming Conventions

### Course Manifest
- Format: `{courseId}-manifest.ts`
- Example: `pcs125-manifest.ts`

### Techniques
- Format: `{courseId}-{technique-name}.json`
- Example: `pcs125-shm-kinematics.json`

### Patterns
- Format: `{pattern-id}.json`
- Example: `shm-period-mass-spring.json`

### Topics
- Format: `{courseId}-ch{chapter}-{topic}.json`
- Example: `pcs125-ch1-shm.json`

### SQL Seed
- Format: `{courseId}-content.sql`
- Example: `pcs125-content.sql`

---

## 📂 Output Directory Structure

```
course-generation-output/
├── COURSE-manifest.ts           # Course manifest
├── techniques/
│   ├── technique-1.json
│   ├── technique-2.json
│   └── ... (10-15 files)
├── patterns/
│   ├── pattern-1.json
│   ├── pattern-2.json
│   └── ... (8-10 files)
├── topics/
│   ├── topic-1.json
│   ├── topic-2.json
│   └── ... (8-9 files)
├── COURSE-content.sql           # Database seed
└── validation-report.md         # Validation results
```

---

## 🚀 Quick Start Commands

```bash
# 1. Generate course
claude -p --allowed-tools "Read,Edit,Bash" generate-course.md

# 2. Validate content
cd /home/ubuntu/arkived
npm run validate:techniques
npm run validate:patterns
npm run validate:latex

# 3. Test locally
cd worker && npm run dev:prototype
cd frontend && npm run dev

# 4. Deploy when ready
cd worker
npm run db:migrate:prototype
npx wrangler d1 execute arkived-prototype-db --file=COURSE-content.sql
```

---

## 📞 Need Help?

Reference implementations:
- **MTH240:** `frontend/src/courses/mth240-manifest.ts`
- **PCS125:** (generated - use as example)

Validation:
- Run `npm run validate` to check all content
- Check `worker/src/validation/contentSchemas.ts` for schema details

---

**Remember:** Quality over quantity. One complete, high-quality course is better than 10 rushed ones. Follow the MTH240 archetype exactly.
