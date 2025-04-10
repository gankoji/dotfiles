function ls --wraps='lsd -1ha' --wraps='lsd -1hal --git' --description 'alias ls lsd -1hal --git'
  lsd -1hal --git $argv
        
end
