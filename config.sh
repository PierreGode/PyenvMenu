#!/bin/bash
# Ensures the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
ORIGINAL_USER=$(logname)
USER_HOME=$(eval echo ~$ORIGINAL_USER)
if ! grep -q "^PYENV" "$USER_HOME/.bashrc"; then
  sudo -u $ORIGINAL_USER bash -c "echo 'export PYENV_ROOT=\"\$HOME/.pyenv\"
export PATH=\"\$PYENV_ROOT/bin:\$PATH\"
if command -v pyenv 1>/dev/null 2>&1; then
   eval \"\$(pyenv init -)\"
fi' >> $USER_HOME/.bashrc"
fi
sudo apt-get update && sudo apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
sudo -u $ORIGINAL_USER curl https://pyenv.run | bash
sudo mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old
