# Local checks for hyperspy-proposals

MARKDOWNLINT := ./node_modules/.bin/markdownlint
LYCHEE := lychee
PYTHON := python

.PHONY: help install check fix lint links frontmatter pre-commit

help:
	@echo "Available targets:"
	@echo "  install     Install local npm dev dependencies (markdownlint-cli)"
	@echo "  check       Run frontmatter, markdown lint, and link checks"
	@echo "  fix         Auto-fix markdown issues where possible"
	@echo "  lint        Run markdownlint only"
	@echo "  links       Run link check with lychee"
	@echo "  frontmatter Run proposal frontmatter validation"
	@echo "  pre-commit  Run pre-commit hooks on all files"

install:
	npm install

check: frontmatter lint links

fix: install
	$(MARKDOWNLINT) --fix .

lint: install
	$(MARKDOWNLINT) .

links:
	$(LYCHEE) --require-https .

frontmatter:
	$(PYTHON) .github/scripts/validate-frontmatter.py

pre-commit:
	pre-commit run --all-files
