#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
    echo "This script can no not be run with sudo."
    exit 1
fi
if [ -f "$HOME/.pyenv" ]
then
echo ""
else
  if ! dpkg -l | grep libbz2-dev
  then
  echo "packages are not installed or config not applyed"
  echo "Please install with= sudo sh config.sh" 
  exit 1
  fi
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

################# Configs ############################
# Set to python 3.8.0
python380(){
if ! pyenv versions | grep -q "3.8.0"; then
    pyenv install 3.8.0
fi
pyenv global 3.8.0
pyenv rehash
python3 --version
exit 0
}
# Set to python 3.9.0
python390(){
if ! pyenv versions | grep -q "3.9.0"; then
    pyenv install 3.9.0
fi
pyenv global 3.9.0
pyenv rehash
python3 --version
exit 0
}
# Set to python 3.10.0
python3100(){
if ! pyenv versions | grep -q "3.10.0"; then
    pyenv install 3.10.0
fi
pyenv global 3.10.0
pyenv rehash
python3 --version
exit 0
}
# Set to python 3.11.0
python3110(){
if ! pyenv versions | grep -q "3.11.0"; then
    pyenv install 3.11.0
fi
pyenv global 3.11.0
pyenv rehash
python3 --version
exit 0
}
# Set to python 3.12.0
python3120(){
if ! pyenv versions | grep -q "3.12.0"; then
    pyenv install 3.12.0
fi
pyenv global 3.12.0
pyenv rehash
python3 --version
exit 0
}
# List availible versions
listing(){
    pyenv install --list
    exit 0
}


############################### Menu ###############################
MENU_FN(){
clear
    echo "${INTRO_TEXT}           Python Selection tool                 ${END}"
    echo "${INTRO_TEXT}           Created by Pierre Gode                ${END}"
	echo "${INTRO_TEXT} curret running version is $(python3 --version)  ${END}"
    echo "${NORMAL}                                                     ${END}"
    echo "${MENU}*${NUMBER} 1)${MENU} Set to python 3.8.0     ${END}"
    echo "${MENU}*${NUMBER} 2)${MENU} Set to python 3.9.0     ${END}"
    echo "${MENU}*${NUMBER} 3)${MENU} Set to python 3.10.0    ${END}"
	echo "${MENU}*${NUMBER} 4)${MENU} Set to python 3.11.0    ${END}"
    echo "${MENU}*${NUMBER} 5)${MENU} Set to python 3.12.0    ${END}"
	echo "${MENU}*${NUMBER} 6)${MENU} List availible versions ${END}"
    echo "${NORMAL}                                                   ${END}"
    echo "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}ctrl + c to exit. ${END}"
	read -r opt
while [ "$opt" != '' ]
    do
    if [ "$opt" = "" ]; then
            exit;
    else
        case $opt in
         1) clear;
             echo "Switching to python 3.8.0";
              python380
              ;;

	2) clear;
	    echo "Switching to python 3.9.0"
	     python390
             ;;
	3) clear;
	     echo "Switching to python 3.10.0"
	     python3100
             ;;
	4) clear;
	    echo "Switching to python 3.11.0"
	    python3110
            ;;
	5) clear;
	    echo "Switching to python 3.12.0"
	    python3120
            ;;
	6) clear;
	    echo "Listing availible versions"
	    listing
	       ;;
        x)exit;
        ;;
       '\n')exit;
        ;;
        *)clear;
        opt "Pick an option from the menu";
        MENU_FN;
        ;;
    esac
fi
done
}
MENU_FN
