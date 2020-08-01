# Multi-spectral-face-videos-recorder-with-UI: 
Thermal and Visible video recorder software and player, designed to work with up to 3 cameras - Long Wave Infra Red, Near Infra Red and RGB - visible spectrum camera while playing emotions stimulating videos on another screen.

Written for a combined research of the psychology and the electrical engineering department, Ben Gurion Univesity of the Negev, Israel.

Run main.mlapp to start the program, screen shot available here:
https://github.com/CallShaul/Experiment-control-panel-real-time-LWIR-NIR-RGB-video-recorder-with-external-monitor-video-player/blob/master/Control%20panel%20img.PNG

# Video analyzer for physiological signals extraction:
Can be used for the extraction of various physiological signals such as heart rate, heart rate variability, respiratory rate Hemoglobine concentration and more,
Run analyze.m to start.

# RGB - Visible spectrum camera:
I recommend using mirrorless camera such as Sony alpha 6000, with USB-HDMI capture card:
It is best to record the face video's with F/# value not too low! (about 2.2 - 2.8 should be ok) so the whole face will be kept in focus during the recording. It is also reccomended to use as low ISO value as possible, to reduce sensor noise - so good lightning is required for that. it is also recommended to cool the USB-HDMI capture card with active or passive heat sink in case of a long recording duration.

It is also possible to use DSLR or ELP USB camera, with manual optical zoom and focus, based on the sensor: Sony IMX179, link for the camera:
https://www.amazon.com/gp/product/B07R4CLRQH/ref=ppx_yo_dt_b_asin_title_o02_s00?ie=UTF8&psc=1

# Near Infra Red (NIR) camera:
It is possible to convert most of DSL or mirrorless cameras and remove the IR filter, it can be done at home or professionally for example:
https://www.infraredcameraconversions.co.uk/cameras/4593518192

For active NIR camera I recommend using the 2 MP CMOS OV2710 based camera, with 10 850 nm LEDs:
https://www.amazon.com/gp/product/B07PPN7TXQ/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1


# Long Wave Infra Red (LWIR) camera:
The video recorder fits OPTRIS IR camera's and specifically PI450 model with NETD of 40 mK, and it can be easily modified to work with other IR cameras brands such as the FLIR.
PI450 LWIR camera 7.5-14 um: https://www.optris.global/thermal-imager-optris-pi-400i-pi-450i

# Remarks:

Requirements:

- Image processing toolbox is required.
- “MATLAB Support Package for USB Webcams” and “MATLAB Support for MinGW-w64 C/C++ Compiler” add-ons are required.
- VLC player is required in order to use the "play videos" functions (For Windows 10, 64 bit: https://download.cnet.com/VLC-Media-Player-64-bit/3000-13632_4-75761094.html).

In addition:

- Data analyzer folder includes: Low pass, High pass, Band pass filters and signal plots, Fast Fourier transform, Short time furrier transform, Continues wavelet transform, Save cache data, Play videos slow / fast / frames difference and more.

- Code written in MATLAB 2020a by Shaul Shvimmer, Electro-Optical engineering M.Sc student. saulsh@post.bgu.ac.il
# This code was written for reaserch purposes, if this work assists you please cite.
