#!/bin/bash

# run
if [ "$WSERV_DEBUG" = "TRUE" ];
then
    echo "ENV WSERV_DEBUG==TRUE"
    echo "RUNNING WSERV IN DEBUG MODE - YOU NEED TO START THE PROCESS MANUALLY"
    echo "This container will run for 2M seconds or till you kill it"
    # just run something that will keep the container running
    sleep 2000000
else
    echo "STARTING WSERV watch.py"
    cd /wserv
    python3 watch.py&

    echo "STARTING WSERV flask"
    cd /wserv/wflask
    flask run --host=0.0.0.0
fi