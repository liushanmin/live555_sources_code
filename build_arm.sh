#!/bin/bash

LIVE555_DIR=`pwd`

cd $LIVE555_DIR

INSTALL_DIR=$LIVE555_DIR/output

if [ "$1" == "clean" ]; then
    echo "do make clean ..."
    make clean
    rm -rf "$INSTALL_DIR"
    exit 0
fi

mkdir -p $INSTALL_DIR

# 编译成静态库
export LDFLAGS="-static"

# 声明交叉编译器的路径
# export PATH=/opt/arm-rockchip830-linux-uclibcgnueabihf/bin/:$PATH

./genMakefiles armlinux


# CROSS_COMPILE 可以根据平台不同进行修改
make -j$(nproc) CROSS_COMPILE=arm-rockchip830-linux-uclibcgnueabihf-

make install PREFIX=$INSTALL_DIR CROSS_COMPILE=arm-rockchip830-linux-uclibcgnueabihf-

