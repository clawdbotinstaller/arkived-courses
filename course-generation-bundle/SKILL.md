# Arkived Course Generator

A comprehensive skill for generating complete university courses for the Arkived exam prep platform from raw materials (syllabi, past exams, lecture notes).

---

## Installation

```bash
# Option 1: Copy to Claude skills directory
cp -r /home/ubuntu/arkived/.agent/course-generation-bundle ~/.config/claude/skills/arkived-course-generator

# Option 2: Create symlink for development
ln -s /home/ubuntu/arkived/.agent/course-generation-bundle ~/.config/claude/skills/arkived-course-generator
```

---

## Usage

### Quick Start

```
Generate a course for COURSE_CODE from INPUT_DIRECTORY
```

### Full Command

```
Generate a complete course for {course_code} using materials in {input_directory}.

Course Details:
- Code: {course_code}
- Name: {course_name}
- University: {university}

Input Materials:
- Syllabus: {input_directory}/syllabus.pdf
- Exams: {input_directory}/exams/*.pdf
- Solutions: {input_directory}/solutions/*.pdf (optional)
- Notes: {input_directory}/notes/*.pdf (optional)

Follow the 5-stage processing pipeline:
1. Extract & Parse - Parse syllabus, extract exam questions
2. Analyze & Identify - Identify patterns and techniques from questions
3. Generate Content - Create techniques, patterns, topic briefings
4. Process Questions - Enrich exam questions with metadata
5. Assemble & SQL - Create manifest and database seed

Save all outputs to:
- Manifest: /home/ubuntu/arkived/frontend/src/courses/{course_code}-manifest.ts
- Content: /home/ubuntu/arkived/frontend/public/courses/{course_code}/
- SQL: /home/ubuntu/arkived/worker/seeds/{course_code}-content.sql

Validate all content before completing.
```

---

## Processing Pipeline

### Stage 1: Extract & Parse
**Duration:** 30 minutes

Parse raw materials into structured data:
- **Syllabus:** Extract course info, topics, learning objectives
- **Exams:** Extract questions with text, marks, topic
- **Solutions:** Extract solutions and match to questions

**Output:** `stage1-extracted-data.json`

### Stage 2: Analyze & Identify
**Duration:** 45 minutes

Analyze extracted data to identify:
- **Patterns:** Recurring problem types (e.g., "SHM Period Calculation")
- **Techniques:** Core skills needed (e.g., "SHM Kinematics")
- **Topic Mapping:** Which techniques belong to which topics
- **Frequency Scores:** How often each technique appears

**Output:** `stage2-analysis.json`

### Stage 3: Generate Content
**Duration:** 3 hours

Generate all pedagogical content:

#### Techniques (10-15 files)
Each technique includes:
- Recognition triggers (visual + verbal signals)
- Algorithm with decision tree
- 3 worked examples (easy/medium/hard)
- 3-5 common errors with fixes
- Drill sets for practice
- Cheat sheet with formulas

#### Patterns (8-10 files)
Each pattern includes:
- Recognition signals
- First move (always the same)
- Full worked solution
- Practice questions
- Common traps

#### Topic Briefings (8-9 files)
Each topic includes:
- Key concepts
- Formulas with LaTeX
- Common errors
- Exam tips
- Related techniques

**Output:** JSON files in `techniques/`, `patterns/`, `topics/`

### Stage 4: Process Questions
**Duration:** 30 minutes

Enrich extracted exam questions with:
- Topic and technique IDs
- Pattern references
- Solution steps
- Difficulty ratings
- Time estimates
- Common mistakes

**Output:** `stage4-enriched-questions.json`

### Stage 5: Assemble & Generate SQL
**Duration:** 15 minutes

Create final deliverables:
- Course manifest (TypeScript)
- SQL seed file for D1 database
- Validation report

**Output:** `COURSE-manifest.ts`, `COURSE-content.sql`

---

## Content Structure

### Technique JSON Schema
```json
{
  "id": "course-technique-name",
  "title": "Display Title",
  "description": "One-line description",
  "recognition": {
    "visualSignals": [...],
    "verbalTriggers": [...],
    "keyQuantities": [...],
    "nonExamples": [...]
  },
  "algorithm": {
    "overview": "...",
    "decisionTree": "...",
    "steps": [...]
  },
  "commonErrors": [...],
  "workedExamples": {
    "easy": {...},
    "medium": {...},
    "hard": {...}
  },
  "drillSets": {...},
  "cheatSheet": {...}
}
```

