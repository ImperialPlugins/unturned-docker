#!/bin/bash
cd $GAME_INSTALL_DIR
ulimit -n 2048

export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
dotnet "RocketUnturned.dll" server Unturned_Headless.x86_64