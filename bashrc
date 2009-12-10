#!/bin/bash

# If not running interactively, don't do anything further.
[ -z "$PS1" ] && return

. $BASHY/prompts
setup_prompt

. $BASHY/paths

# Set up virtualenvhelper additions.

function cleanvirtualenv {
    deactivate
    rmvirtualenv clean
    BARE=1 mkvirtualenv clean
}

if [ "${WORKON_HOME}" != "" ]; then
    for name in postactivate postmkvirtualenv; do
	if [ ! -f ${WORKON_HOME}/${name} ]; then
	    echo "First time install of ${name}"
	    ln -s ${BASHY}/${name} ${WORKON_HOME}/${name}
	fi
    done
fi
