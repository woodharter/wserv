#!/bin/bash

# run
if [ "$WSERV_DEBUG" = "TRUE" ];
then
    echo "ENV WSERV_DEBUG==TRUE"
    echo "RUNNING WSERV IN DEBUG MODE - YOU NEED TO START THE PROCESS MANUALLY"
    # just run something that will keep the container running
    /bin/bash
else
    echo "STARTING WSERV watch.py"
    cd /wserv
    python3 watch.py&

    echo "STARTING WSERV flask"
    cd /wserv/wflask
    flask run --host=0.0.0.0
fi