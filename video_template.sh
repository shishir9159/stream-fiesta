#!/bin/bash

# Requires 'mediainfo' in path

# COVER IMAGE

LARGEST_VIDEO_FILE=$(find . -type f -name "*.mp4" -o -name "*.mkv"  -o -name "*.webm" | sort -nr | head -1)

mediainfo --Output="${LARGEST_VIDEO_FILE}" --Output='General;%Duration%' "$FILE"

# IMDB Metadata

#     mediainfo] Paste Raw MediaInfo Here [/mediainfo]
#⪧ To insert an Image - [img] http://abcd.com/image.jpg [/img]
#⪧ To insert a Link/URL - [url] http://abcd.com [/url]
#⪧ To change Font - [font=Tahoma] Text Goes Here [/font]
#⪧ To write text in Large Fonts - [size=5] Text goes here [/size]
#⪧ To write Colored Text - [color=red] Text Goes Here [/color]
#⪧ To use Multiple BBCode - [color=red][size=4][font=Tahoma][b] Text Goes Here [/b][/font][/size][/color]

 #[url=https://ibb.co/KxxzLjx][img]https://i.ibb.co/KxxzLjx/Intermediate.png[/img][/url]


 #Media Info:
 #
 #[mediainfo]Video
 #ID: 1
 #Format: AVC
 #Format/Info: Advanced Video Codec
 #Format profile                           : Main@L3.1
 #Format settings                          : CABAC / 4 Ref Frames
 #Format settings, CABAC                   : Yes
 #Format settings, Reference frames        : 4 frames
 #Codec ID                                 : avc1
 #Bit rate                                 : 1 413 kb/s
 #Nominal bit rate                         : 3 000 kb/s
 #Width                                    : 1 280 pixels
 #Height                                   : 720 pixels
 #Display aspect ratio                     : 16:9
 #Frame rate mode                          : Constant
 #Frame rate                               : 30.000 FPS
 #Color space                              : YUV
 #Chroma subsampling                       : 4:2:0
 #Bit depth                                : 8 bits
 #Scan type                                : Progressive
 #Bits/(Pixel*Frame)                       : 0.051webhook tls error on k8
 #Writing library                          : x264 core 148



 #Audio
 #ID                                       : 2
 #Format                                   : AAC LC
 #Format/Info                              : Advanced Audio Codec Low Complexity
 #Codec ID                                 : mp4a-40-2
 #Duration                                 : 14 min 8 s
 #Bit rate mode                            : Constant
 #Bit rate                                 : 128 kb/s
 #Channel(s)                               : 2 channels
 #Channel layout                           : L R
 #Sampling rate                            : 48.0 kHz
 #Frame rate                               : 46.875 FPS (1024 SPF)
 #Compression mode                         : Lossy
 #Stream size                              : 12.9 MiB (8%)
 #Default                                  : Yes
 #Alternate group                          : 1
 #[/mediainfo]