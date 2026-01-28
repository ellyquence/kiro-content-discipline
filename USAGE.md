# How to Use the Kiro Content Discipline Pack

This guide walks you through using the content discipline pack for your blog/content workflow.

---

## Quick Start (5 minutes)

### 1. Install to Your Project

```bash
# Clone the pack (if you haven't)
git clone https://github.com/ellyquence/kiro-content-discipline.git ~/kiro-content-discipline

# Install to your content project (symlink recommended)
cd ~/your-content-project
~/kiro-content-discipline/install-kiro-profile.sh --symlink
```

### 2. Create Your Folder Structure

```bash
mkdir -p content/{drafts,published,briefs} assets/{featured,inline,social}
```

### 3. Open in Kiro IDE

Open your content project folder in Kiro IDE. The steering files activate automatically.

---

## The Content Workflow

### Phase 1: Plan (Before Writing)

**Create a Content Brief**

1. In Kiro, use `Kiro: New Spec` command (Cmd/Ctrl + Shift + P)
2. Select `content-brief` template
3. Fill out the brief:
   - Target audience
   - Keywords
   - Content goal
   - Unique angle
   - Structure framework (AIDA, PAS, etc.)

**Example conversation with Kiro:**
```
You: I want to write a post about why developers should try Kiro

Kiro: Let me help you create a content brief. Based on the steering files,
I'll walk you through the key elements...
```

### Phase 2: Outline (Structure First)

**Create Your Outline**

1. Use `Kiro: New Spec` → select `blog-post-outline`
2. Brainstorm 25+ headlines (yes, really — this is in the steering rules)
3. Score your top 5 headlines using the 6-criteria system
4. Build your H2/H3 structure

**Headline Scoring (from headlines.md steering):**

| Criterion | What to Check | Score |
|-----------|---------------|-------|
| Clarity | Immediately understandable? | /10 |
| Specificity | Concrete promise? | /10 |
| Emotion | Creates feeling? | /10 |
| Curiosity | Want to know more? | /10 |
| Benefit | Value clear? | /10 |
| Uniqueness | Stands out? | /10 |
| **TOTAL** | **Minimum 35 to publish** | **/60** |

### Phase 3: Draft (Write with Hooks Active)

**Start Writing**

Create your draft file:
```bash
touch content/drafts/my-post-title.md
```

As you write, **hooks automatically check**:

| Hook | What It Checks | When It Fires |
|------|----------------|---------------|
| `readability-check` | Grade level, sentence length, passive voice | On save |
| `voice-consistency` | Tone drift, jargon, formality shifts | On save |
| `headline-quality` | Title scoring against 6 criteria | On save |
| `seo-compliance` | Keywords, headings, E-E-A-T signals | On save |
| `content-brief-check` | Alignment with approved brief | On save |

**What You'll See:**

When you save a content file, Kiro will analyze it and show feedback like:

```
READABILITY REPORT
==================
Estimated Grade Level: 7.2 ✓
Average Sentence Length: 16 words ✓
Passive Voice: 8% ✓

STATUS: PASS
```

Or if there are issues:

```
VOICE CONSISTENCY REPORT
========================
Problematic Words Found:
- Line 42: "utilize" → Suggest: "use"
- Line 67: "leverage" → Suggest: "use" or "build on"

Tone Issues:
- Paragraph 3 shifts to formal tone unexpectedly

RECOMMENDATION: Revise voice issues before editorial review
```

### Phase 4: Review (Quality Gates)

**Self-Review Checklist**

Use `Kiro: New Spec` → select `content-checklist` for the full pre-publish QA.

Key gates from `quality-gates.md`:

1. **Gate 3: First Draft Complete**
   - [ ] All outline sections written
   - [ ] Word count within 10% of target
   - [ ] Readability ≤ Grade 8
   - [ ] Passive voice < 10%

2. **Gate 4: Editorial Review**
   - [ ] Voice matches brand guidelines
   - [ ] Facts verified
   - [ ] Engagement hooks present

