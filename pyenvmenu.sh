#!/bin/bash
if ! cat ~/.bashrc | grep PYENV | head -1
then echo 'export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
' >> ~/.bashrc
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

################# Configs ############################
# Set to python 3.8.0
python380(){
    pyenv install 3.8.0
    pyenv global 3.8.0
    pyenv rehash
    python3 --version
    exit 0
}
# Set to python 3.9.0
python390(){
    pyenv install 3.9.0
    pyenv global 3.9.0
    pyenv rehash
    python3 --version
    exit 0
}
# Set to python 3.10.0
python3100(){
    pyenv install 3.10.0
    pyenv global 3.10.0
    pyenv rehash
    python3 --version
    exit 0
}
# Set to python 3.11.0
python3110(){
    pyenv install 3.11.0
    pyenv global 3.11.0
    pyenv rehash
    python3 --version
    exit 0
}
# Set to python 3.12.0
python3120(){
    pyenv install 3.12.0
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
	     python380
             ;;
	3) clear;
	     echo "Switching to python 3.10.0"
	     python380
             ;;
	4) clear;
	    echo "Switching to python 3.11.0"
	    python380
            ;;
	5) clear;
	    echo "Switching to python 3.12.0"
	    python380
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