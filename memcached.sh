centos 6
wget http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-7.noarch.rpm
rpm -Uvh epel-release-6-7.noarch.rpm

yum install memcached
#Configure Memcached
vi /etc/sysconfig/memcached
	# Running on Port 11211
	PORT="11211"

	# Start as memcached daemon
	USER="memcached"

	# Set max simultaneous connections to 1024
	MAXCONN="1024"

	# Set Memory size to 2048 - 4GB(4096)
	CACHESIZE="2048"

	#Set server IP address
	OPTIONS="-l 127.0.0.1"

#Start Memcached
	chkconfig --levels 235 memcached on
	/etc/init.d/memcached start
	/etc/init.d/memcached restart
#stop memcached
	/etc/init.d/memcached stop
	/etc/init.d/memcached status
#Verify Memcached
	netstat -tulpn | grep :11211
	#check the stats of the server using memcached-tool.
	memcached-tool 127.0.0.1 stats

#Configure Firewall to Secure Memcached Server
vi /etc/sysconfig/iptables
	## Enable access on IP ranges from 172.16.1.1 to 172.16.1.10 for Port 11211 ##
	iptables -A INPUT -p tcp --destination-port 11211 -m state --state NEW  -m iprange --src-range 172.16.1.1-172.16.1.10 -j ACCEPT
	iptables -A INPUT -p udp --destination-port 11211 -m state --state NEW  -m iprange --src-range 172.16.1.1-172.16.1.10 -j ACCEPT
#restart iptables
service iptables restart
