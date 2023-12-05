#!/bin/bash
sudo cgdelete -g cpuset:/cpulimitl
sudo cgcreate -t $USER:$USER -a $USER:$USER  -g cpuset:/cpulimitl
script=$1
trd=$2
args1=$3
args2=$4
args3=$5
sudo cgset -r cpuset.mems=0 cpulimitl 
sudo cgset -r cpuset.cpus=0-$trd cpulimitl
sudo cgexec -g cpuset:cpulimitl bash $script $args1 $args2 $args3
