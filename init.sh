#!/bin/bash

cd "$GAME_INSTALL_DIR" || exit

ulimit -n 2048

export TERM=xterm

if [ -d "./Unturned_Headless_Data" ]; then
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`dirname $0`/Unturned_Headless_Data/Plugins/x86_64/
else
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`dirname $0`/Unturned_Headless/Plugins/x86_64/
fi

if [ ! -d "$MODULES_DIR/Rocket.Unturned" ]; then
    if [ "$SERVER_TYPE" == "rm4" ]; then
      cp -rf "$GAME_INSTALL_DIR"/Extras/Rocket.Unturned/ "$GAME_INSTALL_DIR"/Modules/
    fi
fi

./Unturned_Headless.x86_64 -logfile 2>&1 -batchmode -nographics +secureserver/"$SERVER_NAME"