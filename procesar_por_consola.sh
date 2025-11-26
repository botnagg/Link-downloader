#!/usr/bin/env bash

# --- CONFIG ---
# Carpeta de descargas
DOWNLOAD_DIR="/mnt/c/Users/Nagore/Desktop/link_downloader/descargas"
mkdir -p "$DOWNLOAD_DIR"

# --- INPUT DEL LINK ---
read -p "Introduce la URL a descargar: " LINK

# --- DESCARGA ---
echo "Descargando: $LINK"

# yt-dlp con extracción de audio y conversión a mp3
yt-dlp -x --audio-format mp3 "$LINK" -o "$DOWNLOAD_DIR/%(title)s.%(ext)s"

# --- FIN ---
echo "Descarga completada. Archivo guardado en $DOWNLOAD_DIR"
