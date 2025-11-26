#!/usr/bin/env bash

# --- CONFIG ---
# Archivo .txt con links (uno por línea)
LINKS_FILE="/mnt/c/Users/Nagore/Desktop/link_downloader/links_yt.txt"

# Carpeta de descargas
DOWNLOAD_DIR="/mnt/c/Users/Nagore/Desktop/link_downloader/descargas"
mkdir -p "$DOWNLOAD_DIR"

# --- LEER LINKS ---
if [[ ! -f "$LINKS_FILE" ]]; then
    echo "Archivo $LINKS_FILE no encontrado!"
    exit 1
fi

TOTAL=$(wc -l < "$LINKS_FILE")
echo "Hemos detectado $TOTAL link(s) en el archivo."

# --- DESCARGA ---
count=0
while IFS= read -r LINK || [[ -n "$LINK" ]]; do
    count=$((count + 1))
    echo ""
    echo "Descargando $count/$TOTAL: $LINK"

    # yt-dlp: extrae audio y convierte a mp3
    yt-dlp -x --audio-format mp3 "$LINK" -o "$DOWNLOAD_DIR/%(title)s.%(ext)s"

    if [[ $? -eq 0 ]]; then
        echo "✅ Descarga completada."
    else
        echo "❌ Error en la descarga."
    fi

done < "$LINKS_FILE"

echo ""
echo "Todas las descargas finalizadas. Pulsa ENTER para salir."
read
