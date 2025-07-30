#!/bin/bash

set -e

GitUrl=""
Project_Dir=""
Webapp_Dir=""

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

