#!/bin/bash

# Simple Bash Port Scanner

# Check if arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <host> <start-port> <end-port>"
    exit 1
fi

host=$1
start_port=$2
end_port=$3

# Function to scan a single port
scan_port() {
    (echo >/dev/tcp/$host/$1) >/dev/null 2>&1 && echo "Port $1 is open"
}

# Main scan loop
echo "Scanning $host from port $start_port to $end_port..."
for ((port=$start_port; port<=$end_port; port++))
do
    scan_port $port &
done

wait
echo "Scan completed."

