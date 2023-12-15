#!/bin/sh

download(){
   if [ -z "$XRAY_VERSION" ]
   then
        wget "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip"
   else
        wget "https://github.com/XTLS/Xray-core/releases/download/v$XRAY_VERSION/Xray-linux-64.zip"
   fi
}

install(){
   unzip     "./Xray-linux-64.zip" "xray"
   chmod +x  "./xray"
   rm    -rf "./Xray-linux-64.zip"
}

config(){
   sed -i "s|INBOUND_UUID|${INBOUND_UUID}|g" "./config.json"
}

download
install
config