# ok
gst-launch-1.0 \
v4l2src device="/dev/video0" ! \
"video/x-raw, width=640, height=480, format=(string)YUY2" ! \
xvimagesink -e

# ok
gst-launch-1.0 \
v4l2src device="/dev/video0" ! \
"video/x-raw, width=640, height=480" ! \
videoconvert ! \
"video/x-raw, format=(string)NV12"! \
nv3dsink -e

#ok
gst-launch-1.0 -e \
v4l2src device="/dev/video0" ! \
"video/x-raw, width=(int)640, height=(int)480" ! \
videoconvert ! \
"video/x-raw, format=(string)NV12" ! \
nvvidconv ! \
"video/x-raw(memory:NVMM), format=(string)NV12, width=(int)640, height=(int)480" ! \
nv3dsink

#ok
gst-launch-1.0 -e \
v4l2src device="/dev/video0" ! \
"video/x-raw, width=(int)640, height=(int)480" ! \
videoconvert ! \
"video/x-raw, format=(string)NV12" ! \
nvvidconv ! \
"video/x-raw(memory:NVMM), format=(string)NV12, width=(int)640, height=(int)480" ! \
nvvidconv ! \
"video/x-raw, format=(string)RGBA" ! \
nv3dsink

#ok
gst-launch-1.0 -e \
v4l2src device="/dev/video0" ! \
"video/x-raw, width=(int)640, height=(int)480" ! \
videoconvert ! \
"video/x-raw, format=(string)NV12" ! \
nvvidconv ! \
"video/x-raw(memory:NVMM), format=(string)NV12, width=(int)640, height=(int)480" ! \
nvvidconv ! \
"video/x-raw, format=RGBA" ! \
videoconvert !\
"video/x-raw, format=(string)BGR" ! \
nv3dsink



gst-launch-1.0 -e \
v4l2src device="/dev/video0" ! \
"video/x-raw, width=(int)640, height=(int)480" ! \
videoconvert ! \
"video/x-raw, format=(string)NV12" ! \
nvvidconv interpolation-method=Bilinear flip-method=horizontal-flip ! \
"video/x-raw(memory:NVMM), format=(string)RGBA, width=(int)1280, height=(int)960" ! \
nv3dsink


gst-launch-1.0 -ev \
v4l2src device=/dev/video0 ! \
video/x-raw,width=1280,height=720,format=YUY2,framerate=30/1 ! \
nvvidconv ! \
'video/x-raw(memory:NVMM)' ! \
nvvidconv ! \
video/x-raw,format=BGRx ! \
videoconvert ! \
'video/x-raw, format=(string)BGR' !\
nv3dsink
