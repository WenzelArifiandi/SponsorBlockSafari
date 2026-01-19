# Building SponsorBlock for Safari

## Prerequisites

- Xcode 13.0+
- Node.js 16+ (only if rebuilding extension)

## macOS

1. Open the Xcode project:
   ```bash
   open "apps/sponsorblock-safari/upstream/SponsorBlock for YouTube - Skip Sponsorships/SponsorBlock.xcodeproj"
   ```
2. Select the "SponsorBlock (macOS)" target, go to Signing & Capabilities, and set Team to your Apple ID
3. Click **Run** (or Product → Run)
4. Safari → Settings → Advanced → Show Develop menu
5. Develop → Allow Unsigned Extensions (re-enable after each Safari restart)
6. Safari → Settings → Extensions → enable SponsorBlock

## iOS (optional)

1. Open the Xcode project
2. Select an iOS device target with your Apple ID signing
3. Run to device
4. iOS Settings → Safari → Extensions → enable SponsorBlock

## Rebuilding Extension Assets

If `upstream/SponsorBlock/dist/` is missing or outdated:

```bash
cd apps/sponsorblock-safari/upstream/SponsorBlock
npm ci
npm run build:safari
```

## License

GPLv3 - see `upstream/LICENSE`
App Store exception - see `upstream/LICENSE-APPSTORE.txt`
