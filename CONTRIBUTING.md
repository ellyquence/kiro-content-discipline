# Contributing to Kiro Content Discipline Pack

Thank you for your interest in contributing! This project enforces content creation quality standards through Kiro IDE configuration.

## Ways to Contribute

- **Report issues** — Found a bug in a hook or steering file?
- **Suggest standards** — Ideas for new content quality practices
- **Add steering files** — Content-type specific or industry-specific rules
- **Create hooks** — Automated quality checks
- **Improve templates** — Content workflow templates

## Getting Started

1. **Fork** this repository
2. **Clone** your fork locally
3. **Create a branch**: `git checkout -b feature/my-improvement`
4. **Make changes** and test in Kiro IDE
5. **Commit** with a clear message
6. **Push** and open a Pull Request

## File Structures

### Steering Files

```markdown
---
inclusion: always
# OR
inclusion: fileMatch
fileMatchPattern: "**/blog/**/*.md"
---

# Rule Category

## Rule Name
Clear description of the rule and why it matters for content quality.
```

### Hook Files

```yaml
name: Hook Name
description: What this hook checks

when:
  type: fileEdit
  patterns:
    - "content/**/*.md"
    - "blog/**/*.md"

then:
  type: askAgent
  prompt: |
    Your quality check prompt here.
```

### Templates

- Use `[Placeholder]` syntax for fill-in sections
- Include clear instructions and examples
- Follow existing template conventions
- Focus on actionable, practical guidance

## Content Standards for Contributions

When adding content-related rules, ensure:

1. **Evidence-based** — Cite sources for best practices
2. **Actionable** — Rules should be checkable and enforceable
3. **Measurable** — Include specific metrics where possible
4. **Industry-proven** — Based on recognized content marketing practices

## Testing Your Changes

1. Install to a test project: `./install-kiro-profile.sh /path/to/test`
2. Open the project in Kiro IDE
3. Verify steering rules appear in chat context
4. Create test content files to trigger hooks
5. Confirm templates appear in "Kiro: New Spec"

## Areas We're Looking For

### New Steering Files
- Industry-specific content standards (SaaS, ecommerce, B2B)
- Content-type specific rules (newsletters, whitepapers, social)
- Platform-specific guidelines (Medium, Substack, WordPress)

### New Hooks
- Fact-checking prompts
- Brand voice matching
- Competitive content analysis
- Content freshness checks

### New Templates
- Different content formats (newsletter, whitepaper, ebook)
- Audience research templates
- Content audit checklists
- Repurposing workflows

## Code of Conduct

- Be respectful and constructive
- Focus on content quality, not personal preferences
- Provide rationale and sources for suggested standards
- Help newcomers understand content best practices

## Questions?

Open an issue with the "question" label.
