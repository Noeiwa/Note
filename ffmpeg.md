`./configure --enable-gpl --enable-postproc --enable-swscale --enable-pthreads --enable-libdc1394 --enable-libx264 --enable-nonfree`  
`make -j4`  
`make install`  
`ffmpeg -i source.wmv/avi -crf 18 output.mp4` 
