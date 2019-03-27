# Unturned-Docker
This repository contains scripts for installing 64bit Unturned Linux with .NET 4.6.1 (optionally using Docker). It also uses Unturned .NET 4.6.1 versions.

# Getting started
If you do not want to build this manually, you can visit [Docker Hub](https://hub.docker.com/r/imperialplugins/unturned) and pull from there or you can pull by using the `imperialplugins/unturned` image directly.

Example:

`docker run -it -e STEAM_USERNAME=myusername -e STEAM_PASSWORD=mypassword -p 27015:27015 -p 27016:27016 -e SERVER_TYPE=rm4 --restart unless-stopped --name myserverinstance imperialplugins/unturned`

## Building
To build, use `docker build . -t unturned`.

After building, you can start your server like this:
`docker run -it -e STEAM_USERNAME=myusername -e STEAM_PASSWORD=mypassword -p 27015:27015 -p 27016:27016 -e SERVER_TYPE=rm4 --restart unless-stopped --name myserverinstance unturned`

This will create a docker container that will listen on 27015 for Unturned and 27016 for Steam queries. It will automatically restart should the server shut down or crash.

Also, on each container restart the server will automatically update.

You will not be able to input anything to the console (because Unity handles stdin/stdout in a weird way).

## Non-Docker Usage
This script will also install Steamcmd.

First set GAME_INSTALL_DIR, GAME_ID (304930 for Unturned), STEAM_USERNAME and STEAM_PASSWORD, SERVER_TYPE environment variables.

Finally, run `init.sh` to install / update your server. It will automatically start the server afterwards.

E.g.:
```
> GAME_INSTALL_DIR=/path/to/Unturned
> GAME_ID=304930
> SERVER_TYPE=rm4
> STEAM_USERNAME=myUsername
> STEAM_PASSWORD=myPassword
> ./init.sh
```

# Server Type
The following are supported for the SERVER_TYPE environment variable:
* rm4 (installs RocketMod 4 module)
* rm5 (installs RocketMod 5 module)
* anything else or empty (does not install any modules)