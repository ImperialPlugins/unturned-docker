#!/bin/bash
SCRIPT_DIR=$PWD
curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz

# Update / install server
./steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD $STEAM_GUARD_TOKEN $STEAM_CMD_ARGS +force_install_dir $GAME_INSTALL_DIR +@sSteamCmdForcePlatformBitness 64 +app_update $GAME_ID +quit

# Move the steamclient
mkdir -p /home/steam/.steam/sdk64/
cp -f linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so

# Optionlly install RocketMod
export MODULES_DIR=$GAME_INSTALL_DIR/Modules
mkdir -p $MODULES_DIR
cd $MODULES_DIR

if [ ! -d "$MODULES_DIR/Rocket.Unturned" ]; then
    if [ "$SERVER_TYPE" == "rm4" ]; then
        curl https://ci.rocketmod.net/job/Rocket.Unturned/lastSuccessfulBuild/artifact/Rocket.Unturned/bin/Release/Rocket.zip -o Rocket.zip
        unzip Rocket.zip
        mv Modules/* ./
        rmdir Modules
        rm -rf ./Scripts
        rm README
        rm Rocket.zip
    elif [ "$SERVER_TYPE" == "rm5" ]; then
        curl -L https://ci.appveyor.com/api/buildjobs/bjt7acowdq73nh4u/artifacts/Rocket.Unturned-5.0.0.237.zip -o Rocket.zip
        unzip Rocket.zip
        rm README.md
        rm LICENSE
        rm Rocket.zip
    fi    
fi

# Start game
cd $SCRIPT_DIR
./start_gameserver.sh "$@"
