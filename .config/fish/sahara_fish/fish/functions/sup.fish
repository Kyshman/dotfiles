function sup --wraps='sudo apt-fast update ; sudo apt-fast -y -f full-upgrade --autoremove ;  sudo apt-fast autoclea' --wraps='sudo apt-fast update ; sudo apt-fast -y -f full-upgrade --autoremove ;  sudo apt-fast autoclean' --description 'alias sup=sudo apt-fast update ; sudo apt-fast -y -f full-upgrade --autoremove ;  sudo apt-fast autoclean'
    sudo apt-fast update
    sudo apt-fast -y -f full-upgrade --autoremove
    sudo apt-fast autoclean $argv
end
