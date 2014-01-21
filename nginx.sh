#centos 6 install nginx by yum
	wget http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
	rpm -ivh nginx-release-centos-6-0.el6.ngx.noarch.rpm
	yum install nginx
	chkconfig nginx on
	#command
	service nginx start
	service nginx stop
	service nginx restart
	service nginx status
	service nginx reload
	#config files
	Default configuration directory: /etc/nginx/
	Default SSL and vhost config directory: /etc/nginx/conf.d/
	Default log file directory: /var/log/nginx/
	Default document root directory: /usr/share/nginx/html
	Default configuration file: /etc/nginx/nginx.conf
	Default server access log file: /var/log/nginx/access.log
	Default server access log file: /var/log/nginx/error.log
	
	#Set or update worker_processes as follows (this must be set to CPU(s) in your system. Use the lscpu | grep '^CPU(s)' command to list the number of CPUs in the server)
	worker_processes  2;
	#Turn on gzip support:
	gzip  on;
	#Save and close the file. Edit the file /etc/nginx/conf.d/default.conf, enter:
	 vi /etc/nginx/conf.d/default.conf
	#Set IP address and TCP port number:
	 listen       202.54.1.1.1:80;
	#servername
	server_name  www.xxxx.com;
	#Verify that everything is working:
	netstat -tulpn | grep :80
	ps aux | grep nginx
	#kill all nginx
	ps -ef | grep nginx| awk '{print $2}'|xargs kill -9
	#Firewall configuration: Open TCP port # 80
	vi /etc/sysconfig/iptables
	-A INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT
	service iptables restart
	
	
	
	