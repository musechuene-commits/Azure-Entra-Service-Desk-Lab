# ============================================================
# Script Name : offboard-user.ps1
# Project     : Azure Entra Service Desk Lab
# Purpose     : Disable a user account and remove access during offboarding
# Tooling     : Azure CLI
# Author      : Musa Chuene
# ============================================================

# User to offboard
$UserUpn = "diana.sales@musechuenegmail.onmicrosoft.com"

# Department access group to remove
$GroupName = "Sales-Access"

Write-Host "============================================"
Write-Host " Azure Entra ID User Offboarding Started"
Write-Host "============================================"

# Verify Azure CLI login
az account show 1>$null 2>$null

if ($LASTEXITCODE -ne 0) {
    Write-Host "Azure CLI login not detected." -ForegroundColor Yellow
    Write-Host "Run: az login"
    exit
}

Write-Host "Processing offboarding request for: $UserUpn"

# Retrieve User ID
$UserId = az ad user show `
    --id $UserUpn `
    --query id `
    -o tsv 2>$null

if (-not $UserId) {
    Write-Host "FAILED: User not found: $UserUpn" -ForegroundColor Red
    exit
}

# Retrieve Group ID
$GroupId = az ad group show `
    --group $GroupName `
    --query id `
    -o tsv 2>$null

if (-not $GroupId) {
    Write-Host "FAILED: Group not found: $GroupName" -ForegroundColor Red
    exit
}

# Step 1: Disable user account
Write-Host "Disabling user account..."

az ad user update `
    --id $UserUpn `
    --account-enabled false `
    1>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: User account disabled" -ForegroundColor Green
}
else {
    Write-Host "FAILED: Could not disable user account" -ForegroundColor Red
}

# Step 2: Remove user from access group
Write-Host "Removing user from group: $GroupName"

az ad group member remove `
    --group $GroupId `
    --member-id $UserId `
    1>$null 2>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: User removed from $GroupName" -ForegroundColor Green
}
else {
    Write-Host "WARNING: User may not be a member of $GroupName or removal failed" -ForegroundColor Yellow
}

# Step 3: Verify final account status
Write-Host ""
Write-Host "Verifying account status..."

az ad user show `
    --id $UserUpn `
    --query "{DisplayName:displayName, UserPrincipalName:userPrincipalName, AccountEnabled:accountEnabled}" `
    --output table

Write-Host ""
Write-Host "============================================"
Write-Host " Offboarding process completed"
Write-Host "============================================"