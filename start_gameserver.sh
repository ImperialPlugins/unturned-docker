#!/bin/bash
cd $GAME_INSTALL_DIR
ulimit -n 2048

dotnet "RocketLauncher.dll" server Unturned_Headless.x86_64