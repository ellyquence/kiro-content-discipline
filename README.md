# Kiro Content Discipline Pack

A comprehensive Kiro IDE configuration for **content creation**. Enforces quality gates, voice consistency, SEO best practices, and readability standards for blog posts and long-form content.

## What This Pack Enforces

### 1. Quality-Gated Content Workflow
- **6 mandatory quality gates** from brief to publication
- Multi-stage review: Brief → Outline → Draft → Editorial → SEO → Final
- Clear checklists at each stage

### 2. Voice & Tone Consistency
- Brand voice profile templates
- Automated voice drift detection
- Tone adaptation guidelines by content type

### 3. SEO & E-E-A-T Compliance
- Google's E-E-A-T framework built-in
- On-page SEO checklist
- Schema markup guidance
- Keyword optimization standards

### 4. Readability Standards
- Grade 8 reading level target
- Flesch-Kincaid scoring guidance
- Sentence and paragraph limits
- Active voice enforcement (90%+)

### 5. Proven Content Frameworks
- AIDA (Attention, Interest, Desire, Action)
- PAS (Problem, Agitation, Solution)
- BAB (Before, After, Bridge)
- How-To and Listicle structures

### 6. Headline Excellence
- 25+ headline brainstorming methodology
- 6-criteria scoring system
- Power word banks
- A/B testing templates

## Quick Start

```bash
# Clone this repo
git clone <this-repo-url> ~/kiro-content-discipline

# Install to your content project
cd /path/to/your/content-project
~/kiro-content-discipline/install-kiro-profile.sh

# Or use symlinks (recommended)
~/kiro-content-discipline/install-kiro-profile.sh --symlink
```

## What's Included

```
.kiro/
├── steering/                    # AI behavior rules
│   ├── content-global.md       # Core content philosophy
│   ├── voice-tone.md           # Voice & tone guidelines
│   ├── quality-gates.md        # 6-stage quality checkpoints
│   ├── seo-eeat.md             # SEO & E-E-A-T standards
│   ├── readability.md          # Reading level requirements
│   ├── structure-frameworks.md # AIDA, PAS, BAB frameworks
│   └── headlines.md            # Headline best practices
│
├── hooks/                       # Automated quality checks
│   ├── readability-check.kiro.hook      # Grade level validation
│   ├── voice-consistency.kiro.hook      # Tone drift detection
│   ├── seo-compliance.kiro.hook         # E-E-A-T checklist
│   ├── headline-quality.kiro.hook       # Title scoring
│   └── content-brief-check.kiro.hook    # Brief compliance
│
├── templates/                   # Content templates
│   ├── content-brief.md        # Strategic content brief
│   ├── blog-post-outline.md    # Structure + headline worksheet
│   ├── voice-profile.md        # Brand voice definition
│   ├── content-checklist.md    # Pre-publish QA checklist
│   ├── headline-worksheet.md   # Headline development guide
│   └── editorial-calendar.md   # Planning template
│
├── settings/
│   └── mcp.json                # MCP server configuration
│
└── specs/
    └── .gitkeep                # Your content specs go here
```

## Installation Methods

### Method 1: Copy to Project (Simple)

```bash
./install-kiro-profile.sh /path/to/project

# Force overwrite existing
./install-kiro-profile.sh --force /path/to/project
```

### Method 2: Symlink (Recommended)

```bash
./install-kiro-profile.sh --symlink /path/to/project

# Updates to this repo automatically apply
```

### Method 3: Manual Copy

```bash
mkdir -p /path/to/project/.kiro/{steering,hooks,templates,settings,specs}
cp -r .kiro/steering/* /path/to/project/.kiro/steering/
cp -r .kiro/hooks/* /path/to/project/.kiro/hooks/
cp -r .kiro/templates/* /path/to/project/.kiro/templates/
cp -r .kiro/settings/* /path/to/project/.kiro/settings/
```

## Quality Gates Overview

