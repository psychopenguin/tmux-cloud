#!/usr/bin/env bash
#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

gcp_icon=" "
interporlation_string="\#{cloud_status}"
source $CURRENT_DIR/scripts/helpers.sh

do_interpolation() {
    local option_value="$1"
    local gcp="#($CURRENT_DIR/scripts/gcp.sh)"
    local kubernetes="#($CURRENT_DIR/scripts/kubernetes.sh)"
    local interpolated="${option_value/$interporlation_string/$kubernetes $gcp}"
    echo $interpolated
}
update_tmux_option() {
    local option="$1"
    local option_value="$(get_tmux_option "$option")"
    local new_option_value=$(do_interpolation "$option_value")
    set_tmux_option "$option" "$new_option_value"
}

update_tmux_option "status-right"
update_tmux_option "status-left"
