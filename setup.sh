## DESCRIPTION:
## This file install the necessary dependencies
## NOTE: If you wanna reinstall everything, manually delete INSTALL_DIR

# Change this constant to install somewhere else if you want.
INSTALL_DIR="$HOME/alpine"

# Install dependencies - (comment if you are not on termux)
pkg install -y expect wget qemu-utils qemu-common qemu-system-x86_64-headless openssh
mkdir -p "$INSTALL_DIR" && cd "$INSTALL_DIR"

# Download necessary files
curl "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/config.env" > "$INSTALL_DIR/config.env"
curl "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/ssh2qemu.sh" > "$INSTALL_DIR/ssh2qemu.sh"
curl "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/startqemu.sh" > "$INSTALL_DIR/startqemu.sh"
curl "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/installqemu.expect" > "$INSTALL_DIR/installqemu.expect"
curl "https://raw.githubusercontent.com/Zeioth/termux-docker/main/alpine/answerfile" > "$INSTALL_DIR/answerfile"

# Give execution permissions
chmod +x "$INSTALL_DIR/ssh2qemu.sh"
chmod +x "$INSTALL_DIR/startqemu.sh"

# Run installqemu
. "$INSTALL_DIR/config.env"
expect -f "$INSTALL_DIR/installqemu.expect"

