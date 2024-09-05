# Future me: I wasn't able to test this with bash by the time I wrote it.. this is
# what I used for zsh - so if this doesn't work and the relative paths work the same in
# bash, you can try this approach or googling something similar:

# local this_file_path=${0:a:h}
# source $this_file_path/shell/functions.sh
# source $this_file_path/shell/aliases.sh

source shell/functions.sh
source shell/aliases.sh
