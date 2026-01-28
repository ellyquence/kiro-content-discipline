# How to Customize the Content Discipline Pack

This pack is a starting point, not a prescription. Here's how to adapt it to your needs.

---

## Customization Levels

| Level | What to Change | Difficulty |
|-------|----------------|------------|
| **1. Adjust Standards** | Change numbers (word counts, scores) | Easy |
| **2. Override Rules** | Create project-specific overrides | Easy |
| **3. Modify Voice** | Edit voice-tone.md for your brand | Medium |
| **4. Add Hooks** | Create new automated checks | Medium |
| **5. New Templates** | Add content type templates | Medium |
| **6. New Steering** | Add domain-specific rules | Advanced |

---

## Level 1: Adjust Standards

### Change Readability Target

Edit `.kiro/steering/readability.md`:

```markdown
## Target Reading Level

**Standard**: All content must score **Grade 10 or below**
```

Why you might change this:
- Technical audience → Grade 10-12
- General consumer → Grade 6-8
- Academic → Grade 12+

### Change Word Count Targets

Edit `.kiro/steering/content-global.md`:

```markdown
| Type | Purpose | Typical Length |
|------|---------|----------------|
| Blog Post | Inform/educate | 2,000-4,000 words |  ← Changed from 1,200-2,500
```

### Change Headline Score Minimum

Edit `.kiro/steering/headlines.md`:

```markdown
**Minimum score to publish**: 40/60  ← Changed from 35/60
```

---

## Level 2: Override Rules

Create a project-specific override file that takes precedence.

### Create Override File

Create `.kiro/steering/project-overrides.md` in your content project:

```markdown
---
inclusion: always
---

# Project-Specific Overrides for [Your Publication]

## Readability Override
For our technical developer audience:
- Target reading level: Grade 10 (override default Grade 8)
- Jargon OK when audience expects it

## Word Count Override
Our long-form publication standard:
- Blog posts: 2,500-4,000 words (override 1,200-2,500)
- Reason: Deep-dive technical content

## Voice Override
More formal than default:
- Formality: 5/10 (override 3/10)
- Fewer contractions in headers
- Technical precision over casual tone

## Headline Override
Higher bar for our publication:
- Minimum score: 40/60 (override 35/60)
```

### How Overrides Work

Kiro reads ALL steering files with `inclusion: always`. Later files and explicit "override" language take precedence. Be explicit about what you're changing and why.

---

## Level 3: Modify Voice

### Option A: Edit the Pack Voice File

If you own the pack (installed via copy, not symlink):

Edit `.kiro/steering/voice-tone.md` directly.

### Option B: Create Your Own Voice File

Create `.kiro/steering/my-brand-voice.md`:

```markdown
---
inclusion: always
---

# [Your Brand] Voice Guidelines

## Voice Attributes

### Formality: 6/10
We're professional but approachable. Use contractions sparingly.
More formal than casual blogs, less formal than academic writing.

### Enthusiasm: 4/10
Measured and confident. We don't use exclamation points.
Let the content speak for itself.

### Humor: 2/10
Rarely. Only dry wit when it serves the point.
Never puns or jokes.

### Authority: 8/10
We are the experts. Speak with confidence.
"Here's what you need to know" not "I think maybe..."

## Words We Use
- Implement, execute, deploy
- Strategy, framework, methodology
- Results, outcomes, impact

## Words We Avoid
- Awesome, amazing, incredible
- Just, simply, easily
- Game-changer, revolutionary
```

---

## Level 4: Add Hooks

### Hook File Format

> **Important:** Hooks are project-only. Unlike steering files, hooks do NOT load from global locations. You must copy hooks to each project's `.kiro/hooks/` folder.

Create `.kiro/hooks/my-custom-hook.kiro.hook`:

```json
{
  "enabled": true,
  "name": "My Custom Check",
  "description": "What this hook validates",
  "version": "1",
  "when": {
    "type": "fileEdited",
    "patterns": ["content/**/*.md"]
  },
  "then": {
    "type": "askAgent",
    "prompt": "Your prompt to the agent here.\n\nCheck for:\n1. [Specific thing to check]\n2. [Another thing to check]\n\nOutput format:\n[How you want results formatted]"
  }
}
```

