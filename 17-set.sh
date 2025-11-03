#!/bin/bash

set -e #setting up automatic exit if we get an error, set -ex for debug mode

failure(){
    echo "failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR #ERR is the error signal

echo "hi from success"
echoooo "hi from failure"
echo "hi after failure"