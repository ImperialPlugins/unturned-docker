#!/bin/bash

cd $GAME_INSTALL_DIR
ulimit -n 2048

LD_LIBRARY_PATH=$GAME_INSTALL_DIR/lib64:$GAME_INSTALL_DIR/Unturned_Headless_LatestMono/Plugins/x86_64 ./Unturned_Headless_LatestMono.x86_64 -nographics -batchmode -silent-crashes -logfile ./unturned.log +secureserver/server &
tail --follow=name unturned.log