# Quick Start Guide - Vale Apple Style Guide

## What You Got

A complete Vale configuration implementing the **Apple Style Guide (June 2025)** with:

- ✅ 12 custom rule files covering all major style guide areas
- ✅ Product name validation
- ✅ Inclusive language checking
- ✅ Terminology enforcement
- ✅ Punctuation rules (serial commas, etc.)
- ✅ Apple-specific vocabulary lists
- ✅ Sample test document
- ✅ Comprehensive README

## Installation (5 Minutes)

### Step 1: Install Vale

**macOS (recommended):**
```bash
brew install vale
```

**Linux:**
```bash
# Ubuntu/Debian
wget https://github.com/errata-ai/vale/releases/latest/download/vale_*_Linux_64-bit.tar.gz
mkdir bin && tar -xvzf vale_*_Linux_64-bit.tar.gz -C bin
export PATH=$PATH:./bin
```

**Windows:**
```powershell
choco install vale
```

### Step 2: Set Up Configuration

**Option A: Project-level (recommended for specific projects)**
```bash
# Copy files to your project directory
cp .vale.ini /path/to/your/project/
cp -r styles /path/to/your/project/
```

**Option B: Global (for all documents)**
```bash
# Copy files to your home directory
cp .vale.ini ~/
cp -r styles ~/
```

### Step 3: Test It

```bash
# Test with the sample document
vale sample-test.md

# Test your own document
vale your-document.md
```

## Usage Examples

### Check a Single File
```bash
vale README.md
```

### Check Multiple Files
```bash
vale docs/*.md
vale *.txt
```

### Check a Directory Recursively
```bash
vale docs/
```

### Output Formats
```bash
# JSON output (for automation)
vale --output=JSON document.md

# Specific format
vale --output=line document.md
```

### Ignore Specific Rules
```bash
# Ignore one rule
vale --ignore-syntax document.md

# In the document itself, add at top:
<!-- vale off -->
This text won't be checked.
<!-- vale on -->
```

## Understanding the Output

Vale will show issues like this:

```
 document.md
 5:12  error    Use 'iPhone' instead of    AppleStyle.ProductNames
               'iphone'.
 8:1   warning  Avoid 'blacklist' -        AppleStyle.InclusiveLanguage
               consider inclusive
               alternatives.
 12:15 suggestion  Consider using the      AppleStyle.Contractions
               contraction 'can't' for a
               more conversational tone.
```

**Levels:**
- 🔴 **error**: Must fix (product names, terminology)
- 🟡 **warning**: Should fix (inclusive language, verb usage)
- 🔵 **suggestion**: Consider fixing (contractions, passive voice)

## Editor Integration

### VS Code (Recommended)
1. Install extension: "Vale VSCode" by Chris Chinchilla
2. Open Settings (⌘,)
3. Search for "Vale"
4. Set "Vale > Vale CLI: Path" to your Vale installation
5. Set "Vale > Vale CLI: Config" to your `.vale.ini` path

Auto-check on save! 🎉

### Sublime Text
1. Install Package Control
2. Install SublimeLinter
3. Install SublimeLinter-vale
4. Configure path to `.vale.ini`

### Vim/Neovim
```vim
" Add to .vimrc or init.vim
Plug 'dense-analysis/ale'
let g:ale_linters = {'markdown': ['vale']}
let g:ale_fixers = {'markdown': ['vale']}
```

## Common Issues & Solutions

### "No such file or directory"
```bash
# Check Vale is installed
vale --version

# Check path to config
vale --config=.vale.ini document.md
```

### "Style not found"
```bash
# Ensure styles directory is in same location as .vale.ini
ls styles/AppleStyle/
```

### "No issues found" (but there should be)
```bash
# Check file type is configured
cat .vale.ini | grep "*.md"

# Force check
vale --no-exit document.md
```

## Quick Customization

### Change Rule Severity

Edit any `.yml` file in `styles/AppleStyle/`:

```yaml
# Change from 'warning' to 'error' or 'suggestion'
level: warning
```

### Disable a Rule Entirely

In `.vale.ini`:
```ini
[*.md]
BasedOnStyles = AppleStyle
AppleStyle.Contractions = NO
AppleStyle.PassiveVoice = NO
```

### Add Your Own Terms

**Accept list** (`styles/Vocab/Apple/accept.txt`):
```
MyProductName
CustomTerm
InternalCodename
```

**Reject list** (`styles/Vocab/Apple/reject.txt`):
```
deprecatedterm
oldproductname
```

## File Structure

```
your-project/
├── .vale.ini                 ← Main config
├── styles/                   ← Rules directory
│   ├── AppleStyle/          ← Apple rules
│   │   ├── *.yml            ← 12 rule files
│   └── Vocab/               ← Custom vocabulary
│       └── Apple/
│           ├── accept.txt   ← Accepted terms
│           └── reject.txt   ← Rejected terms
├── sample-test.md           ← Test document
└── README.md                ← Full documentation
```

## Next Steps

1. **Test the sample**: `vale sample-test.md`
2. **Test your docs**: `vale your-file.md`
3. **Install editor plugin**: See "Editor Integration" above
4. **Customize**: Adjust rules in `styles/AppleStyle/*.yml`
5. **Add terms**: Edit `accept.txt` and `reject.txt`

## Key Rules to Remember

### Product Names
- ✅ iPhone, iPad, macOS, iOS
- ❌ iphone, Mac OS, I-Pad

### Actions
- ✅ Click the button
- ❌ Click on the button

### Inclusive Language
- ✅ Deny list, allow list
- ❌ Blacklist, whitelist

### Serial Commas
- ✅ Red, green, and blue
- ❌ Red, green and blue

### Contractions
- ✅ Don't, can't, it's
- ❌ Do not, cannot, it is (in most cases)

## Resources

- 📖 [Full README](README.md) - Detailed documentation
- 🧪 [Sample Document](sample-test.md) - Test examples
- 🍎 [Apple Style Guide](https://support.apple.com/guide/applestyleguide/)
- 📚 [Vale Docs](https://vale.sh/docs/)

## Support

Having issues? Check:
1. Vale is installed: `vale --version`
2. Config file exists: `cat .vale.ini`
3. Styles directory exists: `ls styles/`
4. File type matches patterns in `.vale.ini`

## That's It!

You're ready to write Apple-style documentation. Run `vale` on your documents and watch the magic happen! ✨

---

**Version**: 1.0  
**Based on**: Apple Style Guide (June 2025)  
**Last Updated**: October 2025
