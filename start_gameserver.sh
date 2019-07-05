#!/bin/bash
cd $GAME_INSTALL_DIR
ulimit -n 2048

export TERM=xterm

if [ -d "./Unturned_Headless_Data" ]; then
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`dirname $0`/Unturned_Headless_Data/Plugins/x86_64/
else
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`dirname $0`/Unturned_Headless/Plugins/x86_64/
fi

./Unturned_Headless.x86_64 -logfile 2>&1 -batchmode -nographics "$@" +secureserver/$SERVER_NAME
