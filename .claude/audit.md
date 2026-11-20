# Audit: future work ranked by importance

Date: 2026-11-20. Evidence comes from running Vale 3.28.1 against each fixture.

## P0: the style does not work as shipped

1. **Capitalization.yml is invalid.** `ignorecase` is not a valid key for `extends: capitalization`; Vale aborts with `E201`. Any user loading `apple` with this file present gets a hard error, which breaks the whole style. Remove the key, and check that `match: $title` and `style: AP` do what is intended (the Apple guide uses sentence case for most UI and headings, so `$sentence` is probably right).
2. **Root `.vale.ini` is broken.** `StylesPath = styles` and `BasedOnStyles = AppleStyle` do not exist (style is `apple`), and `Vocab = Apple` has no vocabulary directory. `vale apple/sample-test.md` fails with E201. Fix or replace with a working example config.
3. **No working automated tests.** Cucumber is not installed locally, CI is Travis (dead), and no GitHub workflow runs tests. Several `rules.feature` expectations no longer match output:
   - Capitalization: cannot run at all.
   - Spelling: expects an `e-mail` alert and no others; real output has `WiFi` and `on line` only (`e-mail` is handled by Terminology).
   - Terminology: expects `Use 'sign in' instead of 'login'`; real output is `Use 'sign in|log in' instead of 'Login'`.
   - Column numbers: `--normalize`d output reports real columns (for example `3:5`), the feature says `3:1`.
   Decide on one test approach and make it pass in CI (see item 5).

## P1: correctness bugs in rules

4. **Wrong or harmful substitutions in Terminology.yml:**
   - `allow list: deny list` flags the correct term and recommends the opposite.
   - `mute: unable to speak` flags a common UI verb ("Mute the sound") and suggests an offensive replacement. Remove.
   - `internet: internet`, `email: email`, `website: website`, `voicemail: voicemail` (Spelling) map a word to itself; no-ops at best.
   - `app store: App Store (when referring to Apple's service)`: replacement text includes parenthetical prose, which is then inserted into the message. Same pattern across many entries (`analog: analog (not analogue)`, `buses: ...`). Substitution rules should contain only the replacement, with explanation in `message` or `link`.
   - `onto: on to`, `in to: into`, `computer: Mac`, `smartphone: iPhone`: flag legitimate prose; conditional advice cannot be expressed as a substitution. Move to `existence` suggestions or drop.
5. **Verbs.yml:** `"perform a \\2 installation"` uses a backreference that substitution does not support (verify with a fixture). `abort: stop|cancel|quit` and `activate: turn on` are over-broad ("activate your account").
6. **SerialComma regex** `,\s+\w+\s+(and|or)\s+\w+[^,]` flags text that already has a serial comma pattern shifted, and also non-lists such as "In 2020, Apple and Google ...". Needs a tighter pattern and fixture cases with false positives and true negatives.
7. **PassiveVoice regex** only matches regular `-ed`/`-ing` forms and flags progressive tenses ("is running"). It misses irregular participles ("was written"). Consider Vale's built-in `write-good`-style irregular list.
8. **Contractions rule direction.** Apple does prefer contractions in conversational text, but `are not` / `cannot` flags are noisy in technical docs. Keep at `suggestion`, and check that the `nonword: true` setting does not mis-tokenise.
9. **ProductNames** is `error` level with `ignorecase: true` and tokens such as `Apple ?ID(?! is)`, `Apple ?tv`, `Apple ?music`. Ignorecase means correct spellings (`Apple Music`, `Apple TV`, `Apple ID`) match and are flagged. Verify; likely needs `ignorecase: false` plus explicit incorrect variants or `substitution` with swaps.
10. **Vocabulary files** (`accept.txt`, `reject.txt`) sit in `apple/` where Vale ignores them. Either document and ship them under `config/vocabularies/Apple/` or remove.

## P2: coverage and quality

11. **Coverage.** 12 rules versus an extensive guide. Missing categories include: units and numbers (spacing, "GB" with non-breaking space), dates and times, UI element naming (menus, buttons, "tap" vs "click" by platform), keyboard shortcut formatting, hyphenation and compounds, headline/sentence-case checks, Apple-specific trademarks, and Oxford-style abbreviations (`e.g.` / `i.e.`).
12. **Rule overlap.** The same text raises multiple alerts (`blacklist` hits Terminology and InclusiveLanguage; `dialog box` hits Terminology and Clarity; `click on` hits Verbs and Terminology; `login` hits Spelling and Terminology). Assign each term to one rule.
13. **Abbreviations rule** flags every use of `API`/`USB` rather than first use only; Vale cannot do first-use, so either use `conditional` extends (needs a definition pattern) or lower severity and document the limitation.
14. **Fixtures are thin.** One to three positives, no negatives. Add "should not flag" lines, since false positives are the main risk for style guides.
15. **Source traceability.** No `link:` fields point at the Apple Style Guide pages. Adding them makes alerts verifiable and helps users decide whether to trust a rule.

## P3: repo hygiene and release

16. **CI.** Replace `.travis.yml` with a GitHub Actions workflow: install Vale, run fixtures, run yamllint, on push and PR. Remove the CodeQL workflow (no JavaScript in the repo; scan fails or is a no-op) or switch it to `actions`.
17. **Release flow.** Release zip works on tags, but `CHANGELOG.md` is empty and `CONTRIBUTING.md` is a heading only. Add changelog entries per release and a short contributing guide (how to add a rule plus fixture plus scenario).
18. **Vale packaging.** For `vale sync` support, add a `.vale.ini` `Packages` example and a `package.json`-free `README` snippet. Vale packages need a zip with `.vale.ini` and `styles/<Name>/`; the current zip layout (`apple/` only) is manual-install only.
19. **README.** Stale Travis badge and `testthedocs` link, "Vale >= 1.7.0" claim (substitution/`raw` behaviour is now Vale 3), TODO comments left in. `todo-issue.yml` will turn these TODOs into GitHub issues.
20. **Dependencies.** `aruba ~> 0.14.3` is very old and incompatible with modern Ruby (installed via Homebrew). Either bump Aruba or replace the Cucumber harness with a small script that diffs `vale --output=JSON` against golden files, which also removes the Ruby requirement.
21. **`.idea/` is untracked and not ignored.** Add to `.gitignore`.
22. **Licence/attribution.** Add a short disclaimer that rule text paraphrases Apple's guide and that Apple trademarks belong to Apple (README note exists; LICENSE is MIT only).

## Suggested order

P0.1 → P0.2 → P1.4 (remove harmful entries) → P0.3 with GitHub Actions (P3.16) → P1.5-10 → P2 items → P3 housekeeping.
