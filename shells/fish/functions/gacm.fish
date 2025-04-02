function gacm --wraps='git add -A && git commit -m' --description 'alias gacm=git add -A && git commit -m'
  git add -A && git commit -m $argv
        
end
