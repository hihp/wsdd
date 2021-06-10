#!/usr/bin/env bash

# Original from JonasPed 
# under Apache 2.0 license
#
# modified by hihp (c) 2021

args=( )

if [ ! -z "${HOSTNAME}" ]; then
	args+=( "-n $HOSTNAME ")
else 
	echo "HOSTNAME environment variable must be set."
	exit 1
fi

if  [ ! -z "${WORKGROUP}" ]; then
	args+=( "-w $WORKGROUP " )
fi

if  [ ! -z "${DOMAIN}" ]; then
	args+=( "-d $DOMAIN " )
fi

echo "Starting wsdd (Web Services on Devices daemon) by @christgau"


exec python wsdd.py ${args}
