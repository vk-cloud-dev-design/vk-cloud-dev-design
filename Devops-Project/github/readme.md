# 🚀 Git & GitHub — DevOps Learning Repository

![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?logo=git\&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Repository%20Management-181717?logo=github\&logoColor=white)
![DevOps](https://img.shields.io/badge/Focus-DevOps-2496ED?logo=docker\&logoColor=white)
![Documentation](https://img.shields.io/badge/Documentation-Markdown-000000?logo=markdown\&logoColor=white)

A structured and practical **Git & GitHub learning repository** covering everything from Git fundamentals to professional branching strategies, Pull Requests, code reviews, conflict resolution, GitHub Actions, and DevOps workflows.

This repository is designed for **hands-on learning, interview preparation, and real-world DevOps practice**.

---

## 📖 Table of Contents

* [About](#-about)
* [Git vs GitHub](#-git-vs-github)
* [Repository Structure](#-repository-structure)
* [Git Workflow](#-git-workflow)
* [Learning Path](#-learning-path)
* [Essential Commands](#-essential-git-commands)
* [Branching Strategy](#-branching-strategy)
* [Pull Request Workflow](#-pull-request-workflow)
* [GitHub Features](#-github-features)
* [GitHub Actions](#-github-actions)
* [Troubleshooting](#-troubleshooting)
* [Best Practices](#-git-best-practices)
* [Useful Resources](#-useful-resources)

---

# 📌 About

**Git** is a distributed version control system used to track changes in source code and collaborate with other developers.

**GitHub** is a cloud-based platform that provides hosting and collaboration features for Git repositories.

Together, Git and GitHub form one of the most commonly used source-control solutions in modern DevOps environments.

---

# 🔀 Git vs GitHub

| Git                    | GitHub                               |
| ---------------------- | ------------------------------------ |
| Version control system | Cloud-based development platform     |
| Runs locally           | Runs primarily in the cloud          |
| Tracks file changes    | Hosts Git repositories               |
| Supports branching     | Provides Pull Requests               |
| Supports merging       | Provides code reviews                |
| Command-line based     | Web-based collaboration              |
| Open source            | GitHub is a Microsoft-owned platform |

---

# 🏗️ Repository Structure

The repository is organized into progressive learning modules:

```text
git-github/
│
├── 01-git-fundamentals/
├── 02-repository-management/
├── 03-staging-and-commits/
├── 04-branching/
├── 05-pull-requests/
├── 06-github/
├── 07-git-workflows/
├── 08-conflict-resolution/
├── 09-advanced-git/
├── 10-github-actions/
├── 11-troubleshooting/
└── cheatsheet/
```

Each module contains:

* 📄 Concept documentation
* 💻 Practical commands
* 🧪 Hands-on examples
* 🖼️ Screenshots/diagrams
* 📝 Interview notes where applicable

---

# 🔄 Git Workflow

The fundamental Git workflow can be represented as:

```text
                    ┌──────────────────┐
                    │  Working Tree   │
                    └────────┬─────────┘
                             │
                         git add
                             │
                             ▼
                    ┌──────────────────┐
                    │  Staging Area   │
                    └────────┬─────────┘
                             │
                       git commit
                             │
                             ▼
                    ┌──────────────────┐
                    │ Local Repository │
                    └────────┬─────────┘
                             │
                        git push
                             │
                             ▼
                    ┌──────────────────┐
                    │ GitHub Repository│
                    └──────────────────┘
```

---

# 🎯 Learning Path

Follow the modules in this order:

### 01 — Git Fundamentals

Learn:

* Git installation
* Git configuration
* `git init`
* `git status`
* `git add`
* `git commit`
* `git log`

📁 [`01-git-fundamentals/`](./01-git-fundamentals/)

---

### 02 — Repository Management

Learn:

* Creating repositories
* Cloning repositories
* Remote repositories
* `git remote`
* Connecting local Git to GitHub

📁 [`02-repository-management/`](./02-repository-management/)

---

### 03 — Staging & Commits

Learn:

* Working tree
* Staging area
* Commit lifecycle
* Commit history
* `git diff`
* `git show`

📁 [`03-staging-and-commits/`](./03-staging-and-commits/)

---

### 04 — Branching

Learn:

* Creating branches
* Switching branches
* Feature branches
* Merging
* Branch deletion
* Branch naming conventions

📁 [`04-branching/`](./04-branching/)

---

### 05 — Pull Requests

Learn:

* Creating Pull Requests
* Code reviews
* Review comments
* Approvals
* Merge strategies
* Branch protection

📁 [`05-pull-requests/`](./05-pull-requests/)

---

### 06 — GitHub

Learn:

* GitHub repositories
* Issues
* Permissions
* Branch protection
* Repository settings
* Collaborators

📁 [`06-github/`](./06-github/)

---

### 07 — Git Workflows

Learn professional Git workflows:

* Feature Branch Workflow
* GitHub Flow
* GitFlow
* Release branches
* Hotfix branches

📁 [`07-git-workflows/`](./07-git-workflows/)

---

### 08 — Conflict Resolution

Learn how to handle:

* Merge conflicts
* Conflict markers
* Manual resolution
* Rebase conflicts
* Conflict prevention

📁 [`08-conflict-resolution/`](./08-conflict-resolution/)

---

### 09 — Advanced Git

Learn:

* `git stash`
* `git reset`
* `git revert`
* `git rebase`
* Interactive rebase
* Cherry-pick
* HEAD
* Detached HEAD

📁 [`09-advanced-git/`](./09-advanced-git/)

---

### 10 — GitHub Actions

Learn GitHub CI/CD:

* Workflow files
* Jobs
* Steps
* Runners
* Secrets
* Environment variables
* Build pipelines
* Deployment workflows

📁 [`10-github-actions/`](./10-github-actions/)

---

### 11 — Troubleshooting

Common real-world problems:

* Authentication errors
* Push rejected
* Merge conflicts
* Wrong branch
* Detached HEAD
* Remote URL problems
* Accidentally committed files
* Undoing commits

📁 [`11-troubleshooting/`](./11-troubleshooting/)

---

# 💻 Essential Git Commands

## Repository

```bash
git init
git clone <repository-url>
git status
git remote -v
```

## Staging

```bash
git add filename
git add .
git restore --staged filename
```

## Commit

```bash
git commit -m "Add new feature"
git log
git log --oneline
git show
```

## Branching

```bash
git branch
git branch feature-branch
git checkout feature-branch
git checkout -b feature-branch
```

## Merge

```bash
git checkout main
git merge feature-branch
```

## Push & Pull

```bash
git push
git push -u origin feature-branch
git pull origin main
```

---

# 🌿 Branching Strategy

A typical development workflow:

```text
                         main
                           │
                           │
                    ┌──────┴──────┐
                    │             │
              feature/login   feature/payment
                    │             │
                    │             │
                 commits       commits
                    │             │
                    └──────┬──────┘
                           │
                      Pull Request
                           │
                      Code Review
                           │
                         Merge
                           │
                           ▼
                          main
```

Recommended branch naming:

```text
feature/<feature-name>
bugfix/<bug-name>
hotfix/<issue-name>
release/<version>
```

Example:

```text
feature/login
feature/payment-api
bugfix/database-connection
hotfix/security-patch
release/v1.0.0
```

---

# 🔀 Pull Request Workflow

```text
Developer
    │
    ▼
Create Feature Branch
    │
    ▼
Make Changes
    │
    ▼
git add
    │
    ▼
git commit
    │
    ▼
git push
    │
    ▼
Pull Request
    │
    ▼
Code Review
    │
    ├── Changes Required
    │       │
    │       └── Developer Updates Code
    │
    ▼
Approval
    │
    ▼
Merge
    │
    ▼
main
```

---

# 🛡️ GitHub Features

Important GitHub features covered in this repository:

* 📦 Repositories
* 🌿 Branches
* 🔀 Pull Requests
* 👀 Code Reviews
* 🐛 Issues
* 🔐 Branch Protection
* 👥 Collaborators
* 🔑 Access Management
* 🤖 GitHub Actions
* 🏷️ Releases
* 📋 Projects
* 🔒 Secrets

---

# 🤖 GitHub Actions

GitHub Actions can be used to implement CI/CD pipelines directly inside GitHub.

Example:

```text
Developer
    │
    ▼
git push
    │
    ▼
GitHub
    │
    ▼
GitHub Actions
    │
    ├── Checkout Code
    ├── Build
    ├── Test
    ├── Security Scan
    └── Deploy
          │
          ▼
      Production
```

Example workflow:

```yaml
name: CI Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run build
        run: echo "Build successful"

      - name: Run tests
        run: echo "Tests successful"
```

---

# ⚠️ Troubleshooting

Common Git errors and solutions are documented under:

📁 [`11-troubleshooting/`](./11-troubleshooting/)

Examples:

```text
Author identity unknown
Authentication failed
Permission denied
Push rejected
Non-fast-forward
Merge conflict
Detached HEAD
Remote repository not found
```

---

# ✅ Git Best Practices

### 1. Write meaningful commit messages

Good:

```bash
git commit -m "Add Azure deployment workflow"
```

Avoid:

```bash
git commit -m "changes"
```

### 2. Create feature branches

Avoid making every change directly on `main`.

### 3. Keep commits small

Each commit should represent a logical change.

### 4. Pull before pushing

```bash
git pull --rebase origin main
git push
```

### 5. Protect the main branch

Use:

* Pull Requests
* Required reviews
* Status checks
* Branch protection rules

### 6. Never commit secrets

Do **not** commit:

```text
passwords
API keys
tokens
private keys
cloud credentials
.env files
```

Use GitHub Secrets or an appropriate secret-management solution instead.

---

# 📚 Cheat Sheet

A quick command reference is available here:

📁 [`cheatsheet/`](./cheatsheet/)

| Operation     | Command                    |
| ------------- | -------------------------- |
| Initialize    | `git init`                 |
| Clone         | `git clone <url>`          |
| Status        | `git status`               |
| Add           | `git add .`                |
| Commit        | `git commit -m "message"`  |
| Log           | `git log --oneline`        |
| Branch        | `git branch`               |
| Create branch | `git checkout -b <name>`   |
| Switch branch | `git checkout <name>`      |
| Merge         | `git merge <branch>`       |
| Push          | `git push`                 |
| Pull          | `git pull`                 |
| Remote        | `git remote -v`            |
| Stash         | `git stash`                |
| Revert        | `git revert <commit>`      |
| Reset         | `git reset`                |
| Rebase        | `git rebase`               |
| Cherry-pick   | `git cherry-pick <commit>` |

---

# 🖼️ Documentation & Images

Screenshots, architecture diagrams, Git workflows, and GitHub UI references are stored inside the individual module's `images/` directory.

Example:

```text
04-branching/
│
├── README.md
├── branch-commands.md
├── branch-strategy.md
└── images/
    └── branching-model.png
```

Images can be referenced in Markdown:

```markdown
![Git Branching Model](./images/branching-model.png)
```

---

# 🧪 Hands-on Practice

The recommended approach is:

```text
Learn
  ↓
Understand
  ↓
Practice Commands
  ↓
Create Branch
  ↓
Make Changes
  ↓
Commit
  ↓
Push
  ↓
Create Pull Request
  ↓
Code Review
  ↓
Merge
  ↓
Repeat
```

The goal is not only to memorize Git commands but to understand the **complete development workflow**.

---

# 🎓 DevOps Interview Topics

This repository also covers Git/GitHub topics commonly asked in DevOps interviews:

* Git vs GitHub
* Git vs SVN
* `git fetch` vs `git pull`
* `git merge` vs `git rebase`
* `git reset` vs `git revert`
* `git stash`
* Cherry-pick
* Detached HEAD
* Merge conflicts
* Branching strategies
* Pull Requests
* Branch protection
* GitHub Actions
* GitHub Secrets
* CI/CD with GitHub Actions

---

# 📈 Learning Progress

* [ ] Git installation & configuration
* [ ] Git fundamentals
* [ ] Repository management
* [ ] Staging & commits
* [ ] Branching
* [ ] Merging
* [ ] Pull Requests
* [ ] GitHub repository management
* [ ] Branch protection
* [ ] Git workflows
* [ ] Merge conflict resolution
* [ ] Advanced Git
* [ ] GitHub Actions
* [ ] Troubleshooting
* [ ] DevOps interview preparation

---

# 📚 Useful Resources

* [Git Documentation](https://git-scm.com/docs)
* [GitHub Documentation](https://docs.github.com/)
* [GitHub Skills](https://skills.github.com/)

---

## 👨‍💻 Author

**DevOps Learning Repository**

Focused on:

```text
Git
GitHub
Azure
Terraform
Docker
Kubernetes
CI/CD
DevOps
Cloud Infrastructure
```

---

⭐ **If you find this repository useful, consider giving it a star.**

> This repository is intended for learning, hands-on practice, documentation, and DevOps interview preparation.
