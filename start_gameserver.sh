#!/bin/bash
cd $GAME_INSTALL_DIR
ulimit -n 2048

dotnet run -f netcoreapp2.2 --project Rocket.Unturned.Launcher/Rocket.Unturned.Launcher.csproj server Unturned_Headless.x86_64