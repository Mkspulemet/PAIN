#!/bin/bash
name=`hostname` 
functionserver {

}

funtionclient{

}


#conditions

if [$name=server] 
then
   echo `hostname`
   functionclient
elif [$name=server] 
then
   echo `hostname`
   functionclient
fi
