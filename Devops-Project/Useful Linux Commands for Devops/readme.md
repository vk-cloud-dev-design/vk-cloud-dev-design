# 🐧 Linux Commands for DevOps

> 🚀 Essential Linux commands for DevOps, Cloud, Automation, Troubleshooting & System Administration.

---

## 📂 File & Directory Management

| Command | Purpose |
|---|---|
| `pwd` | Show current directory |
| `ls -la` | List files with details |
| `cd` | Change directory |
| `mkdir` | Create directory |
| `touch` | Create file |
| `cp` | Copy files/directories |
| `mv` | Move/rename files |
| `rm -rf` | Remove files/directories |
| `find` | Find files |
| `tree` | Display directory structure |

```bash
pwd
ls -la
find /var/log -name "*.log"
📄 File & Text Operations
Command	Purpose
cat	Display file
less	Read large files
head	Show first lines
tail	Show last lines
grep	Search text
sort	Sort output
uniq	Remove duplicates
wc	Count lines/words
awk	Process text
sed	Search & replace
🔥 Useful DevOps Example
grep "ERROR" /var/log/app.log
tail -f /var/log/app.log
💾 Disk & Storage
Command	Purpose
df -h	Disk usage
du -sh	Directory size
du -sh *	Size of each item
lsblk	List disks
mount	Show mounted filesystems
findmnt	Show mount points
🔥 Find Large Files
du -ah /var | sort -rh | head -20
🧠 CPU & Memory
Command	Purpose
top	Monitor processes
htop	Interactive process monitor
free -h	Memory usage
uptime	System uptime/load
lscpu	CPU information
vmstat	System performance
free -h
uptime
top
⚙️ Process Management
Command	Purpose
ps aux	List processes
pgrep	Find process
kill	Terminate process
kill -9	Force terminate
pkill	Kill by process name
jobs	Show background jobs
nohup	Run process after logout
ps aux | grep nginx
kill <PID>
🔧 Services & Systemd
systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable nginx
systemctl disable nginx
Check Service Logs
journalctl -u nginx
journalctl -u nginx -f
🌐 Networking
Command	Purpose
ip addr	Show IP addresses
ip route	Show routing table
ping	Test connectivity
ss -tulpn	Show listening ports
curl	Test HTTP/API
wget	Download files
dig	DNS lookup
nslookup	DNS lookup
traceroute	Trace network path
tcpdump	Capture packets
🔥 Common Troubleshooting
ip addr
ip route
ss -tulpn
ping 8.8.8.8
curl -I https://example.com
dig google.com
🔐 Users & Permissions
whoami
id
who
w
sudo -i
chmod 755 script.sh
chown user:user file.txt
Permission Example
-rwxr-xr-x
 │ │ │
 │ │ └── Others
 │ └──── Group
 └────── Owner
🔑 SSH
ssh user@server
ssh -i key.pem user@server
scp file.txt user@server:/tmp/
Copy Directory
scp -r myfolder user@server:/tmp/
📦 Package Management
Ubuntu / Debian
apt update
apt upgrade
apt install nginx
apt remove nginx
apt search nginx
RHEL / CentOS
dnf install nginx
dnf update
dnf remove nginx
dnf search nginx
📜 Logs & Troubleshooting
View Logs
tail -f /var/log/syslog
tail -f /var/log/messages
journalctl -xe
Search Logs
grep -i "error" /var/log/syslog
grep -i "failed" /var/log/syslog
🔍 Find & Search
find /var/log -name "*.log"
find / -type f -size +1G 2>/dev/null
grep -R "ERROR" /var/log/
🗜️ Archive & Compression
tar -czvf backup.tar.gz /data/
tar -xzvf backup.tar.gz
gzip file.log
gunzip file.log.gz
🔄 File Transfer & Sync
rsync
rsync -avz source/ user@server:/backup/
Useful Options
-a  Archive
-v  Verbose
-z  Compression
-h  Human readable
🐳 Docker
docker ps
docker ps -a
docker images
docker logs <container>
docker exec -it <container> bash
docker inspect <container>
docker stats
☸️ Kubernetes
kubectl get pods
kubectl get nodes
kubectl get svc
kubectl describe pod <pod>
kubectl logs <pod>
kubectl exec -it <pod> -- bash
kubectl get events
🧪 Quick DevOps Troubleshooting Flow
🚨 Issue
   │
   ▼
📊 CPU / Memory
   │
   ├── top
   ├── free -h
   └── uptime
   │
   ▼
💾 Disk
   │
   ├── df -h
   └── du -sh
   │
   ▼
🌐 Network
   │
   ├── ip addr
   ├── ip route
   └── ss -tulpn
   │
   ▼
⚙️ Services
   │
   ├── systemctl status
   └── journalctl
   │
   ▼
📜 Logs
   │
   ├── grep
   └── tail -f
⭐ Top 15 Commands to Remember
ls -la
cd
pwd
find
grep
tail -f
df -h
du -sh
top
free -h
ps aux
systemctl status
ip addr
ss -tulpn
journalctl
🎯 DevOps Golden Rule

Check → Understand → Troubleshoot → Automate 🚀

🐧 Linux is the foundation of modern DevOps.
