TARGETDIR=$1
source .config &>/dev/null


# remove default cmdline
if [ -f $TARGETDIR/rpi-firmware/cmdline.txt ] ; then
	rm -f $TARGETDIR/rpi-firmware/cmdline.txt
fi

# Create zImage for Device Tree enabled kernel
result=$(cat $BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE | grep -c "CONFIG_BCM2708_DT=y")
if [ $result == '1' ] ; then
	if [ -f $TARGETDIR/zImage ] ; then
		echo "Creating zImage-DT for Device Tree enabled kernel"
		./output/host/usr/bin/mkknlimg $TARGETDIR/zImage $TARGETDIR/zImage-DT
	else
		echo "ERROR: zImage not found!"
		exit
	fi
fi

# DONE
echo "DONE."
