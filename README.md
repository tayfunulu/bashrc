# System Resource Monitor Script (.bashrc)

This bash script provides a summary of system resources including date & time, external IP address, memory usage, CPU temperature, system uptime, kernel version, weather information, and disk usage. The output is formatted to ensure alignment and readability.

## Features

- **Date & Time**: Displays the current date and time.
- **External IP**: Retrieves and shows the external IP address.
- **Memory Usage**: Displays memory usage in a visual bar format with percentage.
- **CPU Temperature**: Shows the current CPU temperature.
- **Uptime**: Displays how long the system has been running.
- **Kernel Version**: Shows the current kernel version.
- **Weather**: Displays the current weather.
- **Disk Usage**: Shows disk usage for specified mount points in a visual bar format with percentage.

## Usage

1. **Clone the Repository**
```bash
git clone https://github.com/tayfunulu/bashrc.git
cd bashrc
```
2. **Make the Script Executable**
```bash
chmod +x info.sh
```
3. **Run the Script**
```bash
./info.sh
```
4. **Add on .bashrc**
```bash
cd
echo "./bashrc/info.sh" >> .bashrc
```

**Example Output** 

```bash
=========================================================
📅  Date & Time   : 05-August-2024 , 12:34
🌐  External IP   : 123.123.67.89
💾  Memory Usage  : [███████             ] 35% - 3.5G / 10G
🌡️  CPU Temp      : 45.2 °C
⏳  Uptime        : up 2 hours, 30 minutes
🔧  Kernel        : 5.15.0-76-generic
☀️  Weather       : 🌦️Light rain 20°C 88% (Your Location)
---------------------------------------------------------
💾  /dev/nvme0n1p2 Usage  : [███████████       ] 55% - 55G / 100G (/)
💾  /dev/sda1 Usage       : [████████          ] 40% - 1.4T / 3.6T (/media/tayfun/Toshiba4T)
```


**Customization**

To customize the script for different mount points or additional features, you can edit the monitor.sh script and modify the show_disk_usage function to include additional or different mount points.

**License**

This project is licensed under the MIT License. See the LICENSE file for details.

**Contributing**

Contributions are welcome! Please open an issue or submit a pull request for any changes or enhancements.

**Author**
Tayfun ULU
