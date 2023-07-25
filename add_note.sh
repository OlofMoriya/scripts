#!/bin/bash

data='{"text":"'$1'", "sender": "olof", "reciever":"olof", "persist": true}'

curl -d "$data" -H "api_key:supersecret" -X POST http://sm.moriya.se/api/add
