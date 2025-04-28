function suvirsh --wraps='sudo virsh' --description 'alias suvirsh=sudo virsh'
  sudo virsh $argv
end
