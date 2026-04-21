# SetWinLang2JP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?logo=powershell&logoColor=white)](https://learn.microsoft.com/powershell/)
[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows/windows-11)
[![GitHub stars](https://img.shields.io/github/stars/tokawa-ms/SetWinLang2JP?style=social)](https://github.com/tokawa-ms/SetWinLang2JP/stargazers)
[![GitHub last commit](https://img.shields.io/github/last-commit/tokawa-ms/SetWinLang2JP)](https://github.com/tokawa-ms/SetWinLang2JP/commits/main)

日本語版: [README.md](./README.md)

A PowerShell script that switches a Windows 11 machine's system / user interface language to **Japanese (ja-JP)** in one shot. Designed for scenarios such as test VMs, lab re-imaging and kitting, where the same configuration has to be repeated over and over — "just download and run".

## ✨ Features

- 🇯🇵 Sets UI language, system locale, and user locale to Japanese (`ja-JP`)
- 🕒 Sets time zone to `Tokyo Standard Time` and home location to Japan (GeoId `0x7A`)
- ⌨️ Sets the default input method to the Japanese IME (`0411:00000411`)
- 👥 Applies the same settings to the Welcome screen and new user profiles
- 🚀 One-liner bootstrap that downloads, elevates, runs, and reboots

## 📋 Prerequisites

- Windows 11
- PowerShell 5.1 or later (Windows PowerShell or PowerShell 7)
- Ability to run as Administrator
- Internet connectivity (required to fetch the language pack)

> [!WARNING]
> This script **reboots the PC automatically** at the end. Save your work before running it.

## 🚀 Usage

### Option A: One-liner (recommended)

Run the following in a regular PowerShell window. `Install.ps1` downloads the latest `SetWinLang2JP.ps1` from GitHub and executes it. If the session is not elevated, it will self-elevate automatically.

```powershell
iwr -useb https://raw.githubusercontent.com/tokawa-ms/SetWinLang2JP/main/Install.ps1 | iex
```

### Option B: Manual

1. Download `SetWinLang2JP.ps1`
2. Start PowerShell **as Administrator**
3. Run `./SetWinLang2JP.ps1`
4. The machine reboots automatically once the script finishes

## 🧩 What the script does

| Setting | Value |
| --- | --- |
| Language pack install | `ja-JP` (`Install-Language ... -CopyToSettings`) |
| System preferred UI language | `ja-JP` |
| Win UI language override | `ja-JP` |
| System locale | `ja-JP` |
| User language list | `ja-JP, en-US` |
| Default input method | `0411:00000411` (Japanese IME) |
| Time zone | `Tokyo Standard Time` |
| Home location (GeoId) | `0x7A` (Japan) |
| Apply to Welcome screen / new users | `Copy-UserInternationalSettingsToSystem` |
| Final step | `Restart-Computer` |

## 🗂️ Repository layout

```
.
├── Install.ps1          # Bootstrap (download + run + self-elevate)
├── SetWinLang2JP.ps1    # Main script (Japanese localization)
├── README.md            # Japanese README
├── README-en.md         # English README (this file)
└── LICENSE              # MIT License
```

## ⚠️ Disclaimer

This project exists for the author's personal productivity and notes. The author accepts **no responsibility** for any damage caused by using this script. Use at your own risk.

## 🤝 Contributing

Issues and pull requests are welcome. Feel free to open one for bug reports or improvements.

## 📚 Reference

- [Windows11 の日本語化設定を PowerShell で行う (Qiita, Japanese)](https://qiita.com/bibou6/items/0a136bca349050d42b20)

This project is essentially the content of the article above packaged as a single PS1 so it can be "downloaded and run" repeatedly. Many thanks to the original author.

## 📝 License

[MIT License](./LICENSE) — Copyright (c) 2026 tokawa-ms
