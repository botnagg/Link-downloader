# Link Downloader

A simple and flexible **Spotify and YouTube downloader** using shell scripts, designed to download audio files from links listed in a `.txt` file. This tool allows batch downloading, tracking progress, and ensures downloaded files are properly stored.

---

## Requirements

Before running the scripts, make sure the following tools are installed:

- [spotDL](https://spotdl.github.io/spotify-downloader/) – for Spotify link downloads  
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) – for YouTube downloads  
- `ffmpeg` – required by both spotDL and yt-dlp for audio conversion  
- bash (Linux/macOS) or WSL on Windows  

---

## Installation & Dependencies

1. Clone this repository:

```bash
git clone https://github.com/botnagg/Link-downloader.git
cd Link-downloader

2. Intall dependencies:
# Install yt-dlp
pip install -U yt-dlp

# Install spotDL
pip install -U spotdl

# Make sure ffmpeg is installed
# On Ubuntu/Debian:
sudo apt install ffmpeg

3. Prepare a .txt file with all the links you want to download. Example:
https://open.spotify.com/track/xxxx
https://youtu.be/yyyy

4. Run the scripts: 
- bash procesar_links_spotify.sh   # Spotify links
- bash procesar_links_yt.sh        # YouTube links
- bash procesar_por_consola.sh     # Mixed or console-driven

---

## Notes
- Ensure .txt files are properly formatted: no empty lines or Windows carriage returns (\r).
- Downloaded files are saved in the folder where the script is executed unless modified inside the script.
- Success/failure logging can be added to track progress more robustly.
- Playlists and multiple .txt files are supported with small adjustments.

--- 

## Tips
- Test with a few links before doing afull batch.
- Use a dedicated folder for downloads.
- Keep yt-dlp and spotDL updated to avoid errores.
- For large playlist, run scripts inside screen or tmux to prevent interruptions. 