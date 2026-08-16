# ☁️ Azure Hierarchy & Resource Organization

![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?logo=microsoftazure\&logoColor=white)
![Cloud](https://img.shields.io/badge/Cloud-Computing-4285F4)
![DevOps](https://img.shields.io/badge/Focus-DevOps-2496ED)
![Documentation](https://img.shields.io/badge/Documentation-Markdown-000000?logo=markdown\&logoColor=white)

A practical guide to understanding **Microsoft Azure's resource hierarchy**, including Tenants, Management Groups, Subscriptions, Resource Groups, and Azure Resources.

This document is useful for **Azure administrators, cloud engineers, DevOps engineers, and interview preparation**.

---

## 📑 Table of Contents

* [Overview](#-overview)
* [Azure Hierarchy](#-azure-hierarchy)
* [Hierarchy Diagram](#-hierarchy-diagram)
* [1. Microsoft Entra Tenant](#1️⃣-microsoft-entra-tenant)
* [2. Management Groups](#2️⃣-management-groups)
* [3. Subscriptions](#3️⃣-subscriptions)
* [4. Resource Groups](#4️⃣-resource-groups)
* [5. Azure Resources](#5️⃣-azure-resources)
* [Complete Example](#-complete-example)
* [RBAC Hierarchy](#-rbac-hierarchy)
* [Azure Policy](#-azure-policy)
* [Naming & Organization](#-recommended-organization)
* [Best Practices](#-best-practices)
* [DevOps Perspective](#-devops-perspective)
* [Interview Questions](#-interview-questions)
* [Quick Summary](#-quick-summary)

---

# 🔎 Overview

Azure uses a hierarchical structure to organize cloud resources and apply:

* 🔐 Security
* 👥 Access control
* 📜 Governance
* 💰 Cost management
* 🏷️ Resource organization
* 📊 Monitoring
* 🛡️ Compliance

Understanding this hierarchy is fundamental for designing an **Azure Landing Zone** and managing enterprise-scale Azure environments.

---

# 🏗️ Azure Hierarchy

The logical Azure hierarchy can be represented as:

```text
☁️ Microsoft Entra Tenant
│
├── 📁 Management Group
│   │
│   ├── 📦 Subscription
│   │   │
│   │   ├── 📂 Resource Group
│   │   │   │
│   │   │   ├── 🖥️ Virtual Machine
│   │   │   ├── 🌐 Virtual Network
│   │   │   ├── 💾 Storage Account
│   │   │   ├── 🔐 Key Vault
│   │   │   └── ⚖️ Load Balancer
│   │   │
│   │   └── 📂 Resource Group
│   │
│   └── 📦 Subscription
│
└── 📁 Management Group
    │
    └── 📦 Subscription
```

### 🔑 Important relationship

```text
Tenant
   ↓
Management Groups
   ↓
Subscriptions
   ↓
Resource Groups
   ↓
Azure Resources
```

> ⚠️ Management Groups are optional. A subscription can exist without being placed under a custom Management Group.

---

# 1️⃣ Microsoft Entra Tenant

A **Microsoft Entra tenant** represents an organization's identity boundary in Azure.

It contains:

* 👤 Users
* 👥 Groups
* 🔐 Applications
* 🪪 Service Principals
* 🤖 Managed Identities
* 📋 Directory configuration

The tenant is associated with Azure subscriptions.

### Example

```text
🏢 Company
   │
   └── Microsoft Entra Tenant
           │
           ├── Users
           ├── Groups
           ├── Applications
           └── Azure Subscriptions
```

### Key Point

The **tenant is primarily an identity and directory boundary**, while subscriptions are the primary resource and billing containers.

---

# 2️⃣ Management Groups

Management Groups provide a way to organize multiple Azure subscriptions.

They are particularly useful in **enterprise environments**.

### Example

```text
🏢 Organization
│
└── ☁️ Tenant
     │
     └── 🏢 Root Management Group
          │
          ├── 🛡️ Platform
          │    ├── 📦 Connectivity Subscription
          │    └── 📦 Identity Subscription
          │
          └── 💻 Landing Zones
               ├── 📦 Production Subscription
               ├── 📦 Development Subscription
               └── 📦 Testing Subscription
```

### Why use Management Groups?

* 📜 Apply Azure Policies at scale
* 🔐 Assign RBAC at higher scopes
* 🛡️ Implement governance
* 📊 Manage multiple subscriptions
* 🏢 Support enterprise-scale Azure

---

# 3️⃣ Subscriptions

An **Azure Subscription** is a major boundary for:

* 💰 Billing
* 🔐 Access control
* 📜 Governance
* 📊 Resource management
* 📈 Usage and quotas

A subscription contains Resource Groups and Azure resources.

### Example

```text
📦 Production Subscription
│
├── 📂 Network-RG
├── 📂 Application-RG
├── 📂 Monitoring-RG
└── 📂 Security-RG
```

### Why use multiple subscriptions?

Organizations may separate subscriptions by:

* Environment
* Business unit
* Application
* Geography
* Security boundary
* Billing requirements

Example:

```text
📦 Production
📦 Development
📦 Testing
📦 Shared Services
📦 Security
📦 Connectivity
```

---

# 4️⃣ Resource Groups

A **Resource Group (RG)** is a logical container for Azure resources.

Example:

```text
📂 Application-RG
│
├── 🖥️ Virtual Machine
├── 🌐 Network Interface
├── 💾 Managed Disk
├── 🔐 Key Vault
└── 📊 Log Analytics Workspace
```

### Important characteristics

A Resource Group:

* Belongs to one subscription
* Contains Azure resources
* Can have RBAC assignments
* Can have Azure Policies applied
* Can be used for lifecycle management

### ⚠️ Important

Resources in a Resource Group don't necessarily have to be the same technical type.

For example:

```text
Application-RG
│
├── VM
├── Storage Account
├── Key Vault
├── VNet
└── Load Balancer
```

---

# 5️⃣ Azure Resources

Resources are the actual services and infrastructure deployed in Azure.

Examples:

### 🖥️ Compute

* Virtual Machines
* VM Scale Sets
* Azure Kubernetes Service
* App Service

### 🌐 Networking

* Virtual Network
* Subnet
* Network Security Group
* Azure Firewall
* Application Gateway
* Load Balancer
* VPN Gateway
* Public IP

### 💾 Storage

* Storage Account
* Blob Storage
* Managed Disks
* Azure Files

### 🔐 Security

* Key Vault
* Microsoft Defender for Cloud
* Managed Identity

### 📊 Monitoring

* Azure Monitor
* Log Analytics Workspace
* Application Insights

---

# 🔗 Complete Example

Consider a company deploying a production application.

```text
🏢 Organization
│
└── ☁️ Microsoft Entra Tenant
     │
     └── 🏢 Management Group
          │
          └── 📦 Production Subscription
               │
               ├── 📂 Network-RG
               │    │
               │    ├── 🌐 VNet
               │    ├── 🔥 Azure Firewall
               │    ├── ⚖️ Application Gateway
               │    └── 🔐 NSG
               │
               ├── 📂 Application-RG
               │    │
               │    ├── 🖥️ VM
               │    ├── ⚙️ App Service
               │    └── 📦 Storage Account
               │
               └── 📂 Monitoring-RG
                    │
                    ├── 📊 Azure Monitor
                    ├── 📋 Log Analytics
                    └── 📈 Application Insights
```

---

# 🔐 RBAC Hierarchy

Azure Role-Based Access Control can be assigned at different scopes.

```text
🌐 Management Group
       ↓
📦 Subscription
       ↓
📂 Resource Group
       ↓
🖥️ Resource
```

A role assigned at a higher scope can be inherited by lower scopes.

### Example

If a user receives:

```text
Contributor
    ↓
Production Subscription
```

The role can apply to resources within that subscription, subject to Azure RBAC inheritance and scope rules.

### Common Azure roles

| Role                         | Purpose                                       |
| ---------------------------- | --------------------------------------------- |
| 👑 Owner                     | Full access including access management       |
| 🔧 Contributor               | Manage resources but cannot grant RBAC access |
| 👀 Reader                    | View resources                                |
| 🔐 User Access Administrator | Manage user access                            |

---

# 📜 Azure Policy

Azure Policy helps enforce organizational standards and compliance.

Policies can be assigned at scopes such as:

```text
Management Group
       ↓
Subscription
       ↓
Resource Group
       ↓
Resource
```

### Example policies

```text
📜 Allowed Locations
📜 Required Tags
📜 Allowed Resource Types
📜 Require Managed Identity
📜 Deny Public IP
📜 Require Encryption
```

Example:

```text
🏢 Management Group
        │
        └── 📜 Policy
             │
             ├── Subscription A
             ├── Subscription B
             └── Subscription C
```

This allows organizations to enforce governance consistently across multiple subscriptions.

---

# 🏷️ Recommended Organization

A professional Azure environment should use consistent naming and tagging.

### Example Resource Naming

```text
rg-prod-network-india
rg-prod-app-india
vnet-prod-hub-india
vm-prod-web-01
kv-prod-app-india
stprodappindia
```

### Recommended tags

```text
Environment = Production
Application = Payment
Owner       = DevOps
CostCenter  = CC1001
Department  = IT
ManagedBy   = Terraform
```

Tags help with:

* 💰 Cost management
* 📊 Reporting
* 🏷️ Organization
* 🔎 Resource identification
* 🤖 Automation

---

# 🛡️ Azure Landing Zone Perspective

Azure hierarchy is an important part of an **Azure Landing Zone** architecture.

A typical enterprise structure might look like:

```text
☁️ Microsoft Entra Tenant
│
└── 🏢 Root Management Group
     │
     ├── 🛡️ Platform
     │    │
     │    ├── 📦 Identity
     │    ├── 📦 Connectivity
     │    └── 📦 Management
     │
     └── 🚀 Landing Zones
          │
          ├── 📦 Production
          ├── 📦 Development
          └── 📦 Testing
```

This structure allows centralized governance while maintaining separation between workloads.

---

# 🔄 Azure Resource Scope

Azure resources can be managed at different scopes:

```text
🌐 Tenant
   │
   └── 🏢 Management Group
         │
         └── 📦 Subscription
               │
               └── 📂 Resource Group
                     │
                     └── 🖥️ Resource
```

Different Azure features operate at different scopes.

For example:

| Scope            | Common Usage                  |
| ---------------- | ----------------------------- |
| Management Group | Enterprise governance         |
| Subscription     | Billing and isolation         |
| Resource Group   | Resource organization         |
| Resource         | Individual service management |

---

# ⚙️ DevOps Perspective

As a DevOps Engineer, understanding Azure hierarchy is important when working with:

* Terraform
* Azure DevOps
* GitHub Actions
* Azure Policy
* RBAC
* Azure Landing Zones
* CI/CD
* Infrastructure as Code

### Example Terraform structure

```text
Terraform
    │
    ▼
Azure Subscription
    │
    ├── Resource Group
    │      │
    │      ├── VNet
    │      ├── Subnet
    │      ├── NSG
    │      └── VM
    │
    └── Resource Group
           │
           ├── Key Vault
           └── Storage Account
```

---

# 🧠 Important Concepts

### Subscription ≠ Resource Group

A subscription can contain multiple Resource Groups.

```text
Subscription
│
├── RG-01
├── RG-02
└── RG-03
```

### Resource Group ≠ Subscription

A Resource Group belongs to exactly one subscription.

### Management Group ≠ Resource Group

Management Groups organize **subscriptions**.

Resource Groups organize **resources**.

### Azure Policy ≠ RBAC

**Azure Policy** controls what is allowed or required.

**RBAC** controls who can perform actions.

---

# 🎯 Best Practices

### ✅ 1. Use Management Groups for enterprise governance

Organize subscriptions based on organizational and governance requirements.

### ✅ 2. Separate production and non-production

For example:

```text
Production
Development
Testing
Sandbox
```

### ✅ 3. Apply RBAC using least privilege

Give users only the permissions they require.

### ✅ 4. Use Azure Policy

Enforce:

* Allowed regions
* Required tags
* Security requirements
* Resource restrictions

### ✅ 5. Use consistent naming

Define naming standards before deploying resources.

### ✅ 6. Use tags

Use tags for cost, ownership, environment, and application identification.

### ✅ 7. Use Infrastructure as Code

Tools such as Terraform can provide repeatable and version-controlled Azure deployments.

---

# 💡 Interview Questions

### Q1. What is the Azure hierarchy?

The main resource-management hierarchy is:

```text
Management Group
      ↓
Subscription
      ↓
Resource Group
      ↓
Resource
```

A Microsoft Entra tenant provides the identity/directory context around the Azure environment.

---

### Q2. What is a Management Group?

A Management Group is a container used to organize multiple Azure subscriptions and apply governance at scale.

---

### Q3. What is an Azure Subscription?

A subscription is a major boundary for Azure resources, billing, access control, quotas, and governance.

---

### Q4. What is a Resource Group?

A Resource Group is a logical container that holds related Azure resources.

---

### Q5. Can one Resource Group belong to multiple subscriptions?

❌ No.

A Resource Group belongs to **one subscription**.

---

### Q6. Can resources from different subscriptions exist in one Resource Group?

❌ No.

Resources in a Resource Group must belong to the same subscription as that Resource Group.

---

### Q7. What is the difference between Management Group and Resource Group?

| Management Group                         | Resource Group                 |
| ---------------------------------------- | ------------------------------ |
| Organizes subscriptions                  | Organizes resources            |
| Enterprise governance                    | Workload/resource organization |
| Can contain subscriptions                | Contains Azure resources       |
| Used heavily for policy/RBAC inheritance | Used for resource management   |

---

### Q8. What is the difference between Azure Policy and RBAC?

| Azure Policy                     | RBAC                            |
| -------------------------------- | ------------------------------- |
| Governance                       | Authorization                   |
| Defines what is allowed/required | Defines who can perform actions |
| Compliance                       | Access control                  |
| Example: allowed regions         | Example: Contributor role       |

---

# 📌 Quick Summary

```text
                 ☁️ AZURE
                    │
          Microsoft Entra Tenant
                    │
                    ▼
          🏢 Management Groups
                    │
                    ▼
             📦 Subscriptions
                    │
                    ▼
             📂 Resource Groups
                    │
                    ▼
              🖥️ Resources
```

### Remember:

> **Management Groups organize Subscriptions.**
> **Subscriptions contain Resource Groups.**
> **Resource Groups contain Resources.**
> **RBAC controls access.**
> **Azure Policy enforces governance.**

---

# 📚 Related Topics

Continue your Azure learning with:

* ☁️ Azure Resource Groups
* 🌐 Azure Virtual Network
* 🔐 Azure RBAC
* 📜 Azure Policy
* 🏗️ Azure Landing Zone
* 🔥 Azure Firewall
* ⚖️ Application Gateway
* 🛡️ Network Security Groups
* 🧱 Terraform with Azure
* 🚀 Azure DevOps CI/CD

---

## 👨‍💻 Repository Purpose

This documentation is created for:

* 📚 Azure learning
* 🧪 Hands-on practice
* 💼 DevOps interview preparation
* 🏗️ Cloud architecture understanding
* 🚀 Infrastructure as Code learning

---

⭐ **If this documentation is useful, consider giving the repository a star.**

> **Learn → Practice → Automate → Deploy → Monitor**

