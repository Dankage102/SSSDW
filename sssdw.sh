#!/bin/bash
#watch -n 180 sh ./sssdw.sh

# -X POST - use POST method.
# -H "Content-Type: application/json" - header tells server you're sending JSON data.
# -d '{"username": "test", "content": "hello"}' - sets request data.
# curl -X POST -H "Content-Type: application/json" -d '{"username": "test", "content": "hello"}' "webhook link here"

# To make command more readable you can split it to multiple lines using backslash `\`
# and set webhook url as variable, so you don't need to paste it over and over again.
# Also you can add it to your `.*rc` file.

_CompareString="Players:";
_Delimiter='```';

_PlayersOnline="`wget -qO- https://api.soldat.pl/v0/server/ip/port/players`"
_PlayersOnline=`echo $_PlayersOnline | tr -dc ':,[:space:][:alnum:]\n\r'`
_PlayersOnline=`echo $_PlayersOnline | sed 's/,/, /g'`
if [ "$_PlayersOnline" != "$_CompareString" ]; then
export WEBHOOK_URL="webhook link here"
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"username": "Server#1", "content": "'"$_Delimiter$_PlayersOnline$_Delimiter"'"}' \
  $WEBHOOK_URL
fi

_PlayersOnline="`wget -qO- https://api.soldat.pl/v0/server/ip/port/players`"
_PlayersOnline=`echo $_PlayersOnline | tr -dc ':,[:space:][:alnum:]\n\r'`
_PlayersOnline=`echo $_PlayersOnline | sed 's/,/, /g'`
if [ "$_PlayersOnline" != "$_CompareString" ]; then
export WEBHOOK_URL="webhook link here"
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"username": "Server#2", "content": "'"$_Delimiter$_PlayersOnline$_Delimiter"'"}' \
  $WEBHOOK_URL
fi