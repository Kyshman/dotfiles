#!/usr/bin/env fish
# This checks whether the local repo has changes to be committed.

# Converted from original bash/sh using https://www.cafe-encounter.net/p3107/fish-shell-quickstart-for-converting-bash-scripts

cd ~/dotfiles
# The ! operator is not supported in fish, so use the exit status instead
if git diff-index --quiet HEAD --;
# Do nothing if the exit status is zero (no changes)
else
# Use echo -e to enable escape sequences
echo -e " [ ~/dotfiles directory dirty, please commit changes ]"
end
