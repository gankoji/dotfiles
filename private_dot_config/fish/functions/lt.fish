function lt --wraps='lsd --tree' --wraps='lsd --tree -d' --description 'alias lt lsd --tree -d'
  lsd --tree -d $argv
        
end
