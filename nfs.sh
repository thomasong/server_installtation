#Server set up�� 
	yum install nfs-utils rpcbind
	mkdir /opt/centos6
	cd /opt/centos6/
	mkdir thisISnfsFile
	vi /etc/exports
	/opt/centos6  192.168.1.0/24(rw,all_squash,anonuid=504,anongid=504)
	###:/opt/centos6��ʾnfs�����Ŀ¼ 192.168.1.0-192.168.1.254�����IP���Է��ʣ�
	#reload export
	exportfs �Crv
	#check local nfs directory
	showmount �Ce 
	#���÷�������
	chkconfig nfs on
	/etc/init.d/rpcbind start
	/etc/init.d/nfs start


#client set up 
	yum install nfs-utils rpcbind
	#check directories 
	showmount �Ce 192.168.1.100
	#mount directory from server
	#mount �Ct nfs �Co nolock [��������IP]:[�����Ŀ¼·��] [�ͻ���Ŀ¼·��]
	mkdir /opt/centos6
	mount -t nfs 192.168.1.100:/opt/centos6/  /opt/centos6/
	#set auto load
	vi /etc/fstab
	192.168.1.75:/opt/centos6/ /opt/centos6/ nfs nodev,ro,rsize=32768,wsize=32768 0 0
