# Sample Test Document

This document contains examples that will trigger various Vale rules based on the Apple Style Guide.

## Product Names (Should trigger errors)

- The iphone 15 has a great camera. ❌
- Download apps from the app store. ❌
- Connect your air-pods to mac-book. ❌
- Use face-id to unlock your device. ❌

**Corrected:**
- The iPhone 15 has a great camera. ✅
- Download apps from the App Store. ✅
- Connect your AirPods to MacBook. ✅
- Use Face ID to unlock your device. ✅

## Terminology (Should trigger errors)

- Click on the button to continue. ❌
- The dialog box appears when you save. ❌
- Access the server using your credentials. ❌
- Attach the USB cable to your computer. ❌
- Boot your machine to continue. ❌

**Corrected:**
- Click the button to continue. ✅
- The dialog appears when you save. ✅
- Log in to the server using your credentials. ✅
- Connect the USB cable to your computer. ✅
- Start up your computer to continue. ✅

## Inclusive Language (Should trigger warnings)

- Add the email to the whitelist. ❌
- Remove the user from the blacklist. ❌
- This feature helps handicapped users. ❌
- The setting is useful for hearing impaired customers. ❌
- The master server controls the slave servers. ❌

**Corrected:**
- Add the email to the allow list. ✅
- Remove the user from the deny list. ✅
- This feature helps people with disabilities. ✅
- The setting is useful for people who are deaf or hard of hearing. ✅
- The primary server controls the secondary servers. ✅

## Serial Commas (Should trigger warnings)

- You can sync photos, videos and documents. ❌
- The app works on iPhone, iPad and Mac. ❌

**Corrected:**
- You can sync photos, videos, and documents. ✅
- The app works on iPhone, iPad, and Mac. ✅

## Contractions (Should trigger suggestions)

- You cannot access this feature without an account. (Consider: can't)
- It is important to save your work regularly. (Consider: It's)
- You are able to customize the settings. (Consider: You're)

**With contractions:**
- You can't access this feature without an account. ✅
- It's important to save your work regularly. ✅
- You're able to customize the settings. ✅

## Wordy Phrases (Should trigger suggestions)

- In order to save your document, click Save. ❌
- At this point in time, the feature is unavailable. ❌
- You have the ability to customize settings. ❌
- Prior to installing, back up your data. ❌

**Corrected:**
- To save your document, click Save. ✅
- Currently, the feature is unavailable. ✅
- You can customize settings. ✅
- Before installing, back up your data. ✅

## Passive Voice (Should trigger suggestions)

- The file is saved automatically. (Consider active: The app saves the file automatically)
- Your data is being synced. (Consider active: The app is syncing your data)
- The update was installed successfully. (Consider active: You successfully installed the update)

## Correct Examples (Should pass)

- Click the Save button to save your changes.
- You can customize your iPhone's settings.
- The app is available on the App Store.
- Connect your AirPods to your Mac using Bluetooth.
- Face ID uses facial recognition to unlock your device.
- Turn on Wi-Fi to connect to the internet.
- People who are deaf or hard of hearing can use Live Captions.
- The app syncs your photos, videos, and documents.
- You can't access this feature without signing in.
- To learn more, visit the Apple website.

## Abbreviations (Should trigger suggestions on first use)

First use of abbreviations should be spelled out:
- The API allows developers to integrate features. (Should spell out: application programming interface (API))
- Connect using USB to transfer files. (Should spell out: Universal Serial Bus (USB))
- The SSD provides fast storage. (Should spell out: solid-state drive (SSD))

After first use, abbreviations are acceptable:
- The API includes methods for authentication.
- USB 3.0 offers faster transfer speeds.
- The SSD has 512 GB of capacity.

---

## Summary

This sample document demonstrates how Vale with the Apple Style Guide configuration will:

1. **Catch product name errors** (iphone → iPhone)
2. **Enforce terminology preferences** (click on → click)
3. **Promote inclusive language** (blacklist → deny list)
4. **Require serial commas** (A, B and C → A, B, and C)
5. **Suggest contractions** (you are → you're)
6. **Simplify wordy phrases** (in order to → to)
7. **Detect passive voice** (is saved → saves)
8. **Check abbreviation usage** (spell out on first use)

Run `vale sample.md` to see these rules in action!
