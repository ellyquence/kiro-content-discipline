# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-01-27

### Added
- **Fact-check hook** — `fact-check.kiro.hook` validates factual claims on final review
  - Identifies all verifiable assertions (stats, dates, features, quotes)
  - Requires minimum 2 credible references per claim
  - Flags unverifiable, under-sourced, or outdated claims
  - Suggests source types: primary (official docs) preferred over secondary

## [1.1.0] - 2026-01-27

### Added
- **CI: Hook validation workflow** — GitHub Actions validates all `.kiro.hook` files on push/PR
  - Checks JSON syntax
  - Validates required fields (name, when.type, then.type)
- **Local validation script** — `scripts/validate-hooks.sh` for pre-push testing
- **Hook validation hook** — `hook-validation.kiro.hook` validates hook files when edited (dogfooding)

## [1.0.1] - 2026-01-27

### Fixed
- **BREAKING**: Converted all hooks from YAML to JSON format
  - Kiro IDE requires hooks to be valid JSON, not YAML
  - This fixes "invalid JSON syntax" errors when viewing Agent Hooks
  - All 5 hooks updated: readability-check, voice-consistency, seo-compliance, headline-quality, content-brief-check

### Note for existing users
If you installed v1.0.0, re-run the install script or manually copy the updated `.kiro/hooks/` directory.

## [1.0.0] - 2026-01-27

### Added
- Initial release of Kiro Content Discipline Pack

#### Steering Files (7)
- `content-global.md` — Core content philosophy and workflow standards
- `voice-tone.md` — Brand voice guidelines and tone adaptation matrix
- `quality-gates.md` — 6-stage quality checkpoint system
- `seo-eeat.md` — SEO and Google E-E-A-T compliance standards
- `readability.md` — Grade 8 reading level requirements
- `structure-frameworks.md` — AIDA, PAS, BAB, 4Ps content frameworks
- `headlines.md` — Headline formulas, scoring, and best practices

#### Automated Hooks (5)
- `readability-check.kiro.hook` — Grade level and passive voice detection
- `voice-consistency.kiro.hook` — Tone drift and jargon detection
- `seo-compliance.kiro.hook` — E-E-A-T signals and keyword checking
- `headline-quality.kiro.hook` — 6-criteria headline scoring (60-point scale)
- `content-brief-check.kiro.hook` — Brief compliance validation

#### Templates (6)
- `content-brief.md` — Strategic content brief with SEO and audience sections
- `blog-post-outline.md` — Structure template with 25+ headline worksheet
- `voice-profile.md` — Complete brand voice definition template
- `content-checklist.md` — 8-gate pre-publish QA checklist
- `headline-worksheet.md` — Headline brainstorming and scoring guide
- `editorial-calendar.md` — Monthly content planning template

#### Tooling
- `install-kiro-profile.sh` — Install script with symlink support

#### Research Sources
Based on best practices from:
- Mailchimp Content Style Guide
- Google E-E-A-T Guidelines
- Hemingway Editor readability standards
- CoSchedule Headline Analyzer research
- Orbit Media headline formulas
- Siteimprove QA framework

[1.2.0]: https://github.com/ellyquence/kiro-content-discipline/releases/tag/v1.2.0
[1.1.0]: https://github.com/ellyquence/kiro-content-discipline/releases/tag/v1.1.0
[1.0.1]: https://github.com/ellyquence/kiro-content-discipline/releases/tag/v1.0.1
[1.0.0]: https://github.com/ellyquence/kiro-content-discipline/releases/tag/v1.0.0
