# =========================================
# CREATE 100 USERS AUTOMATION SCRIPT
# Azure Entra ID / Azure CLI
# =========================================

# Azure tenant domain
$domain = "musechuenegmail.onmicrosoft.com"

# Departments
$departments = @(
    "IT",
    "HR",
    "Finance",
    "Sales",
    "Operations"
)

Write-Host "Starting automated user creation..."

# =========================================
# CREATE USERS
# =========================================

for ($i = 1; $i -le 100; $i++) {

    # Rotate departments
    $department = $departments[($i - 1) % $departments.Count]

    # Create names
    $displayName = "Employee $i $department"

    # Create username
    $upn = "employee$i.$($department.ToLower())@$domain"

    # Create mail nickname
    $nickname = "employee$i$($department.ToLower())"

    # Create user
    az ad user create `
        --display-name "$displayName" `
        --user-principal-name "$upn" `
        --password "P@ssword12345!" `
        --mail-nickname "$nickname" `
        --force-change-password-next-sign-in true

    Write-Host "Created user: $displayName"
}

Write-Host "100 users created successfully."