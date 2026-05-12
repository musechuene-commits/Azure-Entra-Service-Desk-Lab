# =========================================
# OFFBOARD USER AUTOMATION SCRIPT
# Azure Entra ID / Azure CLI
# =========================================

# User to offboard
$userUpn = "diana.sales@musechuenegmail.onmicrosoft.com"

# Group to remove from
$groupName = "Sales-Access"

Write-Host "Starting offboarding process for $userUpn"

# =========================================
# STEP 1 — Disable User Account
# =========================================

az ad user update `
    --id $userUpn `
    --account-enabled false

Write-Host "User account disabled."

# =========================================
# STEP 2 — Get User ID
# =========================================

$userId = az ad user show `
    --id $userUpn `
    --query id `
    -o tsv

# =========================================
# STEP 3 — Get Group ID
# =========================================

$groupId = az ad group show `
    --group $groupName `
    --query id `
    -o tsv

# =========================================
# STEP 4 — Remove User From Group
# =========================================

az ad group member remove `
    --group $groupId `
    --member-id $userId

Write-Host "User removed from group."

# =========================================
# STEP 5 — Verify Account Status
# =========================================

az ad user show `
    --id $userUpn `
    --query "{DisplayName:displayName, AccountEnabled:accountEnabled}" `
    --output table

Write-Host "Offboarding completed successfully."