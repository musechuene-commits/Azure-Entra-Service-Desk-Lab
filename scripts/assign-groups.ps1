# ============================================================
# Script Name : assign-groups.ps1
# Project     : Azure Entra Service Desk Lab
# Purpose     : Automate department-based security group assignment
# Tooling     : Azure CLI
# Author      : Musa Chuene
# ============================================================

Write-Host "============================================"
Write-Host " Azure Entra ID Group Assignment Started"
Write-Host "============================================"

# Verify Azure CLI login
az account show 1>$null 2>$null

if ($LASTEXITCODE -ne 0) {
    Write-Host "Azure CLI login not detected." -ForegroundColor Yellow
    Write-Host "Run: az login"
    exit
}

# User-to-group assignment mappings
$Assignments = @(
    @{User="alice.it@musechuenegmail.onmicrosoft.com"; Group="IT-Access"},
    @{User="brian.hr@musechuenegmail.onmicrosoft.com"; Group="HR-Access"},
    @{User="chris.finance@musechuenegmail.onmicrosoft.com"; Group="Finance-Access"},
    @{User="diana.sales@musechuenegmail.onmicrosoft.com"; Group="Sales-Access"},
    @{User="ethan.ops@musechuenegmail.onmicrosoft.com"; Group="Operations-Access"}
)

foreach ($Assignment in $Assignments) {

    $User = $Assignment.User
    $Group = $Assignment.Group

    Write-Host ""
    Write-Host "Processing: $User → $Group"

    # Retrieve User ID
    $UserId = az ad user show `
        --id $User `
        --query id `
        -o tsv 2>$null

    # Retrieve Group ID
    $GroupId = az ad group show `
        --group $Group `
        --query id `
        -o tsv 2>$null

    # Validate user existence
    if (-not $UserId) {
        Write-Host "FAILED: User not found: $User" -ForegroundColor Red
        continue
    }

    # Validate group existence
    if (-not $GroupId) {
        Write-Host "FAILED: Group not found: $Group" -ForegroundColor Red
        continue
    }

    # Add user to group
    az ad group member add `
        --group $GroupId `
        --member-id $UserId `
        1>$null

    if ($LASTEXITCODE -eq 0) {
        Write-Host "SUCCESS: Added $User to $Group" -ForegroundColor Green
    }
    else {
        Write-Host "FAILED: Could not assign $User to $Group" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "============================================"
Write-Host " Group assignment automation completed"
Write-Host "============================================"