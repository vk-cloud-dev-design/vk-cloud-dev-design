# ⚖️ Azure Load Balancer vs Application Gateway

> A quick comparison of two important Azure traffic distribution services.

---

## 🔄 Architecture

```text
                    🌐 Internet
                         │
              ┌──────────┴──────────┐
              │                     │
              ▼                     ▼
      ⚖️ Load Balancer       🚪 Application Gateway
              │                     │
        ┌─────┴─────┐         ┌─────┴─────┐
        ▼           ▼         ▼           ▼
      VM-1         VM-2     Web/App-1   Web/App-2
📊 Comparison
Feature	⚖️ Azure Load Balancer	🚪 Application Gateway
OSI Layer	Layer 4	Layer 7
Traffic	TCP / UDP	HTTP / HTTPS
Main Purpose	Network load balancing	Web traffic & application routing
Routing	IP + Port	URL, Host, Header, Cookie
SSL/TLS Termination	❌ No	✅ Yes
WAF	❌ No	✅ Yes
Path-Based Routing	❌ No	✅ Yes
Host-Based Routing	❌ No	✅ Yes
Web Application	Basic	Advanced
Performance	⚡ Very High	⚡ High
Backend	VMs, VMSS, etc.	Web apps, VMs, VMSS, etc.
⚖️ Azure Load Balancer

Layer 4 Load Balancer

Client
  │
  ▼
Load Balancer
  │
  ├──► VM-1
  ├──► VM-2
  └──► VM-3
Best For
TCP/UDP applications
High-performance network traffic
VM and VMSS workloads
Internal applications
Public-facing applications
🚪 Azure Application Gateway

Layer 7 Web Application Load Balancer

Client
  │
  ▼
Application Gateway
  │
  ├── /api  ──► API Servers
  │
  ├── /app  ──► App Servers
  │
  └── /web  ──► Web Servers
Best For
HTTP/HTTPS applications
URL-based routing
Host-based routing
SSL/TLS termination
Web Application Firewall (WAF)
Web application protection
🧠 Easy Way to Remember

Load Balancer = Layer 4 = TCP/UDP = Network Traffic

Application Gateway = Layer 7 = HTTP/HTTPS = Web Traffic

🎯 Which One Should You Use?
Requirement	Recommended
TCP/UDP traffic	⚖️ Load Balancer
HTTP/HTTPS traffic	🚪 Application Gateway
URL-based routing	🚪 Application Gateway
SSL termination	🚪 Application Gateway
WAF protection	🚪 Application Gateway
Very high L4 performance	⚖️ Load Balancer
VM/VMSS network load balancing	⚖️ Load Balancer
🚀 Quick Summary
⚖️ Load Balancer
      ↓
Layer 4
      ↓
TCP / UDP
      ↓
Network Load Balancing


🚪 Application Gateway
      ↓
Layer 7
      ↓
HTTP / HTTPS
      ↓
Application Routing + WAF
