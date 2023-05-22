#!/bin/bash

cpu_values=$(awk -F'[:%]' '/CPU/ {print $2}' monitor.log)
max_cpu=$(echo "$cpu_values" | sort -nr | head -n 1)
avg_cpu=$(echo "$cpu_values" | awk '{sum+=$1; count++} END {print sum/count}')

echo "Max CPU usage: $max_cpu%"
echo "Average CPU usage: $avg_cpu%"

#!/bin/bash

mem_values=$(awk -F'[:%]' '/MEM/ {print $4}' monitor.log)
max_mem=$(echo "$mem_values" | sort -nr | head -n 1)
avg_mem=$(echo "$mem_values" | awk '{sum+=$1; count++} END {print sum/count}')

echo "Max MEM usage: $max_mem%"
echo "Average MEM usage: $avg_mem%"

