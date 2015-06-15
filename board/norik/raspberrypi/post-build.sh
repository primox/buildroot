TARGETDIR=$1

# remove default cmdline
if [ -f $TARGETDIR/rpi-firmware/cmdline.txt ] ; then
	rm -f $TARGETDIR/rpi-firmware/cmdline.txt
fi

# DONE
echo "DONE."
