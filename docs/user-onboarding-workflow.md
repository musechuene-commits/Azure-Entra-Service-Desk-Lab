
## 2. Paste this into `user-onboarding-workflow.md`

```markdown
# User Onboarding Workflow

## Purpose

This document explains the simulated onboarding process used in the Azure Entra Service Desk Lab.

## Scenario

A new employee joins the company and requires access to Microsoft Entra ID resources based on their department.

## Workflow

1. HR submits a new starter request.
2. Service Desk receives the onboarding ticket.
3. IT verifies the employee department and access requirements.
4. A user account is created in Microsoft Entra ID.
5. The user is assigned to the correct security group.
6. A temporary password is issued.
7. The user is required to change password at first sign-in.
8. The ticket is marked as resolved.

## Department Access Mapping

| Department | Security Group |
|---|---|
| IT | IT-Access |
| HR | HR-Access |
| Finance | Finance-Access |
| Sales | Sales-Access |
| Operations | Operations-Access |
| Management | Management-Access |

## Service Desk Value

This workflow demonstrates:

- User lifecycle management
- Access control
- RBAC
- IAM administration
- Ticket-based service desk thinking
- Automation readiness