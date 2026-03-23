# Complete Course Materials Transfer

## Rsync Destination

**Target directory:** `/home/ubuntu/courses/raw/complete/`

**Example rsync command:**
```bash
rsync -avz --progress "2nd TERM.zip" ubuntu@your-server:/home/ubuntu/courses/raw/complete/
```

## Post-Transfer Steps

After the zip file arrives:

1. **Extract the zip:**
   ```bash
   cd /home/ubuntu/courses/raw/complete
   ./extract-and-organize.sh
   ```

2. **Organize into course folders:**
   ```bash
   ./organize.sh
   ```

3. **Verify and update queue:**
   ```bash
   cd /home/ubuntu/arkived/.agent/harness
   ./status.sh
   ```

## Expected Contents

The zip should contain:
- `_General_/` - ECN801, MTH240, PCS125
- `Aerospace/` - AER222
- `Chemical/` - CHE200
- `Civil/` - CVL207
- `Computer - Electrical - Biomedical/` - ELE202, COE501
- `Mechanical - Mechatronics - Industrial/` - MEC222, MTL200

Total expected: 200+ PDF files

## Current Status

```
/home/ubuntu/courses/raw/
├── complete/           # <- Transfer zip here
├── 2nd TERM/          # Partial download (reference)
├── ECN801/            # 14 PDFs (ready)
├── MTH240/            # 61 PDFs (archetype)
└── PCS125/            # 29 PDFs (completed)
```
