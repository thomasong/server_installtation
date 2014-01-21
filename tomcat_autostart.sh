    #!/bin/bash
    # chkconfig: 234 20 80
    # description: Tomcat Server basic start/shutdown script
    # processname: tomcat
	#/etc/init.d/tomcat
    JAVA_HOME=/data/env/jdk
	TOMCAT_HOME=/data/env/tomcat/bin
    export JAVA_HOME
	export TOMCAT_HOME

    START_TOMCAT=$TOMCAT_HOME/startup.sh
    STOP_TOMCAT=$TOMCAT_HOME/shutdown.sh
    start() {
    echo -n "Starting tomcat: "
    cd $TOMCAT_HOME
    ${START_TOMCAT}
    echo "done."
    }
    stop() {
    echo -n "Shutting down tomcat: "
    
    cd $TOMCAT_HOME
    ${STOP_TOMCAT}
    echo "done."
    }
    case "$1" in
    start)
    start
    ;;
    stop)
    stop
    ;;
    restart)
    stop
    sleep 10
    start
    ;;
    *)
    echo "Usage: $0 {start|stop|restart}"
    esac
    exit 0
	

	#shell
	sudo chmod 755 tomcat
	sudo /sbin/chkconfig --add tomcat
	sudo /sbin/chkconfig --level 234 tomcat on
	chkconfig --list tomcat.
	service tomcat start
	service tomcat stop
	
	
	
	#or at a very important place to start tomcat
	/etc/rc.local is the best place for this command to be added if it is going to be run at start up.