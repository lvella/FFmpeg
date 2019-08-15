echo "Configure for Pi2/3"

RPI_TOOLROOT=/home/dom/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf
RPI_OPT_VC=/opt/bcm-rootfs/opt/vc

RPI_INCLUDES="-I$RPI_OPT_VC/include -I$RPI_OPT_VC/include/interface/vcos/pthreads -I$RPI_OPT_VC/include/interface/vmcs_host/linux"
RPI_DEFS="-D__VCCOREVER__=0x04000000 -DRPI_DISPLAY=1"
RPI_LIBDIRS="-L$RPI_TOOLROOT/lib -L$RPI_OPT_VC/lib"
#RPI_KEEPS="-save-temps=obj"
RPI_KEEPS=""

./configure --enable-cross-compile\
 --arch=armv6t2\
 --cpu=cortex-a7\
 --target-os=linux\
 --disable-stripping\
 --disable-thumb\
 --enable-mmal\
 --enable-rpi\
 --extra-cflags="-g $RPI_KEEPS $RPI_DEFS $RPI_INCLUDES"\
 --extra-cxxflags="$RPI_DEFS $RPI_INCLUDES"\
 --extra-ldflags="$RPI_LIBDIRS -Wl,-rpath=/opt/vc/lib,-rpath-link=$RPI_OPT_VC/lib,-rpath=/lib,-rpath=/usr/lib,-rpath-link=$RPI_TOOLROOT/lib,-rpath-link=$RPI_TOOLROOT/lib"\
 --extra-libs="-Wl,--start-group -lbcm_host -lmmal -lmmal_util -lmmal_core -lvcos -lvcsm -lvchostif -lvchiq_arm"\
 --cross-prefix=$RPI_TOOLROOT/bin/arm-linux-gnueabihf- \
 --prefix=$HOME/buster/home/pi/projects/fpga \
 --extra-libs="-ldl"

# --disable-decoders --enable-decoder=hevc --disable-hwaccels --enable-hwaccel=hevc_rpi --disable-encoders --enable-encoder=rawvideo --enable-muxer=rawvideo \
# --enable-extra-warnings\
# --arch=armv71\
# --enable-shared\

# gcc option for getting asm listing
# -Wa,-ahls