| Gate | Name | Key Checks |
|------|------|------------|
| 1 | Brief Approved | Audience, keywords, angle, goal |
| 2 | Outline Ready | Headline scored, structure chosen, sources identified |
| 3 | First Draft | Word count, self-review, technical checks |
| 4 | Editorial Review | Voice, accuracy, engagement, clarity |
| 5 | SEO & Technical | Keywords, meta data, E-E-A-T signals, links |
| 6 | Final Approval | Preview check, social ready, promotion planned |

## Content Standards Summary

### Readability Targets
- Flesch-Kincaid Grade Level: **≤ 8**
- Flesch Reading Ease: **≥ 60**
- Average sentence length: **≤ 20 words**
- Maximum paragraph: **5 sentences**
- Active voice: **≥ 90%**

### Headline Requirements
- Character count: **50-60**
- Word count: **6-13**
- Minimum score: **35/60** on criteria
- Brainstorm: **25+ variations**

### SEO Requirements
- Primary keyword in title
- Primary keyword in first 100 words
- Primary keyword in at least one H2
- Internal links: **3-5 minimum**
- External sources: **2-5**

### E-E-A-T Signals Required
- Author byline with bio
- Publication date
- Sources cited for claims
- First-hand experience demonstrated
- Expert credentials shown

## Hooks Behavior

| Hook | Trigger | What It Checks |
|------|---------|----------------|
| `readability-check` | Content file edit | Grade level, sentence length, passive voice |
| `voice-consistency` | Content file edit | Formality, jargon, tone shifts |
| `seo-compliance` | Content file edit | Keywords, headings, links, E-E-A-T |
| `headline-quality` | Content file edit | 6-criteria scoring, length, clarity |
| `content-brief-check` | Content file edit | Brief compliance, required elements |

## Customization

### Override Standards

Create `.kiro/steering/project-overrides.md`:

```markdown
---
inclusion: always
---

# Project-Specific Overrides

## Override: Longer Content
For this publication, we target 3000+ word articles:
- Word count target: 3000-4000 (override 1200-2500)
- Reason: In-depth technical audience

## Override: Higher Reading Level
Technical audience accepts higher complexity:
- Target reading level: Grade 10 (override Grade 8)
```

### Disable a Hook

```bash
mv .kiro/hooks/readability-check.kiro.hook .kiro/hooks/readability-check.kiro.hook.disabled
```

### Add Language-Specific Rules

Create `.kiro/steering/technical-content.md`:

```markdown
---
inclusion: fileMatch
fileMatchPattern: "**/technical/**/*.md"
---

# Technical Content Standards

## Additional Requirements
- Code examples must be tested
- API references must be current
- Screenshots must show latest UI
```

## Research Sources

This discipline pack was built from best practices including:

- [Mailchimp Content Style Guide](https://styleguide.mailchimp.com/)
- [Google's E-E-A-T Guidelines](https://developers.google.com/search/docs/fundamentals/creating-helpful-content)
- [Hemingway Editor Readability Standards](https://hemingwayapp.com/)
- [CoSchedule Headline Analyzer Research](https://coschedule.com/headline-analyzer)
- [Orbit Media Headline Formulas](https://www.orbitmedia.com/blog/writing-headlines/)
- [Siteimprove QA Framework](https://www.siteimprove.com/blog/content-quality-assurance-framework/)

## Troubleshooting

### Hooks not firing
1. Restart Kiro IDE
2. Verify file patterns match your content paths
3. Check hook file extension is `.kiro.hook`

### Steering rules not applying
1. Verify YAML frontmatter syntax
2. Check `inclusion: always` is set
3. Try referencing in chat: `#content-global`

### Templates not showing
1. Check files are in `.kiro/templates/`
2. Verify `.md` extension
3. Restart Kiro IDE

## Contributing

1. Fork this repository
2. Create a feature branch
3. Add your improvements
4. Submit a pull request

## License

Apache 2.0 - See [LICENSE](LICENSE) for details.

---

**Built for content creators who refuse to publish mediocre work.**
