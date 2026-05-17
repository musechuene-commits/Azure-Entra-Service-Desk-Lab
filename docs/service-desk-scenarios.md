# Service Desk Scenarios

## Scenario 1: New User Onboarding

**Request:** HR requests a new account for a Sales employee.

**Action Taken:**
- Create user in Microsoft Entra ID
- Assign user to `Sales-Access`
- Force password change at next login

**Script Used:**
```powershell
.\create-users.ps1
.\assign-groups.ps1