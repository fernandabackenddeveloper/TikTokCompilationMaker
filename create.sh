ffmpeg -f concat -safe 0 -i videolist.txt -vf "pad=width=1024:height=1024:x=224:y=0:color=black" -c:a pcm_s24le comp.mkv

convert -size 1024x1024 xc:#FF00FF transparent.png

convert transparent.png \
   224x1024_LEFT.png -gravity west -composite \
   224x1024_RIGHT.png -gravity west -geometry +800+0 -composite \
   semifinal.png

convert semifinal.png -transparent '#FF00FF' border.png
rm semifinal.png
rm transparent.png

ffmpeg -i comp.mkv -i border.png \
-filter_complex "[0:v][1:v] overlay=0:0" \
-pix_fmt yuv420p \
output.mp4