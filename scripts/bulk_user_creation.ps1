$domain = "musechuenegmail.onmicrosoft.com"

$users = @(
    @{First="Alice"; Last="IT"; Department="IT"; Job="IT Support Technician"},
    @{First="Brian"; Last="HR"; Department="HR"; Job="HR Administrator"},
    @{First="Chris"; Last="Finance"; Department="Finance"; Job="Finance Clerk"},
    @{First="Diana"; Last="Sales"; Department="Sales"; Job="Sales Consultant"},
    @{First="Ethan"; Last="Ops"; Department="Operations"; Job="Operations Coordinator"}
)

foreach ($u in $users) {
    $displayName = "$($u.First) $($u.Last)"
    $upn = "$($u.First.ToLower()).$($u.Last.ToLower())@$domain"

    $passwordProfile = @{
        Password = "P@ssword123!"
        ForceChangePasswordNextSignIn = $true
    }

    try {
        New-MgUser `
            -DisplayName $displayName `
            -UserPrincipalName $upn `
            -MailNickname "$($u.First.ToLower())$($u.Last.ToLower())" `
            -AccountEnabled `
            -PasswordProfile $passwordProfile `
            -Department $u.Department `
            -JobTitle $u.Job

        Write-Host "Created user: $displayName"
    }
    catch {
        Write-Host "FAILED: $displayName"
        Write-Host $_.Exception.Message
    }
}