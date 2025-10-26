# Vale Apple Style Guide - File Manifest

## Overview
Complete Vale configuration implementing the Apple Style Guide (June 2025) with 12 custom rule files, vocabulary lists, and comprehensive documentation.

## Files Included

### Configuration Files

#### `.vale.ini` (Main Configuration)
- Core Vale configuration file
- Defines style paths and alert levels
- Sets up file type patterns
- Configures vocabulary and base styles

### Documentation Files

#### `README.md` (Full Documentation)
- Comprehensive guide to the configuration
- Detailed rule explanations
- Usage examples and best practices
- Customization instructions
- File structure overview
- 5,800+ words

#### `QUICK-START.md` (Quick Start Guide)
- 5-minute setup instructions
- Installation guide for all platforms
- Common usage patterns
- Editor integration steps
- Troubleshooting tips
- Key rules summary

#### `sample-test.md` (Test Document)
- Example document with intentional errors
- Demonstrates all rule types
- Shows before/after corrections
- Useful for testing configuration
- Training examples

### Rule Files (styles/AppleStyle/)

#### 1. `Terminology.yml` (Substitution Rules)
**Purpose**: Enforces Apple's preferred terminology
**Level**: Error
**Examples**:
- "dialog box" → "dialog"
- "click on" → "click"
- "blacklist" → "deny list"
- "email" → "email" (not "e-mail")

**Rule Count**: 50+ term substitutions

#### 2. `ProductNames.yml` (Product Name Validation)
**Purpose**: Ensures correct Apple product names
**Level**: Error
**Examples**:
- "iphone" → "iPhone"
- "app store" → "App Store"
- "mac-os" → "macOS"
- "air pods" → "AirPods"

**Rule Count**: 40+ product name patterns

#### 3. `InclusiveLanguage.yml` (Inclusive Language)
**Purpose**: Flags non-inclusive terminology
**Level**: Warning
**Examples**:
- "blacklist/whitelist" → "deny list/allow list"
- "handicapped" → "person with a disability"
- "master/slave" → "primary/secondary"
- "hearing impaired" → "deaf or hard of hearing"

**Rule Count**: 30+ problematic terms

#### 4. `Abbreviations.yml` (Abbreviation Usage)
**Purpose**: Reminds to spell out abbreviations on first use
**Level**: Suggestion
**Examples**:
- API, USB, SSD, HDR, LiDAR
- ROM, ISP, APFS, AVCHD

**Rule Count**: 25+ abbreviations

#### 5. `Verbs.yml` (Verb Usage)
**Purpose**: Enforces preferred verbs for UI actions
**Level**: Warning
**Examples**:
- "click on" → "click"
- "select a command" → "choose"
- "activate" → "turn on"
- "deactivate" → "turn off"

**Rule Count**: 15+ verb patterns

#### 6. `Spelling.yml` (Spelling Preferences)
**Purpose**: Enforces Apple's spelling conventions
**Level**: Error
**Examples**:
- "adaptor" → "adapter"
- "dialog" → "dialog" (not "dialogue")
- "canceled" → "canceled" (one L)
- "email" → "email" (one word)

**Rule Count**: 40+ spelling patterns

#### 7. `Capitalization.yml` (Capitalization Rules)
**Purpose**: Checks title and heading capitalization
**Level**: Warning
**Examples**:
- Title-style for headings
- Lowercase "internet"
- Special handling for product names

**Rule Count**: 30+ exceptions

#### 8. `Contractions.yml` (Contraction Suggestions)
**Purpose**: Encourages conversational tone
**Level**: Suggestion
**Examples**:
- "you are" → "you're"
- "cannot" → "can't"
- "it is" → "it's"
- "will not" → "won't"

**Rule Count**: 20+ contraction patterns

#### 9. `Clarity.yml` (User-Facing Language)
**Purpose**: Flags technical jargon and unclear terms
**Level**: Suggestion
**Examples**:
- "dialog box" → "dialog"
- "power level" → "battery level"
- "boot disk" → "startup disk"
- "checkmark" → "select"

**Rule Count**: 25+ technical terms

#### 10. `SerialComma.yml` (Punctuation)
**Purpose**: Enforces serial comma usage
**Level**: Warning
**Examples**:
- "A, B and C" → "A, B, and C"

**Rule Count**: 1 pattern (regex-based)

#### 11. `PassiveVoice.yml` (Voice Detection)
**Purpose**: Suggests active voice alternatives
**Level**: Suggestion
**Examples**:
- "is saved" → "saves"
- "was installed" → "installed"

**Rule Count**: 1 pattern with 10 exceptions

