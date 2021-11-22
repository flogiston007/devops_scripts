#!/bin/bash

CURRENT_FOLDER=$(pwd)

# echo "$CURRENT_FOLDER"

USER_NAME=$1
DIRECTORY=$2

if [ ! -n "$USER_NAME" ] || [ ! -n "$DIRECTORY" ]; then
	echo "Enter UserName and Directory!"
	exit 0
fi

IS_USER=$(getent passwd $USER_NAME)
if [ ! -n "$IS_USER" ]; then
	echo "Enter valid user name!"
	exit 0
fi

if [ ! -d $DIRECTORY ]; then
	echo "Enter valid Directory!"
	exit 0
fi

$(sudo chown -R $USER_NAME $DIRECTORY)
if [ $? -eq 1 ]
then
   echo "Something went wrong"
fi