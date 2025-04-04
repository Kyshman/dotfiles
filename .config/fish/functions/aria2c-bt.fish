function aria2c-bt --wraps='aria2c --bt-tracker=(curl -s -L https://trackerslist.com/best_aria2.txt)' --description 'alias aria2c-bt=aria2c --bt-tracker=(curl -s -L https://trackerslist.com/best_aria2.txt)'
  aria2c --bt-tracker=(curl -s -L https://trackerslist.com/best_aria2.txt) $argv; 
end
