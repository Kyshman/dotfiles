# Git alias for working with dotfiles (See https://www.ackama.com/articles/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias -g vi='/usr/bin/vim'

# Carried Over from fish
# Copy & Paste like on macos (2 versions) on X11
#alias pbcopy='xclip -selection clipboard'
#alias pbpaste='xclip -selection clipboard -o'
#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'

## other common aliases
#cp='cp -i'
#df='df -h'
#edit-in-kitty='kitten edit-in-kitty'
#free='free -m'
#gitu='git add . && git commit && git push'
#ls='ls $LS_OPTIONS'
#run-help=man
#ssh='kitty +kitten ssh'
#which-command=whence

# To overide kiity's ssh change of behaviour
alias -g sshn='/usr/bin/ssh'

# Copy & Paste like on macos on Wayland
alias -g pbcopy='wl-copy'
alias -g pbpaste='wl-paste'

# https://unix.stackexchange.com/a/81699/37512
alias wanip='dig @resolver4.opendns.com myip.opendns.com +short'
alias wanip4='dig @resolver4.opendns.com myip.opendns.com +short -4'
alias wanip6='dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6'

alias -g scpresume='rsync -aAvXPh --rsh=ssh'
alias -g ll='ls -lash --color=never'
alias -g open='xdg-open'
alias moshj='$HOME/Documents/Scripts/mosh-with-jump/mosh-with-jump'
alias aria2c-bt='aria2c --bt-tracker=$(curl -s -L https://trackerslist.com/best_aria2.txt)'
alias -g ping_ct='ping -O4'

