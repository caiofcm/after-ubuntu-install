# after-ubuntu-install

Commands to run after fresh ubuntu install for my personal customizations 

Attempt to automate the required packades and configurations after a fresh ubuntu (18.04) installation.

Turned in a repo since it make it easer to update (instead of gist)

## Rclone Mount Command:

rclone mount -v --buffer-size 32M --dir-cache-time 300h --poll-interval 5m caio-onedrive:MainShared/ ~/OneDrive
