# Project knowledge: Apple Style Guide for Vale

Last reviewed: 2026-11-20

## What this is

A Vale style (`apple/`) that approximates the *Apple Style Guide* (June 2025). Not affiliated with Apple. Distributed as a zip of the `apple/` directory attached to a GitHub release (tag push triggers `.github/workflows/release.yml`). Users copy `apple/` into their Vale `StylesPath` and set `BasedOnStyles = apple`.

Author/owner: Chris Chinchilla (`chrischinchilla/apple-style-guide`). Forked in spirit from `testthedocs/apple` (hence the stale Travis badge).

## Layout

| Path | Purpose |
|---|---|
| `apple/*.yml` | 12 Vale rules: Abbreviations, Capitalization, Clarity, Contractions, InclusiveLanguage, PassiveVoice, ProductNames, SerialComma, Spelling, Terminology, Verbs, WordyPhrases |
| `apple/accept.txt`, `reject.txt` | Vocabulary lists. Vale only reads these from `<StylesPath>/config/vocabularies/<Name>/`, so in `apple/` they currently do nothing |
| `apple/sample-test.md` | Hand-written demo document |
| `fixtures/<Rule>/` | One dir per rule: `.vale.ini` (`StylesPath = ../../`, enables `apple.<Rule> = YES`) plus `test.md` |
| `features/` | Cucumber/Aruba tests. `steps.rb` cds into the fixture and runs `vale --output=line --sort --normalize --relative .`; `rules.feature` holds the expected output per rule |
| `.vale.ini` (root) | Example config, broken (see below) |
| `.travis.yml`, `Gemfile`, `.yamllint.yml` | Legacy CI/test tooling (Travis, Aruba 0.14, yamllint) |
| `.github/workflows/` | `release.yml` (zip on tag), `codeql.yml` (JavaScript, but repo has no JS), `todo-issue.yml` |

Style name is `apple` (directory name), so rule IDs look like `apple.Spelling`.

## Conventions

- Each rule file is a single Vale check, `extends: existence | substitution | capitalization`.
- Levels: ProductNames and Spelling/Terminology are `error`; InclusiveLanguage, SerialComma, Verbs, Capitalization are `warning`; the rest are `suggestion`.
- Fixtures are minimal: a title line plus 2-3 offending sentences. Add a fixture and a feature scenario for each new rule.
- User preferences (global CLAUDE.md): British/European English in prose, concise writing, npm/uv, Vale tooling available, suggest commit messages, only commit when asked.

## Running tests

- Vale 3.28.1 is installed at `/opt/homebrew/bin/vale`. Cucumber is not installed; Ruby/bundler are (`bundle install` then `bundle exec cucumber`).
- Quick manual check per rule: `cd fixtures/<Rule> && vale --output=line --sort --normalize --relative .`
- Lint YAML: `yamllint -c .yamllint.yml apple`

## Known facts about current state

See `audit.md` for the ranked list. Headlines:

- Capitalization rule is invalid in Vale 3 (`ignorecase` key rejected), so it errors out.
- Root `.vale.ini` points at `styles/` and `AppleStyle`, neither of which exists.
- `features/rules.feature` expectations drift from real output (columns, messages, rules that no longer fire).
- Rules overlap heavily (Spelling vs Terminology vs Verbs vs InclusiveLanguage vs Clarity), so one text span can raise several alerts.
- Coverage is small relative to the real guide.
