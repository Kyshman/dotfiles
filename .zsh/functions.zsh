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

# Launch `brow6el` a terminal browser using libsixel
brow6el() {
    # URL argument – require at least one
    if [[ -z $1 ]]; then
        print "Usage: brow6el <url>"
        return 1
    fi

    local url=$1
    local script=$HOME/brow6el/build/run_brow6el.sh

    # Ensure the script exists and is executable
    if [[ ! -x $script ]]; then
        print "Error: $script not found or not executable"
        return 1
    fi

    # Launch a new foot window (client mode) and run the script inside it
    # The `-e` flag tells foot to execute the given command after the PTY is created.
    #foot --client -e "$script" "$url"
    foot -e "$script" "$url" &
}