3. **Gate 5: SEO & Technical**
   - [ ] Primary keyword in title, first 100 words, and one H2
   - [ ] Meta title 50-60 characters
   - [ ] Internal links: 3-5 minimum

### Phase 5: Publish (Final Checks)

**Before Publishing:**

```
You: Review this post for final publish readiness

Kiro: [Runs through Gate 6 checklist]
- ✓ All quality gates passed
- ✓ Meta title: 58 characters
- ✓ Meta description: 155 characters
- ⚠ Missing: Featured image alt text
- ✓ Internal links: 4 found
- ✓ External sources: 3 cited

Ready for publication with 1 minor fix needed.
```

**Move to Published:**
```bash
mv content/drafts/my-post.md content/published/2026-01-27-my-post.md
```

---

## Talking to Kiro About Content

### Useful Prompts

**Planning:**
```
"Help me create a content brief for a post about [topic]"
"What framework should I use for [goal]? AIDA or PAS?"
"Who's the target audience for [topic]?"
```

**Writing:**
```
"Check the readability of this section"
"Is my voice consistent throughout?"
"Help me strengthen this headline"
```

**Reviewing:**
```
"Run the quality gate checklist on this draft"
"What E-E-A-T signals am I missing?"
"Check my SEO compliance"
```

**Improving:**
```
"This sentence is too long - help me break it up"
"Find passive voice in this post"
"Suggest power words for this headline"
```

### Kiro Knows Your Standards

Because the steering files are loaded, Kiro automatically knows:

- Your readability target is Grade 8
- Headlines need 35+/60 score
- Active voice should be 90%+
- You use AIDA/PAS frameworks
- E-E-A-T signals are required

You don't need to remind it — just ask for help and it applies the standards.

---

## Templates Reference

| Template | When to Use | Command |
|----------|-------------|---------|
| `content-brief` | Starting a new post | `Kiro: New Spec` |
| `blog-post-outline` | Structuring your post | `Kiro: New Spec` |
| `headline-worksheet` | Brainstorming titles | `Kiro: New Spec` |
| `content-checklist` | Pre-publish review | `Kiro: New Spec` |
| `voice-profile` | Defining brand voice | `Kiro: New Spec` |
| `editorial-calendar` | Planning content | `Kiro: New Spec` |

---

## Steering Files Reference

These are always active when working on content:

| File | What It Enforces |
|------|------------------|
| `content-global.md` | Core workflow, file organization, definition of done |
| `voice-tone.md` | Voice attributes, tone adaptation, word choice |
| `quality-gates.md` | 6-stage checkpoint system |
| `seo-eeat.md` | SEO checklist, E-E-A-T requirements |
| `readability.md` | Grade 8 target, sentence/paragraph limits |
| `structure-frameworks.md` | AIDA, PAS, BAB, How-To frameworks |
| `headlines.md` | Headline formulas, scoring system |

---

## Tips for Success

### 1. Start with the Brief
Don't skip it. The brief forces you to think about audience and angle before writing.

### 2. Trust the Headline Process
25 headlines feels excessive until you realize headline #23 is the winner.

### 3. Let Hooks Interrupt You
When a hook fires with feedback, fix it immediately. Don't accumulate issues.

### 4. Use the Checklists
The quality gates exist to catch things before publish. Use them.

### 5. Iterate on Voice
Your first few posts will help you refine the voice profile. Update it as you learn.

---

## Common Issues

### "Hooks aren't firing"
1. Restart Kiro IDE
2. Check your file is in a matching path (`content/**/*.md`)
3. Verify `.kiro/hooks/` contains the hook files

### "Readability score too high"
- Break long sentences (target: <20 words)
- Replace complex words with simpler alternatives
- Use more bullet points and short paragraphs

### "Voice inconsistency flagged"
- Check for sudden formality shifts
- Remove jargon or explain it
- Read aloud — if it sounds wrong, it probably is

### "Headline score too low"
- Add specificity (numbers, outcomes)
- Include a benefit or curiosity hook
- Try a different formula from `headlines.md`
