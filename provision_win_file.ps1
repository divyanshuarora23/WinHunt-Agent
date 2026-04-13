# provision_win_file.ps1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$sharePath = "C:\SharedData"
$secretFile = "$sharePath\secret.txt"

# Create folder
if (-not (Test-Path $sharePath)) {
    New-Item -ItemType Directory -Path $sharePath -Force
}

# Create secret file
Set-Content -Path $secretFile -Value "API_KEY=FAKE_1234567890" -Encoding UTF8

# Create SMB Share
if (-not (Get-SmbShare -Name "PublicShare" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "PublicShare" -Path $sharePath -FullAccess "Everyone"
}

# Enable firewall SMB rules
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing" -ErrorAction SilentlyContinue

Write-Host "[+] SMB Share created and configured."
