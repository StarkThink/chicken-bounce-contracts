#!/bin/bash
set -euo pipefail
pushd $(dirname "$0")/..

if [ $# -ge 1 ]; then
    export PROFILE=$1
else
    export PROFILE="dev"
fi

export RPC_URL="http://localhost:5050"

export WORLD_ADDRESS=$(cat ./manifests/dev/manifest.json | jq -r '.world.address')
export GAME_SYSTEM_ADDRESS=$(cat ./manifests/$PROFILE/manifest.json | jq -r '.contracts[] | select(.name == "chicken_bounce::systems::game_system::game_system" ).address')

echo "---------------------------------------------------------------------------"
echo world : $WORLD_ADDRESS
echo "---------------------------------------------------------------------------"

# enable system -> models authorizations
sozo -P ${PROFILE} auth grant --world $WORLD_ADDRESS --wait writer \
  Game,$GAME_SYSTEM_ADDRESS\
  Board,$GAME_SYSTEM_ADDRESS\
  Tile,$GAME_SYSTEM_ADDRESS\
  LeaderBoard,$GAME_SYSTEM_ADDRESS\
  LeaderBoardPlayers,$GAME_SYSTEM_ADDRESS\

echo "Default authorizations have been successfully set."
