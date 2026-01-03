#!/usr/bin/env bash

# ------------ CONFIG ------------
# Download folder
DOWNLOAD_DIR="/link_downloader/descargas"
mkdir -p "$DOWNLOAD_DIR"

# ------------ ENTER THE URL ------------
read -p "Enter the URL to download: " LINK

# ------------ DOWNLOAD ------------
echo "Downloading: $LINK"

# yt-dlp con extracción de audio y conversión a mp3
yt-dlp -x --audio-format mp3 "$LINK" -o "$DOWNLOAD_DIR/%(title)s.%(ext)s"

# ------------ FIN ------------
echo "Download complete. Downloaded in path: $DOWNLOAD_DIR"
