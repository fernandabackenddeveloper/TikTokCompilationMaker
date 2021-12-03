cd videos
i=0
for fi in *.mp4; do
    ffmpeg -i "$fi" -filter:v "scale=576:1024:force_original_aspect_ratio=decrease,pad=576:1024:-1:-1:color=black" -c:a pcm_s24le ../streams/$i.mkv
    i=$((i+1))
done

cd ..
mkdir streams
cd streams
rm ../videolist.txt
for fi in *.mkv; do
    echo "file streams/$fi" >> ../videolist.txt
done
