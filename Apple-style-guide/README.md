# Vale Configuration for Apple Style Guide

This Vale configuration implements rules based on the **Apple Style Guide (June 2025)** to help maintain consistency in Apple documentation and technical writing.

## Overview

Vale is a prose linter that checks your writing against style guide rules. This configuration enforces Apple's editorial guidelines for:

- **Terminology**: Preferred and deprecated terms
- **Inclusive Language**: Avoiding insensitive or outdated terminology
- **Product Names**: Correct capitalization and formatting
- **Abbreviations**: Proper use and expansion
- **Punctuation**: Serial commas and other conventions
- **Clarity**: User-friendly language and clear instructions
- **Verb Usage**: Preferred verbs for UI actions
- **Spelling**: Apple's preferred spellings
- **Contractions**: Encouraging conversational tone
- **Passive Voice**: Preferring active voice

## Installation

### Prerequisites

1. Install Vale:
   ```bash
   # macOS (Homebrew)
   brew install vale
   
   # Linux (snap)
   snap install vale
   
   # Or download from https://vale.sh
   ```

### Setup

1. Copy the `.vale.ini` file to your project root or home directory
2. Copy the `styles/` directory to the same location
3. Run Vale on your documents

## Usage

### Basic Usage

```bash
# Check a single file
vale README.md

# Check all markdown files in a directory
vale docs/*.md

# Check with specific config
vale --config=/path/to/.vale.ini document.md
```

### Integration with Editors

#### VS Code
1. Install the "Vale VSCode" extension
2. Configure the extension to use your `.vale.ini` file

#### Vim/Neovim
1. Install ALE plugin
2. Configure ALE to use Vale

#### Sublime Text
1. Install SublimeLinter and SublimeLinter-vale

## Rule Categories

### Error Level Rules (Must Fix)

- **Terminology.yml**: Incorrect terminology (e.g., "dialog box" → "dialog")
- **ProductNames.yml**: Incorrect product names (e.g., "iphone" → "iPhone")
- **Spelling.yml**: Spelling errors and incorrect word forms

### Warning Level Rules (Should Fix)

- **InclusiveLanguage.yml**: Non-inclusive terms (e.g., "blacklist" → "deny list")
- **Verbs.yml**: Incorrect verb usage (e.g., "click on" → "click")
- **SerialComma.yml**: Missing serial commas
- **Capitalization.yml**: Incorrect capitalization

### Suggestion Level Rules (Consider Fixing)

- **Abbreviations.yml**: Abbreviations that should be spelled out on first use
- **Contractions.yml**: Opportunities to use contractions for informal tone
- **Clarity.yml**: Technical jargon that could be simplified
- **PassiveVoice.yml**: Passive voice constructions
- **WordyPhrases.yml**: Verbose phrases that could be simplified

## Key Apple Style Guide Rules

### Product Names

✅ **Correct:**
- iPhone, iPad, iMac, MacBook
- macOS, iOS, iPadOS, watchOS
- App Store, Apple Music
- Wi-Fi, AirPods, HomePod

❌ **Incorrect:**
- iphone, i-Phone, Iphone
- MacOS, Mac OS, Mac-OS
- app store, AppStore
- WiFi, Air Pods

### Terminology Preferences

| ❌ Don't Use | ✅ Use Instead |
|-------------|---------------|
| dialog box | dialog |
| click on | click |
| email | email |
| blacklist/whitelist | deny list/allow list |
| crash | quits unexpectedly |
| handicapped | person with a disability |
| master/slave | primary/secondary |

### Inclusive Language

Avoid:
- Ableist terms: "handicapped," "hearing impaired," "wheelchair-bound"
- Racially insensitive: "blacklist," "whitelist," "black hat hacker"
- Gendered: "he/she," "mankind," specific gender assumptions

Use:
- Person-first language: "person with a disability"
- Neutral alternatives: "deny list/allow list," "primary/secondary"
- Inclusive pronouns: "they," "you," or rephrase

### UI Instructions

✅ **Correct:**
- Click the Save button
- Choose File > Save
- Tap Settings
- Select the checkbox
- Press the Home button

❌ **Incorrect:**
- Click on Save
- Select File > Save command
- Tap on Settings
- Check the checkbox
- Push the Home button

### Contractions

Apple encourages contractions for a conversational tone:
- you're, it's, can't, won't, don't
- Avoid: you are, it is, cannot, will not, do not

### Serial Commas

Always use serial commas:
- ✅ "photos, videos, and documents"
- ❌ "photos, videos and documents"

## Customization

### Adjusting Rule Severity

Edit the `level` field in any `.yml` file:
- `error`: Must be fixed
- `warning`: Should be fixed
- `suggestion`: Consider fixing

Example:
```yaml
level: warning  # Change to 'error' or 'suggestion'
```

### Disabling Rules

In `.vale.ini`:
```ini
[*]
BasedOnStyles = AppleStyle

# Disable specific rules
AppleStyle.Contractions = NO
AppleStyle.PassiveVoice = NO
```

### Adding Custom Terms

Edit `styles/Vocab/Apple/accept.txt` to add accepted terms or `reject.txt` for rejected terms.

## File Structure

```
.
├── .vale.ini                          # Main configuration file
├── styles/
│   ├── AppleStyle/                    # Apple Style Guide rules
│   │   ├── Abbreviations.yml          # Abbreviation rules
│   │   ├── Capitalization.yml         # Capitalization rules
│   │   ├── Clarity.yml                # Clarity and user-facing language
│   │   ├── Contractions.yml           # Contraction suggestions
│   │   ├── InclusiveLanguage.yml      # Inclusive language warnings
│   │   ├── PassiveVoice.yml           # Passive voice detection
│   │   ├── ProductNames.yml           # Apple product name rules
│   │   ├── SerialComma.yml            # Serial comma rules
│   │   ├── Spelling.yml               # Spelling preferences
│   │   ├── Terminology.yml            # Term substitutions
│   │   ├── Verbs.yml                  # Verb usage rules
│   │   └── WordyPhrases.yml           # Wordy phrase detection
│   └── Vocab/
│       └── Apple/
│           ├── accept.txt              # Accepted Apple terms
│           └── reject.txt              # Rejected terms
└── README.md                          # This file
```

## Examples

### Before Vale

```
The iphone uses face-id to authenticate users. Click on Settings to 
configure blacklisted apps. The device is being used by hearing impaired 
users and persons confined to wheelchairs. You can email feedback to our 
engineering team.
```

### After Vale Corrections

```
iPhone uses Face ID to authenticate users. Click Settings to configure 
blocked apps. The device is used by people who are deaf or hard of hearing 
and wheelchair users. You can send feedback to our engineering team via email.
```

## Resources

- [Apple Style Guide (PDF)](https://help.apple.com/pdf/applestyleguide/en_US/apple-style-guide.pdf)
- [Apple Style Guide (Web)](https://support.apple.com/guide/applestyleguide/)
- [Vale Documentation](https://vale.sh/docs/)
- [Vale GitHub](https://github.com/errata-ai/vale)

## Contributing

To add new rules or improve existing ones:

1. Reference the official Apple Style Guide
2. Create or edit rule files in `styles/AppleStyle/`
3. Test rules with sample documents
4. Update this README with any new rules or changes

## License

This Vale configuration is provided as-is for use with Apple documentation. The Apple Style Guide is © 2025 Apple Inc.

## Version

Based on: **Apple Style Guide - June 2025**
Vale Config Version: **1.0**
Last Updated: October 2025
