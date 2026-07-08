# Security Policy

## Permissions

PanePilot requests only the macOS permissions required for its core behavior:

- Accessibility: captures `Command+Tab`, reads window metadata through Accessibility APIs, and focuses the selected window.
- Screen Recording: lets macOS provide window thumbnails for the switcher overlay.
- Login Items: optional, only when the user enables Open at Login.

The app does not use network APIs, analytics SDKs, update beacons, or third-party services.

## Data Handling

PanePilot processes window titles and thumbnails locally on the user's Mac. It does not transmit this data.

Diagnostic logging is disabled by default. If enabled from the menu bar or by setting `PANEPILOT_DEBUG_LOG=1`, logs are written to `/tmp/panepilot.log`. Do not enable diagnostic logging when working with sensitive windows unless you are comfortable with local diagnostic data being present temporarily.

## Release Signing

Current local builds are ad-hoc signed. Public releases should be signed with a Developer ID Application certificate and notarized by Apple before broad distribution.

## Reporting Issues

Please report security issues privately before opening a public issue. Include reproduction steps, macOS version, and the app version.
