# Dotfiles Repository

This is a bare Git repository containing my personal dotfiles for configuring and customizing my development environment across various systems. It includes configuration files for shell environments, text editors, version control systems, and other essential tools I use on a daily basis.

The goal of this repository is to keep my setup portable, easily accessible, and reproducible, allowing me to quickly set up new machines or restore my configuration across environments.

## Contents

- Shell configuration (bashrc, zshrc, etc.)
- Vim/Neovim configuration (.vimrc, .config/nvim/*)
- Git configuration (.gitconfig, .gitignore_global)
- Tmux, Kitty, and other tool configurations
- System-wide configurations that can be personalized

## Installation & Setup

To install these dotfiles on a new system or migrate to this setup:

### 1. Clone the bare repository
```bash
git clone --bare git@github.com:Kyshman/dotfiles.git $HOME/.cfg
```

### 2. Add `.cfg` to your global Git ignore
```bash
echo ".cfg" >> $HOME/.gitignore
```
This prevents recursive issues when `.cfg` tries to track itself.

### 3. Set up the management alias
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
Add this to your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.) to persist it.

### 4. Configure to ignore untracked files
```bash
config config --local status.showUntrackedFiles no
```

### 5. Checkout the actual content
```bash
config checkout
```
This pulls tracked files from the repository into your home directory.

**Note:** `config checkout` might fail if files with identical names already exist. Back up important files and delete or move conflicting ones, then run the command again until it completes successfully.

## Using the Repository

### Basic Operations
Use the `config` alias for all repository operations:
```bash
config status
config add .zshrc
config commit -m "Update zsh configuration"
config push
```

### Creating a `.git` File for Compatibility
Some Git tools (like `nlgc` for commit message generation) expect a standard `.git` directory or file. Create a `.git` file in your home directory for compatibility:

```bash
echo "gitdir: $HOME/.cfg" > ~/.git
```

This file acts as a pointer to your actual repository and enables compatibility with tools that use standard Git repository discovery.

### Using Git Tools with the Bare Repository
For tools that don't automatically detect your repository configuration:

```bash
# From your home directory
cd ~
GIT_WORK_TREE=. nlgc  # or other Git tools
```

You can create an alias for convenience:
```bash
# Add to your shell configuration
alias nlgc-dotfiles='cd ~ && GIT_WORK_TREE=. nlgc'
```

## Repository Structure

- **Bare Repository Location:** `~/.cfg/` (contains all Git internals directly)
- **Work Tree:** `~` (your entire home directory)
- **Git Pointer:** `~/.git` (optional file pointing to `~/.cfg`)

This setup uses a bare repository to avoid having a `.git` directory in your home folder while still allowing version control of your entire configuration.

## Notes

- Your dotfiles setup is complete! Treat your dotfile management system like any other Git project using the `config` alias.
- The repository is configured as `core.bare=true`, meaning `~/.cfg` contains the complete Git database without a working directory attached.
- The work tree is explicitly set to `$HOME` when using the `config` alias.
- The `.git` file in your home directory is a standard Git feature for pointing to an external repository location.

## Troubleshooting

- **Error: "fatal: this operation must be run in a work tree"**: Ensure you're using the `config` alias or have set `GIT_WORK_TREE` when running standard `git` commands.
- **Error: "Failed to find git repository root"**: Create the `.git` file as described above or use `GIT_WORK_TREE=.` when running commands from `~`.
- **Files not showing up in status**: Remember to set `status.showUntrackedFiles no` to avoid cluttering status with unrelated files.
