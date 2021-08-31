#!/bin/bash

##
# BASH script that checks the following:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections 
#   - Kernel version
##

##
# Memory check
##
server_name=$(hostname)


function networks_list() {
    echo "This command list the networks SDN"
	echo "The current networks  ${server_name} is: "
	OUTPUT=$(/sbin/ip -4 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1 |grep zt* 2>&1)
	echo "$OUTPUT"
}


function memory_check() {
    echo "#######"
	echo "The current memory usage on ${server_name} is: "
	free -h
	echo "#######"
}


function cpu_check() {
    echo "#######"
	echo "The current CPU load on ${server_name} is: "
    echo ""
	uptime
    echo "#######"
}

function tcp_check() {
    echo "#######"
	echo "Total TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo "#######"
}

function kernel_check() {
    echo "#######"
	echo "The exact Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo "#######"
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

all_checks
