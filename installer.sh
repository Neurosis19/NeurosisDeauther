Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@ 
avatar721
/
Neurosis Deauther
18
30363
Code
Issues
3
Pull requests
Actions
Projects
Wiki
Security
Insights
NeurosisDeauther/installer.sh
@NeurosisDeauther
avatar721 Update installer.sh
Latest commit 0e746fa on Feb 13, 2020
 History
 1 contributor
Executable File  92 lines (82 sloc)  2.55 KB
  
#!/bin/bash

# The installer for the NeurosisDeauther package
# NeurosisDeauther is made with <3 by aryan (Neurosis) @CKS  - 2020

### Colors ###
BK=$(tput setaf 0) # Black
GR=$(tput setaf 2) # Green
RD=$(tput setaf 1) # Red
YW=$(tput setaf 3) # Yellow
CY=$(tput setaf 6) # Cyan
WH=$(tput setaf 7) # White
NT=$(tput sgr0) # Netral
BD=$(tput bold) # Bold
BG=$(tput setab 4) # Background Color

# Function for displaying banner
function banner () {
	printf "${BD}
${GR}┊┊                  ${WH}╭━━━━━━
${GR}┊┊┊┊${YW}╭━╱▔▔▔╲━╮${GR}┊┊${YW}☼   ${WH}╭╯${RD}Neurosis
${GR}┊╱╲┊${YW}╰▏▆┊┊┊▇▕╯${GR}╱╲┊   ${WH}┃${RD}DEAUTHER
${GR}▔▔▔▔▔${YW}▏┊┊▇┊┊▕${GR}▔▔▔▔   ${WH}╰┳━━━━━━
${GR}┈${YW}╱▔▔╱┊┊━┻━┊┊╲▔▔╲  ${WH}━━╯${YW}
${GR}┈${YW}╲▂╱╭━━╮┊╭━━╮╲▂╱
${GR}┈┈${YW}▔▔╰┻┻╯▔╰┻┻╯▔▔${GR}┈┈ ${RD}© aryanwahid9 - 2020
"
}

# Checking root
function chk_root () {
	if [[ "$(id -u)" -ne 0 ]]; then
		clear
		banner
		printf " ${BD}${WH}[${RD}!${WH}] ${RD}NeurosisDeauther must be run as root ${YW}｡ﾟ･（>﹏<）･ﾟ｡\n"
		exit 1
	fi
}

# Dependencies
function checking_dependencies () {
	clear
	banner
	if [[ -f "dependencies.conf" ]]; then
		sleep 1
	else
		printf " ${BD}${WH}[${RD}!${WH}] ${CY}Checking Guns ${WH}..........\n"
		echo ""
		touch dependencies.conf
		echo "# aryan Just Dropped Yo Wireless" >> dependencies.conf
		sleep 1

		# Checking MDK3
		which mdk3 > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf " ${YW}MDK3 ${WH}.......... ${WH}[${GR}✔${WH}]\n"
			echo "mdk3 = yes" >> dependencies.conf
		else
			printf " ${YW}MDK3 ${WH}.......... ${WH}[${RD}✘${WH}]\n"
			sleep 1
			apt-get install mdk3 -y
		fi

		# Checking Network Manager
		which nmcli > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf " ${YW}Network Manager ${WH}.......... ${WH}[${GR}✔${WH}]\n"
			echo "nmcli = yes" >> dependencies.conf
		else
			printf " ${YW}Network Manager ${WH}.......... ${WH}[${RD}✘${WH}]\n"
			sleep 1
			apt-get install network-manager -y
		fi

		# Checking MAC Changer
		which macchanger > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf " ${YW}MAC Changer ${WH}.......... ${WH}[${GR}✔${WH}]\n"
			echo "macchanger = yes" >> dependencies.conf
		else
			printf " ${YW}MAC Changer ${WH}.......... ${WH}[${RD}✘${WH}]\n"
			sleep 1
			apt-get install macchanger -y
		fi
		sleep 5		
	fi
}

chk_root
checking_dependencies
printf " \n ${WH}[${GR}✔${WH}] ${GR}All weapons are ready!\n"
