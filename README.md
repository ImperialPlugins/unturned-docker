# Unturned-Docker
This repository contains scripts for installing 64bit Unturned Linux with .NET 4.6.1 (optionally without docker).
It will auto-download the game on first start and download updates on each restart. It can detect crashes and auto restart in that case. Also it handles stdin/stdout correctly so you can have console input and output without the need for RCON.

# Getting Started
Images are hosted at `imperialplugins/unturned`. You can visit the [Docker Hub Repository](https://hub.docker.com/r/imperialplugins/unturned) for more information.

Example command to host a simple RocketMod 4 Unturned server:

`docker run -it -v <host_path>:/home/steam/Unturned -p 27015:27015 -p 27016:27016 -e SERVER_TYPE=rm4 --restart unless-stopped --name myserverinstance imperialplugins/unturned`

You can also append Unturned server args:
`docker run -it -v <host_path>:/home/steam/Unturned -p 27015:27015 -p 27016:27016 -e SERVER_TYPE=rm4 --restart unless-stopped --name myserverinstance imperialplugins/unturned -SkipAssets`

This will create a docker container that will listen on 27015 for Unturned and 27016 for Steam queries with RocketMod 4. 

You can also define STEAM_CMD_ARGS to run your own steamcmd commands on each restart:
`docker run -it -v <host_path>:/home/steam/Unturned -p 27015:27015 -p 27016:27016 -e STEAM_CMD_ARGS="+download_depot <somedepot>" -e SERVER_TYPE=rm4 --restart unless-stopped --name myserverinstance imperialplugins/unturned -SkipAssets`

## Server Type
The following are supported for the SERVER_TYPE environment variable:
* rm4 (installs RocketMod 4 module)
* rm5 (installs RocketMod 5 module)
* anything else or empty (does not install any modules)

## Building
To build, use `docker build . -t unturned`.

After building, you can start your server like the command in "Getting Started", but you will have to replace "imperialplugins/unturned" with just "unturned".

## Non-Docker Usage
First install required dependencies:
```sh
$ sudo apt-get install -y unzip tar curl coreutils lib32gcc1 libgdiplus
```

Set GAME_INSTALL_DIR, SERVER_NAME, GAME_ID (304930 for normal Unturned, 1110390 for dedicated Unturned), SERVER_TYPE environment variables:

```sh
$ export GAME_INSTALL_DIR=/path/to/Unturned
$ export SERVER_NAME=YOUR_SERVER_INSTANCE_NAME
$ export GAME_ID=1110390
$ export SERVER_TYPE=rm4
```

If you are not using the dedicated server app (1110390), you must also specify STEAM_USERNAME, STEAM_PASSWORD and STEAM_GUARD_TOKEN.
```sh
$ export STEAM_USERNAME=YourUsername
$ export STEAM_PASSWORD=YourPassword
$ export STEAM_GUARD_TOKEN=YourSteamGuardToken (if you have Steam Guard enabled)
```

You do not have to install steacmd, this script will do it for you. 

The script also supports $STEAM_CMD_ARGS which allows you to run your own steamcmd commands on each restart (e.g. `export STEAM_CMD_ARGS="+download_depot <somedepot>`)

Finally, run `init.sh` to install / update your server. It will automatically start the server afterwards:
```sh
$ ./init.sh 
```

You can also append Unturned server args like this:
```sh
$ ./init.sh -SkipAssets
```
