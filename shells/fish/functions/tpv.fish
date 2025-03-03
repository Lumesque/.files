function tpv --wraps='mpv --vo=kitty --sws-scaler=fast-bilinear --sws-fast=yes --vo-kitty-use-shm=yes' --description 'alias tpv=mpv --vo=kitty --sws-scaler=fast-bilinear --sws-fast=yes --vo-kitty-use-shm=yes'
  mpv --vo=kitty --sws-scaler=fast-bilinear --sws-fast=yes --vo-kitty-use-shm=yes $argv
        
end
