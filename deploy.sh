#!/bin/bash

set -e

GitUrl="https://github.com/RAHUL-ANIGOKAR/ComplaintTrackingSystem"
PROJECT_DIR="/home/ubuntu/ComplaintTrackingSystem"
Webapp_Dir="/opt/tomcat9/webapps"
SERVLET_API_JAR="$PROJECT_DIR/WebContent/WEB-INF/lib/servlet-api.jar"
MYSQL_CONNECTOR_JAR="$PROJECT_DIR/WebContent/WEB-INF/lib/mysql-connector-j-8.2.0.jar"

rm -rf "$PROJECT_DIR"


if git clone "$GitUrl" ; then
	    echo "[OK] Cloned project."
    else
	        echo "[ERROR] Failed to clone repository!" && exit 1
fi

cd "$PROJECT_DIR"

rm -rf build
mkdir -p build/WEB-INF/classes
mkdir -p build/WEB-INF/lib


cp -r WebContent/*.jsp build/
cp -r WebContent/WEB-INF/web.xml build/WEB-INF/
cp -r WebContent/WEB-INF/lib/* build/WEB-INF/lib/

echo "[INFO] Compiling Java sources..."

if javac -d build/WEB-INF/classes \
	    -classpath "$SERVLET_API_JAR:$MYSQL_CONNECTOR_JAR" \
	        $(find src/main/java -name "*.java"); then
    echo "[OK] Compilation successful."
else
	    echo "[ERROR] Compilation failed!" && exit 1
fi

echo "[INFO] Creating WAR file..."

cd build


if jar -cvf ComplaintTrackingSystem.war *; then
	    echo "[OK] WAR file created successfully."
    else
	        echo "[ERROR] Failed to create WAR file!" && exit 1
fi

if cp ComplaintTrackingSystem.war "$Webapp_Dir/" ;then
	echo "War Deployed Successfully"
else
	echo "Failed to Deploy the War"
fi

cd /

if /opt/tomcat9/bin/startup.sh ;then
	echo "Tomcat server Started Successfully"
else
	echo "Failed to Start the Tomcat Server" && exit 1
fi


echo "Project Deployed Successfully"

