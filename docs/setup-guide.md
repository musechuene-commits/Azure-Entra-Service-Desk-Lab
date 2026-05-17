# Setup Guide

## Project Overview

Azure Entra Service Desk Lab is a simulated enterprise identity and access management environment built using Microsoft Entra ID, Azure CLI, and PowerShell automation.

The project demonstrates service desk administration workflows including:

- User onboarding
- User offboarding
- Password reset operations
- Security group administration
- RBAC implementation
- Bulk user provisioning
- Azure identity administration

---

# Environment Requirements

## Software & Tools

| Tool | Purpose |
|---|---|
| Microsoft Azure Account | Cloud administration |
| Microsoft Entra ID | Identity & access management |
| Azure CLI | Cloud command-line administration |
| PowerShell | Automation scripting |
| Visual Studio Code | Script editing |
| GitHub Desktop | Version control |

---

# Azure Environment Setup

## Step 1 — Sign In to Azure

Open PowerShell or Azure Cloud Shell and sign in:

```powershell
az login
```

Verify active subscription:

```powershell
az account show
```

---

## Step 2 — Open Microsoft Entra ID

In Azure Portal:

```text
Azure Portal → Microsoft Entra ID
```

---

## Step 3 — Create Security Groups

Create the following security groups:

- IT-Access
- HR-Access
- Finance-Access
- Sales-Access
- Operations-Access
- Management-Access
- All-Employees

Group Type:

```text
Security
```

Membership Type:

```text
Assigned
```

---

# Simulated Company Structure

| Department | Users |
|---|---|
| IT | 10 |
| HR | 10 |
| Finance | 15 |
| Sales | 45 |
| Operations | 15 |
| Management | 5 |

Total Simulated Users:

```text
100 Employees
```

---

# Script Execution

All scripts are located inside:

```text
/scripts
```

## Bulk User Creation

```powershell
.\create-users.ps1
```

---

## Group Assignment

```powershell
.\assign-groups.ps1
```

---

## Password Reset

```powershell
.\reset-password.ps1
```

---

## User Offboarding

```powershell
.\offboard-user.ps1
```

---

# Security & Administrative Concepts Demonstrated

- Identity and Access Management (IAM)
- RBAC (Role-Based Access Control)
- User Lifecycle Management
- Service Desk Operations
- Cloud Administration
- Administrative Automation
- Azure Identity Management

---

# Notes

This project was created for:

- Educational purposes
- Cloud administration practice
- IT support portfolio development
- Service desk workflow simulation

No production tenant or sensitive organizational data was used.

---

# Author

## Musa Chuene

- GitHub: https://github.com/musechuene-commits
- LinkedIn: https://linkedin.com/in/musa-chuene-57a4461a8