#Server set up： 
	yum install nfs-utils rpcbind
	mkdir /opt/centos6
	cd /opt/centos6/
	mkdir thisISnfsFile
	vi /etc/exports
	/opt/centos6  192.168.1.0/24(rw,all_squash,anonuid=504,anongid=504)
	###:/opt/centos6表示nfs共享的目录 192.168.1.0-192.168.1.254区间的IP可以访问，
	#reload export
	exportfs –rv
	#check local nfs directory
	showmount –e 
	#设置服务启动
	chkconfig nfs on
	/etc/init.d/rpcbind start
	/etc/init.d/nfs start


#client set up 
	yum install nfs-utils rpcbind
	#check directories 
	showmount –e 192.168.1.100
	#mount directory from server
	#mount –t nfs –o nolock [主机名或IP]:[服务端目录路径] [客户端目录路径]
	mkdir /opt/centos6
	mount -t nfs 192.168.1.100:/opt/centos6/  /opt/centos6/
	#set auto load
	vi /etc/fstab
	192.168.1.75:/opt/centos6/ /opt/centos6/ nfs nodev,ro,rsize=32768,wsize=32768 0 0
