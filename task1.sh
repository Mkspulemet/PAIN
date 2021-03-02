#!/bin/bash
name=`hostname` 
functionserver {
	sudo yum install -y nfs-util
	sudo systemctl start nfs-server rpcbind
	sudo systemctl enable nfs-server rpcbind
	sudo mkdir -p /home/nfs
	sudo chmod -R 777 /home/nfs
	echo "/home/nfs 192.168.100.0/24(rw,sync,no_root_squash,no_all_squash)" | sudo tee /etc/exports
	sudo systemctl restart nfs-server
	
}

funtionclient{
	sudo yum install -y nfs-util
        sudo systemctl start nfs-server rpcbind
        sudo systemctl enable nfs-server rpcbind
	
	sudo mkdir /media/nfs_share
	mount -t nfs 192.168.100.33:/home/nfs/ /media/nfs_share/
	
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
