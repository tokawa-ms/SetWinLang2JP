# SetWinLang2JP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?logo=powershell&logoColor=white)](https://learn.microsoft.com/powershell/)
[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows/windows-11)
[![GitHub last commit](https://img.shields.io/github/last-commit/tokawa-ms/SetWinLang2JP)](https://github.com/tokawa-ms/SetWinLang2JP/commits/main)

日本語版: [README.md](./README.md)

`SetWinLang2JP` is a PowerShell script that configures a Windows 11 system to use Japanese (`ja-JP`) as its system and user interface language in a single run. It is intended for scenarios where the same regional configuration must be applied repeatedly, such as provisioning test virtual machines or standardized device setup.

## Overview

The script performs the following operations in sequence and reboots the machine at the end.

- Installs the Japanese language pack (`ja-JP`).
- Unifies the system and user UI language, locale, and language list to `ja-JP`.
- Sets the time zone to `Tokyo Standard Time` and the home location to Japan (GeoId `0x7A`).
- Sets the default input method to the Japanese IME (`0411:00000411`).
- Propagates the settings to the Welcome screen and new user profiles.

## Prerequisites

- Windows 11 (expected to work on Windows Server 2022, but not verified).
- PowerShell 5.1 or later (Windows PowerShell or PowerShell 7).
- Administrator privileges.
- Internet connectivity (required to fetch the language pack).

Earlier versions of Windows (Windows 10 and below) are not supported as-is, because the `Install-Language` and `Set-SystemPreferredUILanguage` cmdlets (from the `LanguagePackManagement` module) are available only on Windows 11 and Windows Server 2022 or later.

> [!WARNING]
> The script reboots the system automatically at the end. Save your work before running it.

## Usage

### Option A: One-liner (recommended)

Run the following in a standard PowerShell window. `Install.ps1` downloads the latest `SetWinLang2JP.ps1` from GitHub and executes it, elevating to Administrator automatically if required.

```powershell
iwr -useb https://raw.githubusercontent.com/tokawa-ms/SetWinLang2JP/main/Install.ps1 | iex
```

### Option B: Manual

1. Download `SetWinLang2JP.ps1`.
2. Start PowerShell as Administrator.
3. Run `./SetWinLang2JP.ps1`.
4. The machine reboots automatically once the script finishes.

## Applied Settings

| Setting | Value |
| --- | --- |
| Language pack installation | `ja-JP` (`Install-Language ... -CopyToSettings`) |
| System preferred UI language | `ja-JP` |
| Win UI language override | `ja-JP` |
| System locale | `ja-JP` |
| User language list | `ja-JP, en-US` |
| Default input method | `0411:00000411` (Japanese IME) |
| Time zone | `Tokyo Standard Time` |
| Home location (GeoId) | `0x7A` (Japan) |
| Welcome screen / new user propagation | `Copy-UserInternationalSettingsToSystem` |
| Final action | `Restart-Computer` |

## Repository Layout

```
.
├── Install.ps1          # Bootstrap (download, self-elevate, execute)
├── SetWinLang2JP.ps1    # Main script
├── README.md            # Japanese README
├── README-en.md         # English README (this file)
└── LICENSE              # MIT License
```

## Disclaimer

This project is published for the author's personal productivity and reference. The author assumes no responsibility for any damage or loss arising from the use of this script. Use it at your own risk.

## Contributing

Issues and pull requests are welcome. Please feel free to open one for bug reports or suggestions.

## Reference

- [Windows 11 の日本語化設定を PowerShell で行う (Qiita, Japanese)](https://qiita.com/bibou6/items/0a136bca349050d42b20)

This script is based on the article above, repackaged as a single PS1 for ease of repeated use. The author is grateful to the original writer.

## License

[MIT License](./LICENSE) — Copyright (c) 2026 tokawa-ms