**Required fields:**
- `enabled`: Must be `true` for hook to activate
- `version`: Use `"1"`
- `when.type`: `fileEdited`, `fileCreated`, `fileDeleted`, `promptSubmit`, or `agentStop`

### Example: Brand Mention Check

```json
{
  "enabled": true,
  "name": "Brand Mention Consistency",
  "description": "Ensures brand names are capitalized correctly",
  "version": "1",
  "when": {
    "type": "fileEdited",
    "patterns": ["content/**/*.md"]
  },
  "then": {
    "type": "askAgent",
    "prompt": "Check this content for brand name consistency.\n\nOur brand names (correct capitalization):\n- Kiro (not KIRO, kiro)\n- Claude (not CLAUDE, claude)\n- GitHub (not Github, github)\n\nFlag any incorrect capitalizations with line numbers.\n\nOutput:\n- If all correct: \"✓ Brand names consistent\"\n- If issues: List each with line number and correction"
  }
}
```

### Example: Competitor Mention Alert

```json
{
  "enabled": true,
  "name": "Competitor Mention Alert",
  "description": "Flags mentions of competitors for review",
  "version": "1",
  "when": {
    "type": "fileEdited",
    "patterns": ["content/**/*.md"]
  },
  "then": {
    "type": "askAgent",
    "prompt": "Scan for mentions of these competitors:\n- Cursor\n- Copilot\n- Windsurf\n- Cody\n\nIf found, flag for review (not an error, just awareness).\n\nOutput:\n- Competitor: [name]\n- Line: [number]\n- Context: [surrounding text]\n- Tone check: [positive/negative/neutral]"
  }
}
```

### Example: CTA Presence Check

```json
{
  "enabled": true,
  "name": "CTA Presence Check",
  "description": "Ensures every post has a clear call-to-action",
  "version": "1",
  "when": {
    "type": "fileEdited",
    "patterns": ["content/**/*.md"]
  },
  "then": {
    "type": "askAgent",
    "prompt": "Check if this content has a clear call-to-action (CTA).\n\nValid CTAs include:\n- Subscribe prompts\n- Links to related content\n- Download/signup invitations\n- Social share requests\n- Comment invitations\n\nOutput:\n- CTA Found: Yes/No\n- CTA Type: [type]\n- CTA Location: [beginning/middle/end]\n- CTA Clarity: [clear/vague/missing]\n\nIf no CTA found, suggest appropriate options based on content."
  }
}
```

---

## Level 5: New Templates

### Create a Template

Add to `.kiro/templates/my-template.md`:

```markdown
# [Template Name]

## Section 1
[Description or placeholder]

### Subsection
- [ ] Checklist item
- [ ] Another item

## Section 2
**Field**: [Fill this in]
**Another Field**: [Fill this in]

---

## Notes
[Instructions for using this template]
```

### Example: Newsletter Brief Template

`.kiro/templates/newsletter-brief.md`:

```markdown
# Newsletter Brief: [Issue Title]

## Overview
**Issue Number**: #
**Send Date**: [Date]
**Theme**: [Theme]

---

## Sections

### 1. Opening Hook
**Goal**: Get them to keep reading
**Approach**: [Story/Question/Statistic/News]

Content notes:
[What to write about]

### 2. Main Content
**Topic**: [Primary topic]
**Word Count**: ~500 words
**Key Takeaway**: [One sentence]

### 3. Quick Hits
- [ ] Item 1: [Topic]
- [ ] Item 2: [Topic]
- [ ] Item 3: [Topic]

### 4. CTA
**Primary**: [What action]
**Link**: [URL]

---

## Subject Line Candidates
1.
2.
3.
4.
5.

**Winner**:

---

## Preview Text
[The snippet that shows after subject line - 40-90 chars]

---

## Checklist
- [ ] Subject line finalized
- [ ] Preview text written
- [ ] All links tested
- [ ] Images have alt text
- [ ] Send time scheduled
- [ ] Segment selected
```

### Example: Case Study Template

`.kiro/templates/case-study.md`:

