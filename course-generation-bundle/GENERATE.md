# Quick Generation Prompt

## Usage

```bash
claude -p --allowed-tools "Read,Edit,Bash" --add-dir /home/ubuntu/arkived/.agent/course-generation-bundle /home/ubuntu/arkived/.agent/course-generation-bundle/GENERATE.md
```

## Task

Generate a complete course for Arkived platform.

### Step 1: Read Reference Materials

Read these files in order:
1. `/home/ubuntu/arkived/docs/forge/mth240-archetype-template.md`
2. `/home/ubuntu/arkived/frontend/src/types/archetypes.ts`
3. `/home/ubuntu/arkived/frontend/src/courses/mth240-manifest.ts`
4. `/home/ubuntu/arkived/worker/src/validation/contentSchemas.ts`

### Step 2: Generate Course

Create a complete course with:
- 10-15 techniques (4-phase learning each)
- 8-10 patterns (4-phase workbench each)
- 8-9 topic briefings
- Course manifest
- SQL seed file

Save all files to:
- `/home/ubuntu/arkived/frontend/public/courses/{courseId}/`
- `/home/ubuntu/arkived/worker/seeds/{courseId}-content.sql`

### Step 3: Validate

Run validation:
```bash
cd /home/ubuntu/arkived
npm run validate:techniques
npm run validate:patterns
npm run validate:latex
```

### Step 4: Report

Create validation-report.md with:
- Techniques generated: X
- Patterns generated: X
- Topics generated: X
- Validation status: PASS/FAIL
- Any errors found

## Output Format

All content must follow the exact structure from MTH240 archetype.
All LaTeX must be valid.
All cross-references must resolve.
