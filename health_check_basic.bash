#!/bin/bash
# This script will run a basic health check on you local machine.

printf "This is the start of the basic health check script.\n"
echo
uptime | awk -F'[ ,:]' '
    {printf " System Time: " $2 ":" $3 ":" $4 "\n"}
    {printf "      Uptime: "$6 " " $7 " " $10 " hours and " $11 " minutes\n"}
    {printf " Load Avg 1m: The CPU was overloaded by " $21 - 1.00 "%%. \n"}
    {printf " Load Avg 5m: The CPU idled for " 100 - ($23 * 100) "%% of the time. \n"}
    {printf "Load Avg 15m: The CPU was overloaded by " ($25 * 100) - 100 "%%. \n"}'
echo

printf "The top 5 processes by %%CPU, %%MEM, PID, ARG, USER. \n\n"
ps -eo pcpu,pmem,pid,args,user --no-headers| sort -t. -nk1,2 -k5,5 -r |head -n 5

