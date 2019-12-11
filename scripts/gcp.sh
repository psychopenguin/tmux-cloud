#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLOUDSDK_PYTHON=python3

source $CURRENT_DIR/helpers.sh
GCLOUD_HOME=$HOME/.config/gcloud
active_cfg=$(cat $GCLOUD_HOME/active_config)
source <(grep =  ~/.config/gcloud/configurations/config_$active_cfg|sed 's/ *= */=/g;s/^/cfg_/g')
icon="#[bg=colour76,fg=colour231]   $active_cfg #[fg=colour76,bg=colour11]$separator#[default]"
account="#[bg=colour11,fg=colour231]${cfg_account:-none}#[fg=colour11,bg=colour196]$separator#[default]"
project="#[bg=colour196,fg=colour231]${cfg_project:-none}#[fg=colour196,bg=colour69]$separator#[default]"
zone="#[bg=colour69,fg=colour231]${cfg_zone:-none}#[default]"
echo -n "$icon$account$project$zone"
