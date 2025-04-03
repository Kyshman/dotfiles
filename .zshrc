# Set initial Working Diretory
cd /tmp

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
eval "$(atuin init zsh)"
# SSH with Yubikey
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null
# Default Editor
export EDITOR=/usr/bin/vim
# Managing DOTFILES
export DOTFILES=$HOME/Nextcloud/Projects/dotfiles.git
alias -g vi='/usr/bin/vim'
# Carried Over from fish
# Copy & Paste like on macos (2 versions)
#alias pbcopy='xclip -selection clipboard'
#alias pbpaste='xclip -selection clipboard -o'
#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'
alias -g pbcopy='wl-copy'
alias -g pbpaste='wl-paste'
# https://unix.stackexchange.com/a/81699/37512
alias wanip='dig @resolver4.opendns.com myip.opendns.com +short'
alias wanip4='dig @resolver4.opendns.com myip.opendns.com +short -4'
alias wanip6='dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6'
#Set GPG KEYS Variables
export KEYID=0x3A73F55BE2FDDE73
export KEYID2=0xF90AC0D6D25085A0
export KEYID3=0x1BD62C041D620688
# Set the TEMP DIR
export TEMP_DIR=/tmp
alias -g scpresume='rsync -avzXA --partial --progress --rsh=ssh'
alias -g ll='ls -lash --color=never'
alias -g open='xdg-open'
alias moshj='/home/tony/Documents/Scripts/mosh-with-jump/mosh-with-jump'
alias aria2c-bt='aria2c --bt-tracker=$(curl -s -L https://trackerslist.com/best_aria2.txt)'
alias -g ping_ct='ping -O4'
# Git alias for working with dotfiles (See https://marcel.is/managing-dotfiles-with-git-bare-repo/)
alias gitdf='git --git-dir=$DOTFILES --work-tree=$HOME'

# To append a single path
# path+=('/path/to/your/directory')
#
# To append multiple paths
path+=('/home/tony/go/bin' '/home/tony/Documents/Scripts' '/home/tony/Documents/Scripts/urlshorten' '/home/tony/.cargo/bin')
#
# Enable access to libvirt system instances and resources as a normal user
export LIBVIRT_DEFAULT_URI='qemu:///system'
#
# Export the PATH variable for it to be available to all child processes
export PATH

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/tony/.dart-cli-completion/zsh-config.zsh ]] && . /home/tony/.dart-cli-completion/zsh-config.zsh || true
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
