#!/bin/bash
PREVIOUS_DIR=$PWD
MODULES_DIR=$GAME_INSTALL_DIR/Modules

curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz

# Update / install server
./steamcmd.sh +@sSteamCmdForcePlatformBitness 64 +login $STEAM_USERNAME $STEAM_PASSWORD +force_install_dir $GAME_INSTALL_DIR +app_update $GAME_ID +quit

mkdir -p $MODULES_DIR

cd $MODULES_DIR

if [! -d "$MODULES_DIR/Rocket.Unturned"]
    if [ "$SERVER_TYPE" == "rm4"] then
        curl -s https://ci.rocketmod.net/job/Rocket.Unturned/lastSuccessfulBuild/artifact/Rocket.Unturned/bin/Release/Rocket.zip
        unzip Rocket.zip
        mv Modules/* ./
        rm -rf ./Scripts
        rm README
    elif [ "$SERVER_TYPE" == "rm5"] then
        curl -s https://ci.appveyor.com/api/buildjobs/bjt7acowdq73nh4u/artifacts/Rocket.Unturned-5.0.0.237.zip
        unzip Rocket.zip
        rm README.md
        rm LICENSE
fi

# Start game
cd $PREVIOUS_DIR
./start_gameserver.sh