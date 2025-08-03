function sup --wraps='tmux new-session -s mysession; sudo apt-fast update; sudo apt-fast -y -f full-upgrade --autoremove; sudo apt-fast autoclean' --description 'alias sup=sudo apt-fast update; sudo apt-fast -y -f full-upgrade --autoremove; sudo apt-fast autoclean'
    # Create a new tmux session named 'mysession' and attach to it
    tmux new-session -s mysession -n update -d

    # Run the commands in the new tmux session
    tmux send-keys -t mysession "sudo apt-fast update" C-m
    tmux send-keys -t mysession "sudo apt-fast -y -f full-upgrade --autoremove" C-m
    tmux send-keys -t mysession "sudo apt-fast autoclean" C-m

    # Attach to the tmux session
    tmux attach-session -t mysession
end
