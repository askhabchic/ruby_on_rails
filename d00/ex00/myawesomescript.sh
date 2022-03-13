#!/bin/sh

if [ ! -z $1 ] ; then
	curl --silent -I $1 | grep "Location:" | cut -b 11- 
fi