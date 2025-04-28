set -Ux EDITOR /usr/bin/vim

if status is-interactive
    # Commands to run in interactive sessions can go here
    	#Set GPG KEYS Variables
	set -x KEYID 0x3A73F55BE2FDDE73
	set -x KEYID2 0xF90AC0D6D25085A0
	set -x KEYID3 0x1BD62C041D620688
    	# Set the TEMP DIR
    	set -x TEMP_DIR /tmp
    	# Set the LIBVA_DRIVER_NAME=i965 on ProBook for video encoding and decoding
	set -x LIBVA_DRIVER_NAME i965
	# Initials stuff to use the Yubikey with SSH
        set -x GPG_TTY (tty)
        set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
	systemctl --user import-environment SSH_AUTH_SOCK
        gpgconf --launch gpg-agent
        gpg-connect-agent updatestartuptty /bye > /dev/null
        # Sync shell across machines
	#atuin init fish --disable-up-arrow | source
	atuin init fish | source 
	# Copy & Paste like on macos (2 versions)
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	#alias pbcopy='xsel --clipboard --input'
	#alias pbpaste='xsel --clipboard --output'
	# https://unix.stackexchange.com/a/81699/37512
	alias wanip='dig @resolver4.opendns.com myip.opendns.com +short' 
	alias wanip4='dig @resolver4.opendns.com myip.opendns.com +short -4'
	alias wanip6='dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6'

	### RANDOM COLOR SCRIPT ###
	#colorscript random
	#starship init fish | source
end

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
