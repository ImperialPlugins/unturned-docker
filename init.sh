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
      mkdir /tmp/rm && \
      cd /tmp/rm && \
      curl -L https://github.com/RocketMod/Rocket.Unturned/releases/download/4.9.3.0/Rocket.Unturned.zip -o Rocket.zip && \
      unzip Rocket.zip && \
      mv Modules/* "$GAME_INSTALL_DIR"/Modules/ && \
      mv Scripts/Linux "$GAME_INSTALL_DIR"/Scripts && \
      cp -rf "$GAME_INSTALL_DIR"/Extras/Rocket.Unturned/ "$GAME_INSTALL_DIR"/Modules/ && \
      rm Rocket.zip
      rm . -rf
    fi
fi

./Unturned_Headless.x86_64 -logfile 2>&1 -batchmode -nographics +secureserver/"$SERVER_NAME"