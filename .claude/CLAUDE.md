# Apple Style Guide (Vale style)

Vale style named `apple` in `apple/`, tested via `fixtures/<Rule>/` and `features/rules.feature`.

- Read `.claude/project-knowledge.md` for layout and conventions, `.claude/audit.md` for ranked open work.
- Every new or changed rule needs a fixture (with false-positive lines) and an updated expectation.
- Keep `swap` values to plain replacements; explanations go in `message` or `link`.
- Assign each term to exactly one rule to avoid duplicate alerts.
- Check with `cd fixtures/<Rule> && vale --output=line --sort --normalize --relative .`
- Use British/European English in prose. Suggest commit messages; do not commit unasked.
- After finishing work, update the audit (tick or remove done items) and the "Last reviewed" date.
