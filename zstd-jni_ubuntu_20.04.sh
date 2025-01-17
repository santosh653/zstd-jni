# ----------------------------------------------------------------------------
#
# Package           : zstd-jni
# Version           : v1.5.0-1
# Source repo       : https://github.com/luben/zstd-jni
# Tested on         : ubuntu_20.04
# Script License    : Apache License, Version 2 or later
# Maintainer        : Santosh Kulkarni <santoshkulkarni70@gmail.com> / Priya Seth<sethp@us.ibm.com>
#
# Disclaimer        : This script has been tested in non-root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------
#!/bin/bash


export REPO=https://github.com/luben/zstd-jni

if [ -z "$1" ]; then
  export VERSION="v1.5.0-1"
else
  export VERSION="$1"
fi

sudo apt-get update
sudo apt-get install openjdk-8-jdk wget git -y
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-ppc64el/
sudo apt install  -y maven
mvn -version

if [ -d "zstd-jni" ] ; then
  rm -rf zstd-jni
fi

git clone ${REPO}

## Build and test zstd-jni
cd zstd-jni
git checkout ${VERSION}
ret=$?

if [ $ret -eq 0 ] ; then
  echo "$Version found to checkout "
else
  echo "$Version not found "
  exit
fi

mvn clean install
