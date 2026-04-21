# SetWinLang2JP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?logo=powershell&logoColor=white)](https://learn.microsoft.com/powershell/)
[![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows/windows-11)
[![GitHub last commit](https://img.shields.io/github/last-commit/tokawa-ms/SetWinLang2JP)](https://github.com/tokawa-ms/SetWinLang2JP/commits/main)

English version: [README-en.md](./README-en.md)

`SetWinLang2JP` は、Windows 11 のシステムおよびユーザー インターフェイス言語を日本語 (ja-JP) に一括で設定する PowerShell スクリプトです。検証用 VM のセットアップやキッティング作業など、同一の地域設定を繰り返し適用する用途を想定しています。

## 概要

本スクリプトは以下の設定を一連の処理として実行し、最後にシステムを再起動します。

- 言語パック (`ja-JP`) のインストール
- システムおよびユーザーの UI 言語、ロケール、言語リストの `ja-JP` への統一
- タイムゾーンを `Tokyo Standard Time`、地域を Japan (GeoId `0x7A`) に設定
- 既定の入力方式を日本語 IME (`0411:00000411`) に設定
- 上記設定を Welcome 画面および新規ユーザー プロファイルへ反映

## 前提条件

- Windows 11 (Windows Server 2022 でも動作する想定ですが未検証です)
- PowerShell 5.1 以上 (Windows PowerShell または PowerShell 7)
- 管理者権限での実行
- インターネット接続 (言語パックの取得に必要)

Windows 10 以前では、本スクリプトが利用する `Install-Language` および `Set-SystemPreferredUILanguage` コマンドレット (`LanguagePackManagement` モジュール) が存在しないため、そのままでは動作しません。

> [!WARNING]
> 本スクリプトは処理の最後でシステムを自動的に再起動します。実行前に作業中のファイルを保存してください。

## 使用方法

### オプション A: ワンライナー (推奨)

通常の PowerShell ウィンドウで以下を実行してください。`Install.ps1` が最新の `SetWinLang2JP.ps1` を GitHub から取得して実行します。管理者権限で起動されていない場合は自動的に昇格します。

```powershell
iwr -useb https://raw.githubusercontent.com/tokawa-ms/SetWinLang2JP/main/Install.ps1 | iex
```

### オプション B: 手動実行

1. `SetWinLang2JP.ps1` をダウンロードします。
2. PowerShell を管理者として起動します。
3. `./SetWinLang2JP.ps1` を実行します。
4. 処理完了後、自動的に再起動されます。

## 適用される設定

| 設定項目 | 値 |
| --- | --- |
| 言語パックのインストール | `ja-JP` (`Install-Language ... -CopyToSettings`) |
| システム優先 UI 言語 | `ja-JP` |
| Win UI 言語オーバーライド | `ja-JP` |
| システム ロケール | `ja-JP` |
| ユーザー言語リスト | `ja-JP, en-US` |
| 既定の入力方式 | `0411:00000411` (日本語 IME) |
| タイムゾーン | `Tokyo Standard Time` |
| 地域 (GeoId) | `0x7A` (Japan) |
| Welcome 画面 / 新規ユーザーへの反映 | `Copy-UserInternationalSettingsToSystem` |
| 処理完了時 | `Restart-Computer` |

## リポジトリ構成

```
.
├── Install.ps1          # ブートストラップ (ダウンロード・自動昇格・実行)
├── SetWinLang2JP.ps1    # 本体スクリプト
├── README.md            # 日本語 README (本ファイル)
├── README-en.md         # 英語 README
└── LICENSE              # MIT License
```

## 免責事項

本プロジェクトは作者個人の生産性向上および備忘を目的として公開しているものです。本スクリプトの利用により生じたいかなる損害についても、作者は一切の責任を負いません。各自の責任においてご利用ください。

## コントリビュート

Issue および Pull Request を歓迎します。バグ報告・改善提案がございましたらお気軽にお寄せください。

## 参考

- [Windows 11 の日本語化設定を PowerShell で行う (Qiita)](https://qiita.com/bibou6/items/0a136bca349050d42b20)

本スクリプトは上記記事の内容に基づいており、繰り返し適用しやすいよう単一の PS1 にまとめたものです。元記事の著者に感謝いたします。

## ライセンス

[MIT License](./LICENSE) — Copyright (c) 2026 tokawa-ms
