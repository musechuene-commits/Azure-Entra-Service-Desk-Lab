# ============================================================
# Script Name : reset-password.ps1
# Project     : Azure Entra Service Desk Lab
# Purpose     : Simulate a service desk password reset request
# Tooling     : Azure CLI
# Author      : Musa Chuene
# ============================================================

# User requesting password reset
$UserUpn = "alice.it@musechuenegmail.onmicrosoft.com"

# Temporary password for lab use
$TemporaryPassword = "TempP@ssword2026!"

Write-Host "============================================"
Write-Host " Azure Entra ID Password Reset Started"
Write-Host "============================================"

# Verify Azure CLI login
az account show 1>$null 2>$null

if ($LASTEXITCODE -ne 0) {
    Write-Host "Azure CLI login not detected." -ForegroundColor Yellow
    Write-Host "Run: az login"
    exit
}

Write-Host "Processing password reset for: $UserUpn"

# Confirm user exists
$UserId = az ad user show `
    --id $UserUpn `
    --query id `
    -o tsv 2>$null

if (-not $UserId) {
    Write-Host "FAILED: User not found: $UserUpn" -ForegroundColor Red
    exit
}

# Reset password and force user to change at next login
az ad user update `
    --id $UserUpn `
    --password "$TemporaryPassword" `
    --force-change-password-next-sign-in true `
    1>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: Password reset completed" -ForegroundColor Green
    Write-Host "User must change password at next sign-in"
}
else {
    Write-Host "FAILED: Password reset failed" -ForegroundColor Red
}

Write-Host "============================================"
Write-Host " Password reset workflow completed"
Write-Host "============================================"