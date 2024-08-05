#!/bin/bash
# -*- coding: utf-8 -*-

#!/bin/bash
# -*- coding: utf-8 -*-

# Function to display memory usage in a bar format with colors and percentage
show_memory_usage() {
    local total=$(free -m | awk '/^Mem:/ {print $2}')
    local used=$(free -m | awk '/^Mem:/ {print $3}')
    local percent=$((used * 100 / total))

    # Determine bar length and segments
    local bar_length=20
    local used_bar=$((bar_length * used / total))
    local free_bar=$((bar_length - used_bar))

    # Create bar with used and free segments
    local bar="["
    for ((i=0; i<$used_bar; i++)); do
        bar="${bar}\e[41m \e[0m"
    done
    for ((i=0; i<$free_bar; i++)); do
        bar="${bar}\e[42m \e[0m"
    done
    bar="${bar}]"

    echo -e "\e[1;32m💾 Memory Usage\e[m  : $bar $percent% - $(free -h | awk '/^Mem:/ {print $3 " / "$2}')"
}

# Function to display disk usage in a bar format with colors and percentage
show_disk_usage() {
    local mount_point=$1
    local disk_name=$((df -m | awk -v mp="$mount_point" '$6 == mp {print $1}') | sed 's|.*/||')
    local total=$(df -m | awk -v mp="$mount_point" '$6 == mp {print $2}')
    local used=$(df -m | awk -v mp="$mount_point" '$6 == mp {print $3}')
    local percent=$(df -h | awk -v mp="$mount_point" '$6 == mp {print $5}')
    local used_percent=$(df -m | awk -v mp="$mount_point" '$6 == mp {print int($3*100/$2)}')

    # Determine bar length and segments
    local bar_length=20
    local used_bar=$((bar_length * used / total))
    local free_bar=$((bar_length - used_bar))

    # Create bar with used and free segments
    local bar="["
    for ((i=0; i<$used_bar; i++)); do
        bar="${bar}\e[41m \e[0m"
    done
    for ((i=0; i<$free_bar; i++)); do
        bar="${bar}\e[42m \e[0m"
    done
    bar="${bar}]"

    local padded_name=$(printf '%-12s' "$disk_name")

    echo -e "\e[1;32m💽 $padded_name\e[m  : $bar $percent - $(df -h | awk -v mp="$mount_point" '$6 == mp {print $3 " / "$2}') ($mount_point)"
}

# Adding a separator line
echo -e "\e[1;32m=========================================================\e[0m"

# Date & Time
echo -e "\e[1;32m📅 Date & Time\e[0m   : $(date '+%d-%B-%Y , %H:%M')"

# External IP
echo -e "\e[1;32m🌐 External IP\e[0m   : $(curl -s ifconfig.me)"

# Memory Usage
show_memory_usage

# CPU Temperature
echo -e "\e[1;32m🌡 CPU Temp\e[0m      : $(awk '{printf "%3.1f °C\n", $1/1000}' /sys/class/thermal/thermal_zone0/temp)"

# Uptime
echo -e "\e[1;32m⏱ Uptime\e[0m        : $(uptime -p)"

# Kernel Version
echo -e "\e[1;32m🖥️ Kernel\e[0m        : $(uname -r)"

echo -e "\e[1;32m⛅ Wheather\e[m       : $(curl -s 'https://wttr.in/?format=%c%C%20%t%20%h%20(%l)%20%m')"

# Adding a separator line before disk usage
echo -e "\e[1;32m---------------------------------------------------------\e[0m"

# Disk Usage
show_disk_usage /
# Add more disk usages with new lines 
#show_disk_usage /media/pi/xxx
