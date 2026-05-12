# ==========================================
# Azure Entra ID Group Assignment Automation
# ==========================================

$assignments = @(
    @{User="alice.it@musechuenegmail.onmicrosoft.com"; Group="IT-Access"},
    @{User="brian.hr@musechuenegmail.onmicrosoft.com"; Group="HR-Access"},
    @{User="chris.finance@musechuenegmail.onmicrosoft.com"; Group="Finance-Access"},
    @{User="diana.sales@musechuenegmail.onmicrosoft.com"; Group="Sales-Access"},
    @{User="ethan.ops@musechuenegmail.onmicrosoft.com"; Group="Operations-Access"}
)

foreach ($a in $assignments) {

    # Get User ID
    $userId = az ad user show `
        --id $a.User `
        --query id `
        -o tsv

    # Get Group ID
    $groupId = az ad group show `
        --group $a.Group `
        --query id `
        -o tsv

    # Add user to group
    az ad group member add `
        --group $groupId `
        --member-id $userId

    Write-Host "Added $($a.User) to $($a.Group)"
}

Write-Host ""
Write-Host "==================================="
Write-Host "Group assignment completed."
Write-Host "==================================="