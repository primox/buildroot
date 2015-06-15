#!/bin/sh

start() {
	modprobe 8192cu
	sleep 2
	wpa_supplicant -D wext -B -i wlan0 -c /etc/wpa_supplicant.conf
	ifup wlan0
}

stop() {
	ifdown wlan0
	killall wpa_supplicant
	#modprobe -r 8192cu	# BUG: Unloading 8192cu kernel module produces kernel panic, need to reboot afterwards
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  retart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
esac

