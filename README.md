\# 🎯 WinHunt: Vagrant Pen-Test Lab \& Master Control Agent



!\[Vagrant](https://img.shields.io/badge/Vagrant-1563FF?style=for-the-badge\&logo=vagrant\&logoColor=white)

!\[Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge\&logo=gnu-bash\&logoColor=white)

!\[Kali](https://img.shields.io/badge/OS-Kali\_Linux-557C94?style=for-the-badge\&logo=kali-linux\&logoColor=white)

!\[Windows](https://img.shields.io/badge/OS-Windows\_Server-0078D6?style=for-the-badge\&logo=windows\&logoColor=white)



WinHunt is a complete, automated \*\*Infrastructure as Code (IaC)\*\* Penetration Testing Lab and an accompanying Command \& Control (C2) CLI Agent. It bridges the gap between \*\*Red Team (Offense)\*\* and \*\*Blue Team (Defense)\*\* workflows by consolidating tools into a single terminal interface.



\##  Lab Architecture

This repository contains the Vagrantfiles and provisioning scripts to automatically spin up:

1\. \*\*Target Machine:\*\* A Windows Server VM provisioned with vulnerable IIS services via PowerShell (`provision\_win\_iis.ps1`).

2\. \*\*Attacker Machine:\*\* A Kali Linux VM pre-configured with the WinHunt Master Control Agent (`provision\_kali.sh`).



\## The Problem It Solves

\* \*\*Tool Fragmentation:\*\* Security engineers lose time juggling 5+ terminal windows for attacks, logs, and notes.

\* \*\*Headless Instability:\*\* In VMs without a GUI (like this Vagrant setup), tools that try to spawn new windows crash. 

\* \*\*Disconnected Learning:\*\* Students struggle to connect the "cause and effect" of launching an exploit and seeing the resulting IDS alert.



\## The WinHunt Agent Features

\* \*\*Automated Attack Sequence:\*\* Executes predefined Red Team payloads (Nmap, Nikto) against the Windows target.

\* \*\*Intelligent Agent QnA:\*\* A custom priority-logic engine that distinguishes between asking a question (`Why Nmap?`) and running a command (`Nmap`), acting as an embedded tutor.

\* \*\*Live IDS Monitor:\*\* Runs \*\*Suricata\*\* silently in the background while streaming logs (`tail -f`) to the foreground.

\* \*\*Forensics Log Trace:\*\* Parses raw IIS server logs from the Windows machine to isolate and display exact attack payloads.



\## Quick Start

\*\*1. Spin up the Lab\*\*

Ensure Vagrant and VirtualBox are installed on your host machine, then run:

```powershell

vagrant up

