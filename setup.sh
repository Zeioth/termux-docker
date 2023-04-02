## DESCRIPTION:
## This file install the necessary dependencies


# Install dependencies
#pkg install -y expect wget qemu-utils qemu-common qemu-system-x86_64-headless openssh

# Change this constant to install somewhere else if you want.
INSTALL_DIR="$HOME/alpine"
mkdir -p "$INSTALL_DIR" && cd "$INSTALL_DIR"

# Download necessary files
wget -q -c -t0 "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/config.env"
wget -q -c -t0 "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/ssh2qemu.sh"
wget -q -c -t0 "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/startqemu.sh"
wget -q -c -t0 "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/installqemu.expect"

# Give execution permissions
chmod +x ./ssh2qemu.sh
chmod +x ./startqemu.sh

# run installqemu
. config.env
expect -f installqemu.expect
