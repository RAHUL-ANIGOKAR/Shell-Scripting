#!/bin/bash

set -e

GitUrl="https://github.com/RAHUL-ANIGOKAR/ComplaintTrackingSystem"
Project_Dir="/home/ubuntu/ComplaintTrackingSystem"
Webapp_Dir="/opt/tomcat9/webapps"

if git clone "$GitUrl" ;then
	echo "Repo Cloned Successfully"
else
	echo"Failed to Clone the Repo" && exit 1
fi

cd "$Project_Dir"
mkdir -p build
cp -r WebContent/* /build/
cd build

if zip -r CTS.war ; then
	echo "War Created Successfully"
else
	echo "Failed to Create a War" && exit 1
fi

if cp CTS.war "$Webapp_Dir/" ;then
	echo "War Deployed Successfully"
else
	echo "Failed to Deploy the War"
fi

if /opt/tomcat9/startup.sh ;then
	echo "Tomcat server Started Successfully"
else
	echo "Failed to Start the Tomcat Server" && exit 1
fi


echo "Project Deployed Successfully"

