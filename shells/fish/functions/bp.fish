function bp --wraps='bat --pager=never' --description 'alias bp=bat --pager=never'
  bat --pager=never $argv
        
end
