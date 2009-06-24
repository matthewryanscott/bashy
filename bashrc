#!/bin/bash

# If not running interactively, don't do anything further.
[ -z "$PS1" ] && return

. $BASHY/prompts
setup_prompt

. $BASHY/paths
