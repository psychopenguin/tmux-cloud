#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/helpers.sh
CONTEXT=$(kubectl config current-context)
context_details=$(kubectl config view -o jsonpath="{.contexts[?(@.name == \"$CONTEXT\")].context['cluster', 'namespace']}")
icon="#[bg=colour99,fg=colour231] ﴱ #[fg=colour99,bg=colour105]$separator#[default]"
cluster="#[bg=colour105,fg=colour231]$(echo $context_details|awk '{print $1}')#[fg=colour105,bg=colour103]$separator#[default]"
namespace="#[bg=colour103,fg=colour231]$(echo $context_details|awk '{print $2}') #[default]"
echo -n "$icon$cluster$namespace"
