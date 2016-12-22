#!/bin/bash
# Based on https://github.com/SeleniumHQ/docker-selenium/blob/master/StandaloneChrome/entry_point.sh

source /opt/bin/functions.sh

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"

SERVERNUM=$(get_server_num)

cd "$( dirname "${BASH_SOURCE[0]}" )"

sudo chown -R $UID:$GROUPS .

xvfb-run -n $SERVERNUM --server-args="-screen 0 $GEOMETRY -ac +extension RANDR" \
    mvn test -Dsurefire.skipAfterFailureCount=1