#### 12. `WordyPhrases.yml` (Conciseness)
**Purpose**: Simplifies wordy expressions
**Level**: Suggestion
**Examples**:
- "in order to" → "to"
- "at this point in time" → "now"
- "has the ability to" → "can"
- "prior to" → "before"

**Rule Count**: 30+ phrase patterns

### Vocabulary Files (styles/Vocab/Apple/)

#### `accept.txt` (Accepted Terms)
**Purpose**: Apple-specific terms that should be accepted
**Count**: 80+ terms
**Categories**:
- Product names (iPhone, iPad, etc.)
- Operating systems (macOS, iOS, etc.)
- Services (iCloud, App Store, etc.)
- Technologies (Retina, ProMotion, etc.)
- Features (VoiceOver, Face ID, etc.)
- Developer terms (Xcode, Swift, etc.)

#### `reject.txt` (Rejected Terms)
**Purpose**: Terms that should never appear
**Count**: 40+ terms
**Categories**:
- Deprecated product names
- Insensitive terms
- Old terminology
- Common misspellings

## Statistics

### Overall Configuration
- **Total Rule Files**: 12
- **Total Rules**: 300+
- **Vocabulary Terms**: 120+
- **Error-Level Rules**: 3 files
- **Warning-Level Rules**: 5 files
- **Suggestion-Level Rules**: 4 files

### Coverage Areas
✅ Product naming and branding
✅ Inclusive and accessible language
✅ Technical terminology
✅ UI interaction language
✅ Punctuation and grammar
✅ Spelling conventions
✅ Writing style and tone
✅ Abbreviation usage
✅ Voice and clarity

## Rule Level Distribution

| Level | Files | Purpose |
|-------|-------|---------|
| **Error** | 3 | Must fix - product names, terminology, spelling |
| **Warning** | 5 | Should fix - inclusive language, verbs, punctuation |
| **Suggestion** | 4 | Consider - contractions, passive voice, clarity |

## File Sizes

- Configuration: ~1 KB
- Rule files: ~15 KB total
- Vocabulary: ~3 KB total
- Documentation: ~45 KB total
- **Total package**: ~64 KB

## Installation Requirements

- **Vale**: v2.0.0 or higher
- **Disk Space**: < 1 MB
- **OS**: macOS, Linux, Windows
- **Dependencies**: None (Vale only)

## Usage Scope

### Recommended For:
✅ Apple documentation writers
✅ Technical writers for Apple products
✅ Developer documentation
✅ User guides and manuals
✅ Marketing copy
✅ UI text and microcopy
✅ Blog posts about Apple products
✅ Training materials

### Not Recommended For:
❌ Non-Apple product documentation
❌ Academic papers (different style)
❌ Creative fiction writing
❌ Informal blog posts (unless Apple-focused)

## Compatibility

### File Types Supported:
- Markdown (`.md`)
- Plain text (`.txt`)
- reStructuredText (`.rst`)
- AsciiDoc (`.adoc`)
- HTML (`.html`)
- XML (`.xml`)

### Editor Integration:
- VS Code ✅
- Sublime Text ✅
- Vim/Neovim ✅
- Atom ✅
- Emacs ✅
- IntelliJ IDEA ✅

## Maintenance

### Based On:
- Apple Style Guide (June 2025 edition)
- 281 pages of official guidelines

### Last Updated:
- October 2025

### Version:
- 1.0 (Initial Release)

### Future Updates:
- Will track Apple Style Guide updates
- Community contributions welcome
- Regular rule refinements

## Quick Reference

### Most Important Rules:

1. **Product Names**: Always capitalize correctly (iPhone, not iphone)
2. **Inclusive Language**: Use allow/deny lists, not whitelist/blacklist
3. **Serial Commas**: Always use (A, B, and C)
4. **Click vs Click On**: Use "click" not "click on"
5. **Contractions**: Prefer conversational tone (can't vs cannot)

### Most Common Errors:

1. Incorrect product name capitalization
2. Using "click on" instead of "click"
3. Missing serial commas
4. Non-inclusive terminology
5. Wordy phrases

## Support & Resources

- **Full Documentation**: See `README.md`
- **Quick Start**: See `QUICK-START.md`
- **Test Examples**: See `sample-test.md`
- **Apple Style Guide**: https://support.apple.com/guide/applestyleguide/
- **Vale Documentation**: https://vale.sh/docs/

## License & Attribution

- Configuration: MIT License (or your preferred license)
- Apple Style Guide: © 2025 Apple Inc.
- Vale: MIT License

---

**Package Version**: 1.0  
**Release Date**: October 2025  
**Maintainer**: Documentation Team  
**Status**: Production Ready ✅
