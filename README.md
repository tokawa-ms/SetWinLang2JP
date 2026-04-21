# SetWinLang2JP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?logo=powershell&logoColor=white)](https://learn.microsoft.com/powershell/)
[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows/windows-11)
[![GitHub stars](https://img.shields.io/github/stars/tokawa-ms/SetWinLang2JP?style=social)](https://github.com/tokawa-ms/SetWinLang2JP/stargazers)
[![GitHub last commit](https://img.shields.io/github/last-commit/tokawa-ms/SetWinLang2JP)](https://github.com/tokawa-ms/SetWinLang2JP/commits/main)

English version: [README-en.md](./README-en.md)

Windows 11 のシステム／ユーザー インターフェイス言語を日本語へ一括変更する PowerShell スクリプトです。検証用 VM やキッティングなど、同じ設定を何度も繰り返す場面で「ダウンロードして実行するだけ」にすることを目的としています。

## ✨ 特長

- 🇯🇵 Windows 11 の UI 言語・システムロケール・ユーザーロケールを日本語 (ja-JP) に統一
- 🕒 タイムゾーンを `Tokyo Standard Time`、地域を日本 (GeoId `0x7A`) に設定
- ⌨️ 既定の入力方式を日本語 IME (`0411:00000411`) に設定
- 👥 Welcome 画面と新規ユーザーにも同じ設定を反映
- 🚀 ワンライナーでダウンロード〜実行〜再起動まで自動化

## 📋 前提条件

- Windows 11
- PowerShell 5.1 以上 (Windows PowerShell / PowerShell 7 のいずれか)
- 管理者権限で実行できること
- インターネット接続 (言語パック取得のため)

> [!WARNING]
> 本スクリプトは最後に **自動で PC を再起動** します。作業中のファイルは事前に保存してください。

## 🚀 使い方

### オプション A: ワンライナー (推奨)

通常の PowerShell ウィンドウで以下を実行します。`Install.ps1` が最新の `SetWinLang2JP.ps1` を GitHub から取得して実行します。管理者権限が無ければ自動で昇格します。

```powershell
iwr -useb https://raw.githubusercontent.com/tokawa-ms/SetWinLang2JP/main/Install.ps1 | iex
```

### オプション B: 手動実行

1. `SetWinLang2JP.ps1` をダウンロード
2. PowerShell を **管理者として実行**
3. `./SetWinLang2JP.ps1` を実行
4. 処理完了後、自動的に再起動されます

## 🧩 スクリプトが行うこと

| 項目 | 値 |
| --- | --- |
| 言語パック インストール | `ja-JP` (`Install-Language ... -CopyToSettings`) |
| システム優先 UI 言語 | `ja-JP` |
| Win UI 言語オーバーライド | `ja-JP` |
| システムロケール | `ja-JP` |
| ユーザー言語リスト | `ja-JP, en-US` |
| 既定の入力方式 | `0411:00000411` (日本語 IME) |
| タイムゾーン | `Tokyo Standard Time` |
| 地域 (GeoId) | `0x7A` (Japan) |
| Welcome / 新規ユーザーへの適用 | `Copy-UserInternationalSettingsToSystem` |
| 最後に | `Restart-Computer` |

## 🗂️ リポジトリ構成

```
.
├── Install.ps1          # ブートストラップ (ダウンロード＆実行・自動昇格)
├── SetWinLang2JP.ps1    # 本体 (日本語化処理)
├── README.md            # 日本語 README (このファイル)
├── README-en.md         # 英語 README
└── LICENSE              # MIT License
```

## ⚠️ 免責事項

本プロジェクトは作者個人の生産性向上と備忘のためのものです。本スクリプトの利用によって生じたいかなる損害についても、作者は責任を負いません。各自の責任においてご利用ください。

## 🤝 コントリビュート

Issue / Pull Request は歓迎です。バグ報告や改善提案はお気軽にどうぞ。

## 📚 参考

- [Windows11 の日本語化設定を PowerShell で行う (Qiita)](https://qiita.com/bibou6/items/0a136bca349050d42b20)

記事の内容ほぼそのままですが、繰り返し使うにあたり「PS1 をダウンロードして実行するだけ」の状態にしたくてまとめたものです。元記事の作者の方に感謝します。

## 📝 ライセンス

[MIT License](./LICENSE) — Copyright (c) 2026 tokawa-ms
