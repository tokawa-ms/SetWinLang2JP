<#
.SYNOPSIS
    SetWinLang2JP bootstrap / helper script.

.DESCRIPTION
    Downloads the latest SetWinLang2JP.ps1 from the GitHub repository and
    executes it. If the current PowerShell session is not elevated, this
    script re-launches itself as Administrator automatically.

.EXAMPLE
    # One-liner (run in an ordinary PowerShell window):
    iwr -useb https://raw.githubusercontent.com/tokawa-ms/SetWinLang2JP/main/Install.ps1 | iex

.NOTES
    After SetWinLang2JP.ps1 finishes, the system will reboot automatically.
#>

[CmdletBinding()]
param(
    [string]$RepoOwner  = 'tokawa-ms',
    [string]$RepoName   = 'SetWinLang2JP',
    [string]$Branch     = 'main',
    [string]$ScriptName = 'SetWinLang2JP.ps1'
)

$ErrorActionPreference = 'Stop'

$BootstrapUrl = "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/Install.ps1"
$ScriptUrl    = "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/$ScriptName"

function Test-IsAdministrator {
    $id = [Security.Principal.WindowsIdentity]::GetCurrent()
    $pr = New-Object Security.Principal.WindowsPrincipal($id)
    return $pr.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-IsAdministrator)) {
    Write-Host '[SetWinLang2JP] Administrator privileges are required. Re-launching elevated...' -ForegroundColor Yellow

    # When invoked via `iwr | iex`, $PSCommandPath is empty, so re-run the
    # one-liner in the elevated process instead of pointing at a local file.
    $elevatedCommand = "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force; " +
                       "iwr -useb '$BootstrapUrl' | iex"

    Start-Process -FilePath 'powershell.exe' `
                  -ArgumentList @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-Command', $elevatedCommand) `
                  -Verb RunAs | Out-Null
    return
}

Write-Host "[SetWinLang2JP] Downloading $ScriptName from $ScriptUrl" -ForegroundColor Cyan

$tempPath = Join-Path -Path $env:TEMP -ChildPath ("SetWinLang2JP_{0}.ps1" -f ([guid]::NewGuid().ToString('N')))

try {
    # TLS 1.2 for older Windows PowerShell hosts.
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $ScriptUrl -UseBasicParsing -OutFile $tempPath

    Write-Host "[SetWinLang2JP] Running $ScriptName ..." -ForegroundColor Cyan
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tempPath
}
finally {
    if (Test-Path -LiteralPath $tempPath) {
        Remove-Item -LiteralPath $tempPath -Force -ErrorAction SilentlyContinue
    }
}
