---
inclusion: always
---

# Content Hooks Check

## First-Run Hook Verification

When starting a new session or when the user mentions "content", "blog", "post", or "writing":

1. **Check if hooks exist** in `.kiro/hooks/` directory
2. **If hooks are missing or incomplete**, inform the user:

   ```
   Content discipline hooks not found in this project.

   To install, run:
   ~/kiro-content-discipline/install-hooks.sh

   Or manually copy from:
   https://github.com/ellyquence/kiro-content-discipline
   ```

3. **Expected hooks** for content discipline (7 total):
   - `readability-check.kiro.hook`
   - `voice-consistency.kiro.hook`
   - `seo-compliance.kiro.hook`
   - `headline-quality.kiro.hook`
   - `content-brief-check.kiro.hook`
   - `fact-check.kiro.hook`
   - `hook-validation.kiro.hook`

## Why Hooks Matter

Hooks provide automated quality gates that fire when you save content files. Without them, you lose:
- Readability scoring (Grade 8 target)
- Voice/tone drift detection
- SEO and E-E-A-T compliance checks
- Headline quality scoring
- Brief compliance validation
- Fact-checking with source requirements

Steering files alone provide guidance; hooks provide enforcement.
