#!/usr/bin/env bash

# ------------ CONFIG ------------
# Reads the .txt line by line
LINKS_FILE="/link_downloader/links_spotify.txt"

# Folder to downloads
DOWNLOAD_DIR="/link_downloader/descargas"
mkdir -p "$DOWNLOAD_DIR"

# ------------ READ URLs ------------
if [[ ! -f "$LINKS_FILE" ]]; then
    echo "File $LINKS_FILE not found!"
    exit 1
fi

TOTAL=$(wc -l < "$LINKS_FILE")
echo "Total $TOTAL link(s) detected on the file."

# ------------ DOWNLOAD ------------
count=0
while IFS= read -r LINK || [[ -n "$LINK" ]]; do
    count=$((count + 1))
    echo ""
    echo "Downloading $count/$TOTAL: $LINK"

    # yt-dlp: extracting audio and converting to MP3
    spotdl download "$LINK" --output "$DOWNLOAD_DIR/%(title)s.%(ext)s"


    if [[ $? -eq 0 ]]; then
        echo "✅ Download complete."
    else
        echo "❌ Download error."
    fi

done < "$LINKS_FILE"

echo ""
echo "Download finalized. Press ENTER to exit."
read
