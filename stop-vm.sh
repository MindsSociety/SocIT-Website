#!/bin/sh

VM=Minds-Server

if VBoxManage list runningvms | grep $VM > /dev/null; then
  VBoxManage controlvm $VM poweroff soft
fi
