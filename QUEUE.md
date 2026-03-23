# Arkived Courses Processing Queue

## Source
**Google Drive:** https://drive.google.com/drive/folders/1Px6S_JTshiD24jzTqCl_fFt8_65g9wiT

## Course Inventory (10-12 courses)

| # | Code | Name | University | Status | Priority | Generated |
|---|------|------|------------|--------|----------|-----------|
| 1 | MTH141 | Calculus 1 | Concordia | 🔴 Pending | 1 | - |
| 2 | MTH240 | Calculus 2 | Concordia | 🔴 Pending | 2 | - |
| 3 | CSC108 | Intro to Programming | UofT | 🔴 Pending | 3 | - |
| 4 | MAT186 | Calculus 1 (Eng) | UofT | 🔴 Pending | 4 | - |
| 5 | MAT187 | Calculus 2 (Eng) | UofT | 🔴 Pending | 5 | - |
| 6 | PHY180 | Classical Mechanics | UofT | 🔴 Pending | 6 | - |
| 7 | CHM135 | Chemistry | UofT | 🔴 Pending | 7 | - |
| 8 | ECO100 | Intro Economics | UofT | 🔴 Pending | 8 | - |
| 9 | STA130 | Statistics | UofT | 🔴 Pending | 9 | - |
| 10 | MAT223 | Linear Algebra | UofT | 🔴 Pending | 10 | - |
| 11 | ? | TBD | - | ⚪ Unknown | - | - |
| 12 | ? | TBD | - | ⚪ Unknown | - | - |

## Processing Status

```
Pending:    10
In Progress: 0
Completed:   0
Failed:      0
```

## Output Structure

Each course generates:
```
generated/{COURSE}/
├── {COURSE}-manifest.ts          # Course manifest
├── {COURSE}-content.sql          # D1 seed file
├── techniques/                    # 10-15 technique JSON files
│   ├── technique-1.json
│   └── ...
├── patterns/                      # 8-10 pattern JSON files
│   ├── pattern-1.json
│   └── ...
├── topics/                        # 8-9 topic JSON files
│   ├── topic-1.json
│   └── ...
├── exams/                         # Enriched exam questions
│   └── enriched-questions.json
└── validation-report.md           # Quality report
```

## Processing Log

| Date | Course | Stage | Result | Notes |
|------|--------|-------|--------|-------|
| - | - | - | - | - |

## Quick Commands

```bash
# Check overall status
cd /home/ubuntu/arkived/.agent/harness && ./status.sh

# Start processing next course
cd /home/ubuntu/arkived/.agent/harness && ./generate-course-now.sh

# Process specific course
cd /home/ubuntu/arkived/.agent/harness && ./generate-course-now.sh MTH141

# View live logs
tail -f /home/ubuntu/arkived/.agent/logs/cron-*.log
```
