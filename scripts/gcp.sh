#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/helpers.sh
active_cfg=$(gcloud config configurations list --filter="is_active=true" --format="value(name)")
cfgget=$(gcloud config configurations describe $active_cfg --format="value(name,properties.core.account,properties.core.project,properties.compute.zone)")
icon="#[bg=colour76,fg=colour231]   #[fg=colour76,bg=colour69]$separator#[default]"
cfgname="#[bg=colour69,fg=colour231]$(echo $cfgget|awk '{print $1}')#[fg=colour69,bg=colour11]$separator#[default]"
account="#[bg=colour11,fg=colour231]$(echo $cfgget|awk '{print $2}')#[fg=colour11,bg=colour196]$separator#[default]"
project="#[bg=colour196,fg=colour231]$(echo $cfgget|awk '{print $3}')#[fg=colour196,bg=colour76]$separator#[default]"
zone="#[bg=colour76,fg=colour231]$(echo $cfgget|awk '{print $4}')#[default]"
echo -n "$icon$cfgname$account$project$zone"
