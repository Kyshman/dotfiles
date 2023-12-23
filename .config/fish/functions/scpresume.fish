# Defined via `source`
function scpresume --wraps='rsync -avz --partial --progress --rsh=ssh' --description 'alias scpresume=rsync -avz --partial --progress --rsh=ssh'
  rsync -avz --partial --progress --rsh=ssh $argv; 
end
