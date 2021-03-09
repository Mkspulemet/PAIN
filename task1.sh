#!/bin/bash
name=`hostname` 
functionserver()
{
	sudo yum install -y nfs-util
	sudo systemctl start nfs-server rpcbind
	sudo systemctl enable nfs-server rpcbind
	sudo mkdir -p /home/nfs
	sudo chmod -R 777 /home/nfs
	echo "/home/nfs 192.168.100.0/24(rw,sync,no_root_squash,no_all_squash)" | sudo tee /etc/exports
	sudo systemctl restart nfs-server
	
}

funtionclient() 
{
	sudo yum install -y nfs-util
        sudo systemctl start nfs-server rpcbind
        sudo systemctl enable nfs-server rpcbind
	
	sudo mkdir /media/nfs_share
	mount -t nfs 192.168.100.33:/home/nfs/ /media/nfs_share/
	
}


#conditions

if [ "${osname}" == "server" ]; then
	echo ${osname}
	f_server_install
elif [ "${osname}" == "client" ]; then
	echo ${osname}
	f_client_install
fi
