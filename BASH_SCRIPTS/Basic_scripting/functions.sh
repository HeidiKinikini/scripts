#!/bin/bash

#This function sends a message to syslog and to standard outuput if VERBOSE is true.

log() {
     
local MESSAGE="${@}"
    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${MESSAGE}"
    fi 
    logger -t filename "${MESSAGE}"
}

# This function creates a backup of a file. Returns non-zero status on error. 

backup_file(){

local FILE="{1}"

# Make sure the file exists. 

if [[ -f "${FILE"} ]]
then    
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log "Backing up ${FILE} to ${BACKUP_FILE}."

    # The exit status of the function will be the exit status of the cp command. 

    cp -p ${FILE} ${BACKUP_FILE}
else 
    return 1
fi 

}


# Make a decision based on the exit status of the function. 

if [[ "${?}" -eq '0' ]]
then 
    log 'File backup succeeded!'
else 
    log 'File backup failed!'
    exit 1
fi 