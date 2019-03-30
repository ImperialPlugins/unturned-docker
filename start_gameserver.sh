#!/bin/bash
cd $GAME_INSTALL_DIR
ulimit -n 2048

dotnet $ROCKET_LAUNCHER_NAME server Unturned_Headless.x86_64