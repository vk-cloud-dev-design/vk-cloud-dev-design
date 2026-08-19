# 🏗️ Terraform Resource Block & Data Block

> 🚀 A professional guide to understanding and using **Terraform Resource Blocks** and **Data Blocks** for managing and referencing infrastructure in Azure.

---

## 📌 Table of Contents

* [🌟 Overview](#-overview)
* [🧱 Resource Block](#-resource-block)
* [🔎 Data Block](#-data-block)
* [⚖️ Resource vs Data](#️-resource-vs-data)
* [📂 Project Structure](#-project-structure)
* [🧪 Resource Block Example](#-resource-block-example)
* [🔍 Data Block Example](#-data-block-example)
* [🔗 Using Data with Resources](#-using-data-with-resources)
* [🛠️ Common Terraform Workflow](#️-common-terraform-workflow)
* [💡 Best Practices](#-best-practices)
* [📚 Key Takeaways](#-key-takeaways)

---

# 🌟 Overview

Terraform provides two important mechanisms for working with infrastructure:

| Block         | Purpose                            |
| ------------- | ---------------------------------- |
| 🧱 `resource` | Creates and manages infrastructure |
| 🔎 `data`     | Reads existing infrastructure      |

### 🧠 Simple Concept

```text
                 Terraform
                     │
          ┌──────────┴──────────┐
          │                     │
     🧱 RESOURCE            🔎 DATA
          │                     │
     Creates/Manages        Reads existing
     Azure resources        Azure resources
          │                     │
          ▼                     ▼
   Resource Group          Existing RG
   Virtual Network         Existing VNet
   Storage Account         Existing Subnet
   Virtual Machine         Existing Key Vault
```

---

# 🧱 Resource Block

A Terraform **resource block** is used to **create, update, and manage infrastructure resources**.

### 📌 Syntax

```hcl
resource "<RESOURCE_TYPE>" "<RESOURCE_NAME>" {
  argument1 = value
  argument2 = value
}
```

### Example

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "rg-devops-demo"
  location = "Central India"
}
```

Here:

| Component                | Meaning                       |
| ------------------------ | ----------------------------- |
| `resource`               | Terraform resource block      |
| `azurerm_resource_group` | Azure resource type           |
| `rg`                     | Terraform local resource name |
| `name`                   | Azure Resource Group name     |
| `location`               | Azure region                  |

---

# 🔨 Resource Lifecycle

Terraform manages the lifecycle of resources.

```text
        Terraform Configuration
                  │
                  ▼
             terraform plan
                  │
                  ▼
          ┌───────────────┐
          │ Create/Update │
          │    Resource   │
          └───────┬───────┘
                  │
                  ▼
             Azure Resource
                  │
                  ▼
          terraform destroy
                  │
                  ▼
          Resource Removed
```

---

# 🧱 Resource Block Example

## Resource Group

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "rg-devops-demo"
  location = "Central India"
}
```

## Virtual Network

```hcl
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-devops"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}
```

## Subnet

```hcl
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-linux"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
```

### 🔗 Resource Dependency

Notice how the VNet references the Resource Group:

```hcl
resource_group_name = azurerm_resource_group.rg.name
```

Terraform automatically understands the dependency:

```text
Resource Group
      │
      ▼
   VNet
      │
      ▼
   Subnet
```

---

# 🔎 Data Block

A Terraform **data block** is used to **read information about an existing resource**.

It does **not create the resource**.

### 📌 Syntax

```hcl
data "<DATA_SOURCE_TYPE>" "<DATA_NAME>" {
  argument1 = value
}
```

---

# 🔍 Data Block Example

Suppose the Resource Group already exists in Azure.

Instead of creating it again, Terraform can retrieve it using a data block:

```hcl
data "azurerm_resource_group" "existing" {
  name = "rg-existing"
}
```

Terraform can now read information such as:

```hcl
data.azurerm_resource_group.existing.name
```

and:

```hcl
data.azurerm_resource_group.existing.location
```

---

# 🧩 Using Data with Resources

One of the most useful patterns is:

> 🔎 **Read an existing resource → 🧱 Create a new resource using its information**

### Existing Resource Group

```hcl
data "azurerm_resource_group" "existing" {
  name = "rg-existing"
}
```

### Create Storage Account

```hcl
resource "azurerm_storage_account" "storage" {
  name                     = "stdevopsdemo123"
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = data.azurerm_resource_group.existing.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

### 🔗 Architecture

```text
          Existing Azure Resource
                   │
                   ▼
        🔎 Terraform Data Block
                   │
                   │ Reads
                   ▼
          Resource Group Info
                   │
                   ▼
        🧱 Terraform Resource
                   │
                   ▼
          Storage Account
```

---

# ⚖️ Resource vs Data

| Feature                 | 🧱 Resource             | 🔎 Data                        |
| ----------------------- | ----------------------- | ------------------------------ |
| Creates resource        | ✅ Yes                   | ❌ No                           |
| Manages resource        | ✅ Yes                   | ❌ No                           |
| Reads existing resource | ✅ Can reference         | ✅ Yes                          |
| Changes infrastructure  | ✅ Yes                   | ❌ No                           |
| Terraform state         | ✅ Managed               | 🔎 Referenced                  |
| Typical use             | Infrastructure creation | Existing infrastructure lookup |

### 🧠 Easy Way to Remember

```text
RESOURCE = "Create & Manage"

DATA     = "Read & Reference"
```

---

# 📂 Project Structure

A clean Terraform project can be organized like this:

```text
terraform-resource-data/
│
├── 📄 README.md
├── 📄 main.tf
├── 📄 variables.tf
├── 📄 terraform.tfvars
├── 📄 outputs.tf
├── 📄 providers.tf
│
└── 📁 modules/
    │
    ├── 📁 resource-group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── 📁 vnet/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── 📁 subnet/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

# 🧪 Complete Resource Example

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-demo"
  location = "Central India"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-terraform-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-terraform-demo"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
```

---

# 🔎 Complete Data Example

If the Resource Group already exists:

```hcl
data "azurerm_resource_group" "existing" {
  name = "rg-existing"
}
```

Create a VNet inside that existing Resource Group:

```hcl
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-existing-rg"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  address_space       = ["10.10.0.0/16"]
}
```

---

# 🔐 Common Azure Data Sources

Terraform AzureRM provides many useful data sources.

### 📦 Resource Group

```hcl
data "azurerm_resource_group" "rg" {
  name = "existing-rg"
}
```

### 🌐 Virtual Network

```hcl
data "azurerm_virtual_network" "vnet" {
  name                = "existing-vnet"
  resource_group_name = "existing-rg"
}
```

### 🕸️ Subnet

```hcl
data "azurerm_subnet" "subnet" {
  name                 = "existing-subnet"
  virtual_network_name = "existing-vnet"
  resource_group_name  = "existing-rg"
}
```

### 🔑 Key Vault

```hcl
data "azurerm_key_vault" "kv" {
  name                = "existing-keyvault"
  resource_group_name = "existing-rg"
}
```

---

# 🔗 Resource References vs Data References

### 🧱 Resource Reference

```hcl
azurerm_resource_group.rg.name
```

### 🔎 Data Reference

```hcl
data.azurerm_resource_group.existing.name
```

### 🧠 Difference

```text
azurerm_resource_group.rg.name
        │
        └── Resource created/managed by Terraform


data.azurerm_resource_group.existing.name
        │
        └── Existing resource read by Terraform
```

---

# 🛠️ Common Terraform Workflow

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Validate Configuration

```bash
terraform validate
```

### 3️⃣ Format Configuration

```bash
terraform fmt
```

### 4️⃣ Review Changes

```bash
terraform plan
```

### 5️⃣ Deploy Infrastructure

```bash
terraform apply
```

### 6️⃣ Destroy Managed Infrastructure

```bash
terraform destroy
```

---

# 💡 Best Practices

### ✅ 1. Use `resource` for infrastructure Terraform should manage

```hcl
resource "azurerm_virtual_network" "vnet" {
  ...
}
```

### ✅ 2. Use `data` for infrastructure that already exists

```hcl
data "azurerm_resource_group" "existing" {
  ...
}
```

### ✅ 3. Avoid Hardcoding Values

❌ Avoid:

```hcl
location = "Central India"
```

✅ Prefer variables:

```hcl
location = var.location
```

---

### ✅ 4. Use Meaningful Names

❌ Avoid:

```hcl
resource "azurerm_virtual_network" "x" {
}
```

✅ Prefer:

```hcl
resource "azurerm_virtual_network" "production_vnet" {
}
```

---

### ✅ 5. Use Modules for Reusable Infrastructure

```text
Root Module
    │
    ├── Resource Group Module
    │
    ├── VNet Module
    │
    ├── Subnet Module
    │
    ├── NSG Module
    │
    └── VM Module
```

---

### ✅ 6. Follow Naming Standards

Example:

```text
rg-dev-network
vnet-dev
snet-web
nsg-web
vm-linux-dev
```

Consistent naming makes large Terraform environments easier to manage.

---

# 🚨 Common Mistake

### ❌ Trying to create an already-existing resource

```hcl
resource "azurerm_resource_group" "rg" {
  name = "existing-rg"
}
```

If the Resource Group already exists and is not managed by this Terraform configuration, this approach can cause a conflict.

### ✅ Use a Data Block

```hcl
data "azurerm_resource_group" "rg" {
  name = "existing-rg"
}
```

Then reference it:

```hcl
resource_group_name = data.azurerm_resource_group.rg.name
```

---

# 🎯 Real-World Scenario

Imagine your Azure environment already contains:

```text
Azure
│
└── Resource Group
      │
      ├── Existing VNet
      ├── Existing Subnet
      └── Existing Key Vault
```

You want Terraform to deploy a new VM.

Instead of recreating the existing infrastructure:

```text
🔎 DATA
   │
   ├── Existing Resource Group
   ├── Existing VNet
   ├── Existing Subnet
   └── Existing Key Vault
             │
             ▼
          🧱 RESOURCE
             │
             └── New Virtual Machine
```

This allows Terraform to work safely with existing Azure infrastructure.

---

# 📚 Key Takeaways

| Concept      | Remember                              |
| ------------ | ------------------------------------- |
| 🧱 Resource  | Creates and manages infrastructure    |
| 🔎 Data      | Reads existing infrastructure         |
| 🔗 Reference | Connect resources together            |
| 📦 Module    | Reusable Terraform configuration      |
| 🗂️ State    | Tracks resources managed by Terraform |
| 🔐 Variables | Keep configuration flexible           |
| 🧪 Plan      | Review changes before applying        |

---

# 🏆 Quick Interview Questions

### ❓ What is a Terraform Resource Block?

A resource block defines infrastructure that Terraform will **create and manage**.

### ❓ What is a Terraform Data Block?

A data block retrieves information about **existing infrastructure** without creating or managing that resource.

### ❓ Can a data block create a resource?

❌ No.

### ❓ Can a resource reference a data source?

✅ Yes.

Example:

```hcl
resource_group_name = data.azurerm_resource_group.existing.name
```

### ❓ What is the easiest way to remember the difference?

```text
🧱 RESOURCE → CREATE / MANAGE

🔎 DATA     → READ / REFERENCE
```

---

# 🚀 Terraform Learning Path

```text
🟢 Terraform Basics
       │
       ▼
🧱 Resource Blocks
       │
       ▼
🔎 Data Blocks
       │
       ▼
📌 Variables & Outputs
       │
       ▼
🔄 Locals & Expressions
       │
       ▼
🔁 count & for_each
       │
       ▼
📦 Modules
       │
       ▼
🗂️ Remote State
       │
       ▼
🔐 Azure Landing Zone
       │
       ▼
🚀 Terraform CI/CD
```

---

## ⭐ Conclusion

Understanding **Resource Blocks** and **Data Blocks** is fundamental to writing professional Terraform configurations.

> 🧱 **Resource = Terraform creates/manages it**
> 🔎 **Data = Terraform reads/references it**

Master these two concepts before moving into **Variables → Locals → `for_each` → Modules → Remote State → CI/CD**.

---

### 👨‍💻 Terraform | Azure | DevOps

**Infrastructure as Code • Cloud Automation • CI/CD • Azure Architecture**

⭐ If this repository helps you learn Terraform, consider giving it a **Star**.
