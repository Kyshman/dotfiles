set -Ux EDITOR /usr/bin/vim

if status is-interactive
    # Commands to run in interactive sessions can go here
    	#Set GPG KEYS Variables
	set -x KEYID 0x3A73F55BE2FDDE73
	set -x KEYID2 0xF90AC0D6D25085A0
    	# Set the TEMP DIR
    	set -x TEMP_DIR /tmp
    	# Set the LIBVA_DRIVER_NAME=i965 for video encoding and decoding
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
	# Set the BORG-PASSCOMMAND for intergration with keepassxc-cli
	set -x BORG_PASSCOMMAND "keepassxc-cli show -k '"/home/tony/GDRIVE/Personal Docs/Passport Photos/Tony.jpg"' -a Password '"/home/tony/GDRIVE/Personal Docs/Firefox.kdbx"' '"BorgBase"'"
	### RANDOM COLOR SCRIPT ###
	colorscript random
	starship init fish | source
end

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
