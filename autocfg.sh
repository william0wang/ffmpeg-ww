# !/bin/sh
_target=no
test "$1" && _target="$1"

_config="configure \
  --enable-gpl \
  --enable-nonfree \
  --enable-libtheora \
  --enable-version3 \
  --enable-shared \
  --enable-postproc \
  --enable-pthreads \
  --enable-memalign-hack \
  --enable-libopencore-amrnb \
  --enable-libopencore-amrwb \
  --enable-runtime-cpudetect \
  --disable-doc \
  --disable-static \
  --disable-devices \
  --disable-avdevice \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-w32threads \
  --extra-libs="-Wl,--enable-auto-import" "

_config_lite="\
  --disable-ffmpeg \
  --disable-muxers \
  --disable-encoders \
  --enable-encoder=mpeg1video \
  --enable-encoder=huffyuv \
  --enable-encoder=png \
  --enable-encoder=rawvideo \
  --enable-encoder=snow \
  --enable-encoder=zlib \
  --enable-encoder=zmbv \
  --enable-muxer=rawvideo \
  --enable-muxer=wav \
  --prefix=/usr/local/ffmpeg-ww "

if test $_target = full ; then
    _config+=" --enable-libvpx --enable-libfaac --enable-libmp3lame --enable-libaacplus --extra-cflags=-I/usr/local/x264/include --extra-ldflags=-L/usr/local/x264/lib --prefix=/usr/local/ffmpeg-ww-full "
else
    _config+=$_config_lite
fi

./$_config

