#!/usr/bin/env bash
set -e

# Update and install essential pentest tools
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y nmap smbclient gobuster nikto metasploit-framework curl

# Start database for Metasploit (optional)
service postgresql start || true
if command -v msfdb >/dev/null 2>&1; then
  msfdb init || true
fi

echo "[+] Kali provisioning completed"
