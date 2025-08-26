Dotfiles Repository
=======

This `--bare` repository contains my personal dotfiles for configuring and customizing my development environment across various systems. It includes configuration files for shell environments, text editors, version control systems, and other essential tools I use on a daily basis.

The goal of this repository is to keep my setup portable, easily accessible, and reproducible, allowing me to quickly set up new machines or restore my configuration across environments.

Contents:
- Shell configuration (bashrc, zshrc, etc.)
- Vim/Neovim configuration (.vimrc, .config/nvim/*)
- Git configuration (.gitconfig, .gitignore_global)
- Tmux, Kitty, and other tool configurations
- System-wide configurations that can be personalized

Usage:
To install your dotfiles on a new system, or migrate to this setup

1.   `git clone --bare git@github.com:Kyshman/dotfiles.git .cfg`

Add a --bare flag if you wish you use a bare repo

2.   `echo ".cfg" >> .gitignore`

There could be weird behaviour if .cfg tries to track itself. Avoid recursive issues by adding .cfg to your global Git ignore. 

3.   `alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'`

Set up an alias to send Git commands to .cfg, and also set $HOME as the work tree, while storing the Git state at .cfg

For a bare repo, the path to the Git directory is at the top level of the project: $HOME/.cfg/

For a non-bare default repo, the path to the Git directory is inside a .git subdirectory: $HOME/.cfg/.git

4.   `config config --local status.showUntrackedFiles no`

Set a local configuration in .cfg to ignore untracked files.

5.   `config checkout`

Checkout the actual content from your .cfg repository to $HOME. Git pulls the tracked files out of the compressed database in the Git directory and places them in the work tree.

E.g if you added $HOME/.zsh/aliases to .cfg, that file will be instantiated at that path on your new computer. Ta Da!


###NB:

`config checkout` might fail with a message like:

Files on your computer might have identical locations and names to files in the .cfg repo. Git doesn’t want to overwrite your local files.

Back up the files if they’re useful, delete them if they aren’t.

Run `config checkout` again until you don’t get any errors.

Your dotfile setup is complete!

Treat your dotfile management system like any other Git project. Just use the `config` alias to add, commit, push and pull.

