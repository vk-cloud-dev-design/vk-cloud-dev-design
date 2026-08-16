## 📁 Project Structure

```text
azure-terraform/
│
├── 📄 main.tf
├── 📄 variables.tf
├── 📄 terraform.tfvars
├── 📄 outputs.tf
├── 📄 providers.tf
├── 📄 versions.tf
├── 📄 README.md
├── 📄 .gitignore
│
├── 📦 modules/
│   ├── 📁 resource-group/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   │
│   ├── 🌐 vnet/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   │
│   ├── 🔗 subnet/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   │
│   ├── 🛡️ nsg/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   │
│   ├── 🌍 public-ip/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   │
│   ├── 🐧 linux-vm/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   │
│   └── ⚖️ load-balancer/
│       ├── 📄 main.tf
│       ├── 📄 variables.tf
│       └── 📄 outputs.tf
│
├── 🌎 environments/
│   ├── 🧪 dev/
│   │   ├── 📄 terraform.tfvars
│   │   └── 📄 backend.tf
│   │
│   ├── 🚀 staging/
│   │   ├── 📄 terraform.tfvars
│   │   └── 📄 backend.tf
│   │
│   └── 🏭 prod/
│       ├── 📄 terraform.tfvars
│       └── 📄 backend.tf
│
├── 📚 docs/
│   ├── 🏗️ architecture.md
│   └── 🔐 security.md
│
└── ⚙️ .github/
    └── workflows/
        ├── 🔍 terraform-plan.yml
        └── 🚀 terraform-apply.yml
```
