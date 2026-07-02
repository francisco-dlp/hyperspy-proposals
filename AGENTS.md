# AGENTS.md — HyperSpy Proposals

## Purpose

This is the central proposals repository for the [hyperspy](https://github.com/hyperspy) GitHub organization. It hosts markdown proposals for changes to `hyperspy/hyperspy`, `hyperspy/rosettasciio`, `hyperspy/hspy-spec`, and `hyperspy/hyperspy-ml`.

## Workflow for AI Agents

1. **Check for existing proposals** — search this repository for proposals related to your task before writing code.
2. **Create a proposal** — if no proposal exists for a non-trivial AI-assisted change, create one before writing code. Submit it as a PR.
3. **Follow accepted proposals** — if a proposal exists and is accepted, follow the plan and reference it in your implementation PR.
4. **Include attribution** — use the `Assisted-by: <tool>:<model>` trailer in all commits, per HyperSpy's AGENTS.md.

## Proposal Format

Each proposal is a markdown file named `<PR_NUMBER>-<short-slug>.md` with a YAML frontmatter block:

```yaml
---
proposal: 0001
title: "Human-readable title"
type: Architecture          # Architecture | Feature | Bugfix | Process
target_branch: hyperspy/hyperspy:RELEASE_next_minor
target_repos: [hyperspy/hyperspy, hyperspy/rosettasciio]
status: review              # review | accepted | implemented | superseded
ai_assisted: true
created: 2026-07-01
---
```

## CI Checks

Every PR runs these checks:

- **markdownlint** — consistent formatting.
- **link-check** — no broken URLs.
- **frontmatter-validation** — YAML metadata block is present, fields are valid, proposal number matches filename.
- **ai-trailer** — commits include `Assisted-by: <tool>:<model>` trailers.

Run checks locally with `pixi run check` (see the [README](README.md#running-checks-locally)).
