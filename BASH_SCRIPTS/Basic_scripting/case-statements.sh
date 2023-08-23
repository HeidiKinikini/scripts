#!/bin/bash 

# This script demonstrates a #case statement. 

case "${1}" in
    start)
        echo 'Starting.'
    ;;
    stop)
        echo 'Stopping.'
    ;;
    status)
        echo 'Status:'
    ;;
    *)
      echo 'Supply a valid option.' >&2 
      exit 1 
      ;;
esac 