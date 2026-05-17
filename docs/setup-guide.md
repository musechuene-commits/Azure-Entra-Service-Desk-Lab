# Setup Guide

## Project Environment

This lab was built to simulate a small enterprise service desk environment using Microsoft Entra ID, Azure CLI, and PowerShell.

## Requirements

- Microsoft Azure account
- Microsoft Entra ID tenant
- Azure CLI installed
- PowerShell
- GitHub account
- Visual Studio Code

## Setup Steps

1. Sign in to the Azure Portal.
2. Open Microsoft Entra ID.
3. Create security groups for each department:
   - IT-Access
   - HR-Access
   - Finance-Access
   - Sales-Access
   - Operations-Access
   - Management-Access
   - All-Employees
4. Create test users manually.
5. Assign users to department-based groups.
6. Open Azure CLI or PowerShell.
7. Run automation scripts from the `scripts` folder.

## Azure CLI Login

```powershell
az login
az account show