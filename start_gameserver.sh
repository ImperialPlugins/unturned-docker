#!/bin/bash

cd $GAME_INSTALL_DIR
ulimit -n 2048

LD_LIBRARY_PATH=$GAME_INSTALL_DIR/lib64:$GAME_INSTALL_DIR/Unturned_Headless/Plugins/x86_64 mono $ROCKET_LAUNCHER_NAME server Unturned_Headless.x86_64