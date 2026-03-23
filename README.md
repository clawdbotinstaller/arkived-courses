# Arkived Courses

Generated course content for the Arkived exam prep platform.

## Source Materials

**Google Drive Folder:** https://drive.google.com/drive/folders/1Px6S_JTshiD24jzTqCl_fFt8_65g9wiT

This drive contains 10-12 courses with past exams, syllabi, and lecture notes to be processed.

## Repository Structure

```
arkived-courses/
├── generated/           # Auto-generated course content
│   ├── COURSE1/
│   │   ├── manifest.ts
│   │   ├── techniques/
│   │   ├── patterns/
│   │   ├── topics/
│   │   └── COURSE1-content.sql
│   └── ...
├── raw/                 # Raw input materials (downloaded from Drive)
├── processing/          # Processing scripts and configs
├── scripts/             # Generation scripts
├── logs/                # Processing logs
└── README.md
```

## Processing Pipeline

The 5-stage pipeline from the [Arkived Course Generation Bundle](https://github.com/clawdbotinstaller/exam-prep-platform/tree/codex/prototype/.agent/course-generation-bundle):

1. **Extract & Parse** - Parse syllabi, extract exam questions from PDFs
2. **Analyze & Identify** - Cluster questions, identify patterns and techniques
3. **Generate Content** - Create techniques, patterns, topic briefings
4. **Process Questions** - Enrich exam questions with metadata
5. **Assemble & SQL** - Create manifest and database seed

## Quick Start

### Download from Google Drive

```bash
# Requires rclone configured with Google Drive
./scripts/download-drive.sh 1Px6S_JTshiD24jzTqCl_fFt8_65g9wiT ./raw
```

### Generate Single Course

```bash
./scripts/generate-course.sh MTH141 ./raw/MTH141 ./generated/MTH141
```

### Generate All Courses (Parallel)

```bash
./scripts/generate-all-courses.sh ./raw ./generated
```

## Generated Courses

| Course | Status | Questions | Techniques | Patterns | SQL |
|--------|--------|-----------|------------|----------|-----|
| | | | | | |

## Subagent Processing

This repo uses Claude Code subagents for parallel course generation:

```bash
# Start continuous generation
./scripts/subagent-harness.sh
```

## Related Repos

- **Main Platform:** https://github.com/clawdbotinstaller/exam-prep-platform
- **Course Generation Bundle:** `.agent/course-generation-bundle/` in main repo

## License

Private - For Arkived platform use only