### Pattern JSON Schema
```json
{
  "id": "pattern-name",
  "name": "Display Name",
  "description": "...",
  "recognition": {
    "signals": [...],
    "keyPhrases": [...]
  },
  "firstMove": "...",
  "fullSolution": {...},
  "relatedTechniques": [...],
  "practiceQuestions": [...],
  "commonTraps": [...]
}
```

### Topic Briefing Schema
```json
{
  "id": "course-ch-topic",
  "title": "Topic Name",
  "description": "...",
  "keyConcepts": [...],
  "formulas": [...],
  "commonErrors": [...],
  "examTips": [...],
  "relatedTechniques": [...]
}
```

---

## Reference Materials

Before generating, always read:

1. **Archetype Definition:** `docs/forge/mth240-archetype-template.md`
   - Defines the exact structure to follow
   - Explains navigation architecture
   - Details 4-phase learning model

2. **Type Definitions:** `frontend/src/types/archetypes.ts`
   - TypeScript interfaces for all content
   - Validation requirements

3. **MTH240 Manifest:** `frontend/src/courses/mth240-manifest.ts`
   - Reference implementation
   - Gold standard to emulate

4. **Validation Schemas:** `worker/src/validation/contentSchemas.ts`
   - Zod schemas for runtime validation
   - Required fields and types

---

## Quality Standards

All generated content must meet:

### Pedagogical Accuracy
- [ ] All formulas are correct
- [ ] Explanations are clear
- [ ] Common errors reflect real mistakes
- [ ] Examples progress from easy to hard

### LaTeX Formatting
- [ ] Inline math: `$...$`
- [ ] Display math: `$$...$$`
- [ ] Proper subscripts: `x_{max}`
- [ ] Greek letters: `\omega`, `\phi`
- [ ] Units: `\text{m/s}`

### Exam Authenticity
- [ ] Matches real university exam style
- [ ] Includes various question types
- [ ] References actual exam questions
- [ ] Progressive difficulty

### Completeness
- [ ] All techniques have 3 worked examples
- [ ] All patterns have 2+ practice questions
- [ ] All topics link to techniques
- [ ] All cross-references resolve

---

## Output Locations

| Content Type | File Path |
|--------------|-----------|
| Course Manifest | `frontend/src/courses/{course}-manifest.ts` |
| Techniques | `frontend/public/courses/{course}/techniques/*.json` |
| Patterns | `frontend/public/courses/{course}/patterns/*.json` |
| Topics | `frontend/public/courses/{course}/topics/*.json` |
| SQL Seed | `worker/seeds/{course}-content.sql` |

---

## Validation Commands

```bash
# Validate techniques
cd /home/ubuntu/arkived && npm run validate:techniques

# Validate patterns
cd /home/ubuntu/arkived && npm run validate:patterns

# Validate LaTeX
cd /home/ubuntu/arkived && npm run test:latex

# Run all tests
cd /home/ubuntu/arkived && npm test

# Test local dev
cd worker && npm run dev:prototype
cd frontend && npm run dev
```

---

## Example Output

### Generated Course: PCS125
- **12 Techniques** (SHM, Waves, Electrostatics, Circuits, Magnetism, etc.)
- **8 Patterns** (SHM Period, Coulomb Superposition, etc.)
- **9 Topics** (chapters 1-4)
- **412 Exam Questions** with solutions
- **Complete SQL Seed** ready for import

### Time Breakdown
- Parse & Extract: 30 min
- Analyze: 45 min
- Generate Content: 3 hours
- Process Questions: 30 min
- Assemble: 15 min
- **Total: 5 hours**

---

## Troubleshooting

**Extraction Fails:**
- Check PDF is text-based (not scanned images)
- Use OCR if needed: `ocrmypdf input.pdf output.pdf`

**Pattern Detection Poor:**
- Need more exam data (minimum 3-5 years)
- Manual review of clusters recommended

**Validation Errors:**
- Check `worker/src/validation/contentSchemas.ts`
- Ensure all required fields present
- Verify JSON syntax

**LaTeX Errors:**
- Run `npm run test:latex`
- Check for proper escaping
- Validate with online LaTeX editor

---

## Version

**v2.0.0** - Complete processing pipeline
- 5-stage generation workflow
- PDF extraction support
- Pattern clustering
- Automatic SQL generation

---

## See Also

- `PROMPT.md` - Complete agent instructions
- `PROCESSING.md` - Detailed processing pipeline
- `GENERATE.md` - Quick-start prompt
- `README.md` - Overview and examples
