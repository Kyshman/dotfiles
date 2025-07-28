# Set initial Working Diretory
cd /tmp

# Initialize nvm environment for the shell
source /usr/share/nvm/init-nvm.sh

# Disable Bracketed Paste Mode
#bind 'set enable-bracketed-paste off'
# Enable AUTO_PUSHD: This option automatically pushes the current directory to the stack whenever you use cd.
setopt AUTO_PUSHD

# Enable completion of aliases
setopt COMPLETE_ALIASES

# Use powerline
#USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Load pyenv automatically by appending
# the following to 
# ~/.zprofile (for login shells)
# and ~/.zshrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Restart your shell for the changes to take effect.

# For aliases sess $HOME/.zsh/aliases
source $HOME/.zsh/aliases.zsh

# For functions see $HOME/.zsh/functions
source $HOME/.zsh/functions.zsh

#Atuin for command history
eval "$(atuin init zsh)"

# SSH with Yubikey
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null

# Default Editor
export EDITOR=/usr/bin/vim

# Managing DOTFILES
#export DOTFILES=$HOME/Nextcloud/Projects/dotfiles.git

#Set GPG KEYS Variables
export KEYID=0x3A73F55BE2FDDE73
export KEYID2=0xF90AC0D6D25085A0
export KEYID3=0x1BD62C041D620688

# Set the TEMP DIR
export TEMP_DIR=/tmp

# To append a single path
# path+=('/path/to/your/directory')
#
# To append multiple paths
path+=('$HOME/go/bin' '$HOME/Documents/Scripts' '$HOME/Documents/Scripts/urlshorten' '$HOME/.cargo/bin')
#

# Enable access to libvirt system instances and resources as a normal user
export LIBVIRT_DEFAULT_URI='qemu:///system'
#

# Export the PATH variable for it to be available to all child processes
export PATH

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

autoload -U +X bashcompinit && bashcompinit
complete -o default -C /usr/bin/ipinfo ipinfo

## Anpther auto completion section
autoload -U compinit
compinit

#Enable completion for aliases:
# zstyle ':completion:*:aliases' regular 1
zstyle ':completion:*' completer _complete _ignored _aliases

# Detect & compensate for kitty uncompatible SSH sessions
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
