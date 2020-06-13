# killing-floor-docker

This is a fork of Vel-San/killing-floor-docker without custom maps and mutators.

## Current (and future) variables

### Build Vars

```Dockerfile
# Used for building only - Steam Username
ARG steamU=""
# Used for building only - Steam Password
ARG steamP=""
# Used for building only - 2FA Code - Please try to put a code the was newly generated or it won't last untill the image is pulled
ARG code=""
```

### Run Vars

```bash
# Map Name
KF_MAP=
# 1 Begginer, 2 Normal, 4 Hard, 5 Suicidal, 7 Hell On Earth
KF_DIFFICULTY=
# 0 - 4 waves, 1 - 7 waves, 2 - 10 waves
KF_GAME_LENGTH=
# Server Name
KF_SERVER_NAME=
# Game Password, Do not provide the parameter if you want no password
KF_GAME_PASS=
# Mutators to be enabled by default on server startup; sepereate by a Comma
# And make sure to configure your System/ directory before building to add the mutators
KF_MUTATORS=
# Admin Name
KF_ADMIN_NAME=
# WebAdmin Password
KF_ADMIN_PASS=
# Admin E-Mail
KF_ADMIN_EMAIL=
# Message Of The Day - Shows when someone joins the server
KF_MOTD=
# Redirect URL
KF_REDIRECT=
```

## Build Command

- Put your `password` inside the `hyphons` to avoid any errors from bash, e.g 'password'
- Place any Maps or mutators inside `Maps & System` directory (*pre-configure them*)
- ~~Pre-configure `KillingFloor.ini` to your liking (in case you need to add custom mutators in ServerPackages or so)~~ Removed for now, Check kf1_functions.sh for the supported enviroments that are edited inside the default KillingFloor.ini - later on I will add support for other complex changes
- Run the following command or use `build_docker` with the arguments

```bash
docker build -t vel7an/kf1-docker --build-arg steamU=... --build-arg steamP='...' --build-arg code=... .
```

## Run Command

### Start the server

- Edit `env_file` to your own custom vars
    >`bash run_docker.sh` or double click it!

### Finalized RUN Command (if you are not using the bash mentioned above)

```bash
docker run --rm -it --name kf1-docker -p 0.0.0.0:7707:7707/udp -p 0.0.0.0:7708:7708/udp -p 0.0.0.0:7717:7717/udp -p 0.0.0.0:28852:28852/udp -p 0.0.0.0:28852:28852/tcp -p 0.0.0.0:8075:8075/tcp -p 0.0.0.0:20560:20560/udp -p 0.0.0.0:20560:20560/tcp --env-file=env_file vel7an/kf1-docker
```
