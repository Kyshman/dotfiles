function sup --wraps='tmux new-session -d -s mysession; sudo apt-fast update; sudo apt-fast -y -f full-upgrade --autoremove; sudo apt-fast autoclean' --description 'alias sup=sudo apt-fast update; sudo apt-fast -y -f full-upgrade --autoremove; sudo apt-fast autoclean'
    # Create a new tmux session named 'mysession'
    tmux new-session -d -s mysession

    # Run the commands in the new tmux session
    tmux send-keys -t mysession "sudo apt-fast update" C-m
    tmux send-keys -t mysession "sudo apt-fast -y -f full-upgrade --autoremove" C-m
    tmux send-keys -t mysession "sudo apt-fast autoclean" C-m
end