```markdown
# Case Study: [Client/Project Name]

## Quick Facts
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| [KPI 1] | | | |
| [KPI 2] | | | |
| [KPI 3] | | | |

---

## The Challenge
**Client**: [Who]
**Industry**: [What]
**Problem**: [1-2 sentences]

[Expanded problem description - what was broken, what was at stake]

## The Solution
**Approach**: [1-2 sentences]

### What We Did
1. [Step 1]
2. [Step 2]
3. [Step 3]

### Key Decisions
- [Decision 1 and why]
- [Decision 2 and why]

## The Results

### Quantitative
[Numbers, percentages, metrics]

### Qualitative
[Testimonials, behavior changes, unexpected benefits]

## Key Takeaways
1. [Lesson 1]
2. [Lesson 2]
3. [Lesson 3]

---

## Pull Quotes
> "[Best quote from client]"
> — [Name, Title]

---

## CTA
[What should reader do next?]
```

---

## Level 6: New Steering Files

### Content-Type Specific Rules

Create `.kiro/steering/newsletter-standards.md`:

```markdown
---
inclusion: fileMatch
fileMatchPattern: "**/newsletters/**/*.md"
---

# Newsletter Content Standards

## Length Limits
- Total newsletter: 500-800 words
- Opening hook: 50-100 words
- Main section: 300-500 words
- Quick hits: 3-5 items, 20 words each

## Structure Requirements
Every newsletter MUST have:
1. Subject line (tested, <50 chars)
2. Preview text (40-90 chars)
3. Opening hook (first 2 sentences crucial)
4. Clear CTA
5. Unsubscribe-friendly tone

## Subject Line Rules
- No ALL CAPS
- No excessive punctuation!!!
- Must work without preview text
- A/B test when possible
```

### Platform-Specific Rules

Create `.kiro/steering/substack-specific.md`:

```markdown
---
inclusion: always
---

# Substack-Specific Standards

## Formatting
- Use Substack's native formatting (not raw HTML)
- Images: Use Substack's image upload (not external URLs)
- Buttons: Use Substack's button component for CTAs

## Subscriber Considerations
- Free vs. paid content markers
- Paywall placement (if applicable)
- Cross-post awareness

## Growth Patterns
- End with engagement prompt (comment/share)
- Reference previous posts when relevant
- Use Substack Notes for promotion
```

---

## Disabling Features

### Disable a Hook Temporarily

```bash
# Rename to disable
mv .kiro/hooks/readability-check.kiro.hook .kiro/hooks/readability-check.kiro.hook.disabled

# Rename back to enable
mv .kiro/hooks/readability-check.kiro.hook.disabled .kiro/hooks/readability-check.kiro.hook
```

### Disable a Steering File

You can't disable `inclusion: always` files, but you can override them completely:

```markdown
---
inclusion: always
---

# Override: Disable Headline Scoring

For this project, we're not using the headline scoring system.
Ignore all headline scoring requirements from headlines.md.
```

---

## Best Practices

### 1. Document Your Changes
Add comments explaining WHY you changed something:

```markdown
## Readability Override
- Target: Grade 10 (not Grade 8)
- Reason: Developer audience expects technical language
- Approved by: [Name] on [Date]
```

### 2. Test Before Committing
After any customization:
1. Create a test content file
2. Verify hooks fire correctly
3. Check Kiro applies your overrides
4. Restart Kiro IDE if needed

### 3. Version Your Customizations
If using symlinks, keep customizations in your project repo, not the pack repo:

```
your-project/
├── .kiro/                    → symlink to pack
├── .kiro-overrides/          ← your customizations (copy to .kiro/ via script)
```

### 4. Share What Works
If you create useful hooks or templates, consider contributing back to the pack.

---

## Migration Notes

### Updating the Pack

If you installed via symlink:
```bash
cd ~/kiro-content-discipline
git pull
```
Your project automatically gets updates.

If you installed via copy:
```bash
# Backup your customizations first!
cp -r .kiro/steering/project-overrides.md ./backup/
~/kiro-content-discipline/install-kiro-profile.sh --force
# Restore customizations
cp ./backup/project-overrides.md .kiro/steering/
```

### Breaking Changes
Check `CHANGELOG.md` before updating for any breaking changes to steering file formats or hook patterns.
