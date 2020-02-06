# after-ubuntu-install

Commands to run after fresh ubuntu install for my personal customizations 

Attempt to automate the required packades and configurations after a fresh ubuntu (18.04) installation.

Turned in a repo since it make it easer to update (instead of gist)

## Rclone Mount Command:

rclone mount -v --buffer-size 32M --dir-cache-time 300h --poll-interval 5m caio-onedrive:MainShared/ ~/OneDrive

### Currently used:

rclone copy ./MainShared/ caio-onedrive:MainShared  -u -P -v --exclude-from ./MainShared/exclude-rclone.txt && rclone copy  caio-onedrive:MainShared ./MainShared -u -P -v --exclude-from ./MainShared/exclude-rclone.txt
