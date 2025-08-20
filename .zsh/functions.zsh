# Functions
mcd() { mkdir -p "$1" && cd "$1"; }

# Define scpresume as a zsh function:
scpresume() {
  # Add comments to explain what the function does
  # This function is a wrapper for rsync to resume transfers
  # It includes common options for archiving, verbose output,
  # extended attributes, permissions, hard links, and progress.
  # --rsh=ssh specifies ssh as the remote shell.

  rsync -aAvXPh --rsh=ssh "$@"
}

# Shortcut to list all properties of a dir or file
ll () {
  ls -lash "$@"
}
