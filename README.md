# HyperSpy Proposals

This repository hosts proposals for changes to the HyperSpy ecosystem — including `hyperspy/hyperspy`, `hyperspy/rosettasciio`, `hyperspy/hspy-spec`, `hyperspy/hyperspy-ml`, and extension packages (`LumiSpy/lumispy`, `pyxem/pyxem`, `pyxem/kikuchipy`, `hyperspy/exspy`, etc.).

## When is a proposal required?

| Contribution type | Proposal required? |
|---|---|
| **AI-assisted, non-trivial** | **Yes** — implementation PRs will not be reviewed without an accepted proposal |
| **AI-assisted, trivial** | No — the PR review is sufficient |
| **Human-only, non-trivial** | **Recommended** — not mandatory, but strongly encouraged for large changes |
| **Human-only, trivial** | No — the PR review is sufficient |

### Why require proposals for AI-assisted contributions?

AI coding tools can generate large amounts of code quickly. A proposal gives the community a chance to review the **approach** before reviewing the **implementation** — much cheaper to fix a wrong approach in a markdown file than in hundreds of lines of code. It also creates an audit trail: "this AI-generated change was reviewed and approved."

## How to submit a proposal

1. **Create a markdown file** named `<PR_NUMBER>-<short-slug>.md` (e.g., `0042-hspy-spec.md`). Use the PR number you'll get when you open the PR — if unsure, use a placeholder and rename after.

1. **Start the file with a YAML metadata block:**

   ```yaml
   ---
   proposal: 0042
   title: "hspy-spec — a metadata specification system for HyperSpy 3.0"
   type: Architecture          # Architecture | Feature | Bugfix | Process
   target_branch: hyperspy/hyperspy:RELEASE_next_major
   target_repos: [hyperspy/hyperspy, hyperspy/rosettasciio, hyperspy/hspy-spec]
   status: review              # review | accepted | implemented | superseded
   ai_assisted: true
   created: 2026-06-30
   ---
   ```

1. **Write the proposal.** Include:

   - The problem being solved
   - The proposed approach
   - What changes in each affected repo
   - Breaking changes (if any)
   - Questions for the community
   - References to relevant issues/PRs/discussions

1. **Open a PR** to this repository with the markdown file.

1. **Tag relevant people** for review.** Cross-reference from related issues in the target repos.

1. **Iterate.** Address review comments by pushing commits to your PR branch. Reviewers can see the changes and resolve/unresolve comments.

## How review works

- **Inline comments**: Reviewers comment on specific lines/paragraphs (standard GitHub PR review)
- **Suggest changes**: Reviewers can propose edits directly
- **CI checks**: Every PR runs markdownlint, link-check, and frontmatter-validation
- **Consensus**: A proposal is accepted when maintainers of the affected repos approve. For cross-repo proposals, maintainers of ALL affected repos should approve.
- **Iterate**: Address review comments by pushing commits to your PR branch. Once consensus is reached, summarize feedback and revised decisions before merging.

## After acceptance

1. **Merge the proposal PR.** The proposal is now accepted and lives in this repo permanently.

1. **Start implementation.** Open implementation PRs in the target repos (e.g., `hyperspy/hyperspy`, `hyperspy/rosettasciio`).

1. **Reference the proposal.** In each implementation PR, include: "Implements [proposal 0001](./0001-hspy-spec.md)."

1. **Update proposal status.** After implementation is merged, update the proposal's metadata: `status: implemented`.

1. **Review the implementation.** The implementation PRs go through normal code review. Reviewers can check the implementation against the accepted proposal.

## Proposal types

| Type | Description | Example |
|------|-------------|---------|
| `Architecture` | System design, new packages, major restructuring | hspy-spec, SignalCollection API |
| `Feature` | New user-facing functionality | New signal type, new analysis method |
| `Bugfix` | Significant bug fix that changes behavior | Metadata migration overhaul |
| `Process` | Development process change | This proposals repo, CI changes |

## Target branches

Proposals specify which branch the implementation targets:

| Branch | When to use |
|--------|-------------|
| `RELEASE_next_patch` | Bug fixes, no new features |
| `RELEASE_next_minor` | New features, backward-compatible changes |
| `RELEASE_next_major` | Breaking API changes, major restructuring |

A proposal can target multiple branches if needed (e.g., deprecation in `RELEASE_next_minor`, removal in `RELEASE_next_major`).

## Running checks locally

Every PR runs the checks defined in `.github/workflows/ci.yml`. You can run the same checks before pushing.

### Quick start with conda

If you use [conda](https://conda.io/) or [mamba](https://mamba.readthedocs.io/):

```bash
conda env create -f environment.yml
conda activate hyperspy-proposals
make install
make check
```

This installs Python, Node.js, `pyyaml`, `lychee`, `pre-commit`, and the local `markdownlint-cli`.

### Quick start with pip

If you prefer pip, install the Python dependencies and Node.js tools manually:

```bash
python -m pip install -r requirements.txt
npm install
```

You will still need to install [lychee](https://github.com/lycheeverse/lychee) separately (cargo install, GitHub release, or another package manager).

### Available make targets

| Target | What it runs |
|---|---|
| `make install` | Installs local npm dev dependencies (`markdownlint-cli`) |
| `make check` | Runs frontmatter, markdown lint, and link checks |
| `make fix` | Auto-fixes markdown issues where possible |
| `make lint` | Runs `markdownlint` only |
| `make links` | Runs `lychee` link check only |
| `make frontmatter` | Runs the proposal frontmatter validator only |
| `make pre-commit` | Runs all pre-commit hooks on all files |

### Pre-commit hook (optional but recommended)

[pre-commit](https://pre-commit.com/) runs the markdown and frontmatter checks automatically when you commit, including auto-fixes for many markdown issues.

Install it once:

```bash
pre-commit install
```

Then `git commit` will run the hooks on staged files. To check all files manually:

```bash
make pre-commit
```

## For AI agents

See [AGENTS.md](AGENTS.md).

## License

Proposals in this repository are licensed under [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/) (Creative Commons Attribution-ShareAlike 4.0 International).
