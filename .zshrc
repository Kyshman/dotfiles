# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set initial Working Directory
# Only cd to /tmp if we're starting from home directory
if [ "$PWD" = "$HOME" ]; then
    cd /tmp
fi
#cd /tmp

# Initialize nvm environment for the shell
source /usr/share/nvm/init-nvm.sh

# Disable Bracketed Paste Mode
#bind 'set enable-bracketed-paste off'
# Enable AUTO_PUSHD: This option automatically pushes the current directory to the stack whenever you use cd.
setopt AUTO_PUSHD

# Enable completion of aliases
setopt COMPLETE_ALIASES

# To use powerline
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
#source $HOME/.zsh/functions.zsh

# Add your custom functions dir to fpath
fpath=(~/.zsh/functions $fpath)

# Autoload all functions (they’ll be loaded on first use)
autoload -Uz ~/.zsh/functions/*(.N:t)

# History configuration
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_IGNORE_DUPS       # Ignore immediate duplicates
setopt HIST_SAVE_NO_DUPS      # Don't save duplicates to file
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming

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

# PATHS
# To ensure your PATH entries are unique and automatically exported
typeset -U path
# To append a single path
# path+=('/path/to/your/directory')
#
# To append multiple paths
path+=("$HOME/go/bin" "$HOME/Nextcloud/Computer-650_G2/Documents/Scripts" "$HOME/.cargo/bin")
#

# Enable access to libvirt system instances and resources as a normal user
export LIBVIRT_DEFAULT_URI='qemu:///system'
#

# Export the PATH variable for it to be available to all child processes
export PATH

# Autoload `zargs` to for safer efficient handling of wildcards and globbing
autoload -Uz zargs

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true
#source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#autoload -U +X bashcompinit && bashcompinit

## Another auto completion section
autoload -Uz compinit
compinit

#Enable completion for aliases:
# zstyle ':completion:*:aliases' regular 1
zstyle ':completion:*' completer _complete _ignored _aliases

## [/Completion]

# Detect & compensate for kitty uncompatible SSH sessions
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Disable focus reporting escape sequences
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
    bindkey -r '^[[I' # Unbinds Focus In (^[[I)
    bindkey -r '^[[O' # Unbinds Focus Out (^[[O)
fi

# Initialize zoxide
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Atuin for command history
eval "$(atuin init zsh)"

#AI command generation
[ -f /home/tony/.shelloracle.zsh ] && source /home/tony/.shelloracle.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o default -C /usr/local/bin/mmdbctl mmdbctl
