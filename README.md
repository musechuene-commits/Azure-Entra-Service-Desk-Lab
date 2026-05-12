# Azure Entra ID Service Desk Lab

## Project Overview

This project simulates a real-world IT Support / Service Desk environment using Microsoft Entra ID (Azure AD), Azure Cloud Shell, PowerShell, and Azure CLI automation.

The lab demonstrates:
- User onboarding
- Identity and Access Management (IAM)
- Group-based access control
- Password reset administration
- Automated user provisioning
- Automated group assignment
- User offboarding
- Azure cloud administration

This project was built to simulate enterprise IT administration tasks performed by:
- IT Support Technicians
- Service Desk Analysts
- Azure Administrators
- Junior System Administrators
- IAM Administrators

---

# Technologies Used

- Microsoft Entra ID (Azure AD)
- Azure Cloud Shell
- PowerShell
- Azure CLI
- Microsoft Graph
- Windows 11

---

# Project Structure

```text
Azure-Entra-Service-Desk-Lab
│
├── scripts
│   ├── create-100-users.ps1
│   ├── assign-users-to-groups.ps1
│   └── offboard-user.ps1
│
├── screenshots
│
├── docs
│
└── README.md

Features Implemented
Manual User Provisioning

Created organizational users manually:

John IT
Sarah HR
Mike Finance
Linda Sales
David Ops

Configured:

Departments
Job titles
Group assignments
Password reset scenarios
Security Groups Created
IT-Access
HR-Access
Finance-Access
Sales-Access
Operations-Access
Management-Access
All-Employees
Automated User Provisioning

Used Azure CLI automation in Azure Cloud Shell to:

Create multiple users automatically
Generate User Principal Names (UPNs)
Assign passwords
Simulate enterprise onboarding

Example automated users:

Alice IT
Brian HR
Chris Finance
Diana Sales
Ethan Ops
Automated Group Assignment

Implemented automated group membership assignment using Azure CLI.

Users were automatically assigned to:

IT-Access
HR-Access
Finance-Access
Sales-Access
Operations-Access
Offboarding Simulation

Simulated employee termination/offboarding:

Disabled user accounts
Removed group access
Verified access revocation
Automation Example
az ad user create `
    --display-name "Alice IT" `
    --user-principal-name "alice.it@musechuenegmail.onmicrosoft.com" `
    --password "P@ssword12345!" `
    --mail-nickname "aliceit" `
    --force-change-password-next-sign-in true
Skills Demonstrated
IT Support Skills
User provisioning
Password resets
Group management
Access control
User lifecycle management
Help desk administration
Cloud & Automation Skills
Azure administration
Microsoft Entra ID
PowerShell scripting
Azure CLI automation
IAM administration
Cloud Shell operations
Screenshots
Azure User Management

(Add screenshots here)

Automated User Provisioning

(Add screenshots here)

Group Assignment

(Add screenshots here)

Offboarding Simulation

(Add screenshots here)

Key Learning Outcomes
Learned how enterprise identity systems are managed
Automated user onboarding using Azure CLI
Implemented group-based access control
Simulated IT service desk workflows
Practiced cloud administration in Microsoft Azure
Improved PowerShell and automation skills
Future Improvements
Multi-Factor Authentication (MFA)
Conditional Access Policies
Intune Device Management
Automated password rotation
Ticketing system integration
Logging and monitoring
Author
Musa Chuene
LinkedIn: https://linkedin.com/in/musa-chuene-57a4461a8
GitHub: https://github.com/musechuene-commits
Disclaimer

This project was created for educational and portfolio purposes only in a controlled Azure lab environment.