#!/usr/bin/env bash
#
# Lädt die 5 Bilder für die Präsentation "Jesus in Serbien" von
# Wikimedia Commons in den Ordner ./assets herunter.
#
# Verwendung (im Terminal, im Projektordner):
#   bash download-images.sh
#
# Voraussetzung: curl (auf macOS und den meisten Linux-Systemen vorinstalliert)

set -euo pipefail

# In den Ordner wechseln, in dem dieses Skript liegt
cd "$(dirname "$0")"
mkdir -p assets

UA="jesus-in-serbien-presentation/1.0 (educational use)"
BASE="https://commons.wikimedia.org/wiki/Special:FilePath"

# Format:  Zieldateiname|Wikimedia-Dateiname|Breite
images=(
  "01-weisser-engel.jpg|Beli andjeo2.jpg|1200"
  "02-kreuzigung-decani.jpg|Crucifixion of Christ - Visoki Dečani Monastery.jpg|1200"
  "03-pantokrator-hilandar.jpg|Christus Pantokrator 13 Jh. Hilandar.jpg|1000"
  "04-tempel-aussen.jpg|Cathedral of Saint Sava, Belgrade.jpg|1600"
  "05-tempel-innen.jpg|Interior Cathedral of Saint Sava, Belgrade.jpg|1600"
)

# URL-Encoding einer Zeichenkette (Leerzeichen, Komma, Sonderzeichen)
urlencode() {
  local s="$1" out="" c
  for (( i=0; i<${#s}; i++ )); do
    c="${s:$i:1}"
    case "$c" in
      [a-zA-Z0-9.~_-]) out+="$c" ;;
      *) out+=$(printf '%%%02X' "'$c") ;;
    esac
  done
  printf '%s' "$out"
}

echo "Lade 5 Bilder nach ./assets ..."
echo

ok=0
for entry in "${images[@]}"; do
  IFS='|' read -r target file width <<< "$entry"
  enc=$(urlencode "$file")
  url="${BASE}/${enc}?width=${width}"
  printf '  → %s ... ' "$target"
  if curl -fsSL -A "$UA" "$url" -o "assets/${target}"; then
    echo "ok"
    ok=$((ok+1))
  else
    echo "FEHLER (übersprungen)"
  fi
done

echo
echo "Fertig: ${ok}/5 Bilder heruntergeladen."
if [ "$ok" -lt 5 ]; then
  echo "Hinweis: Fehlende Bilder zeigen automatisch ein goldenes Ersatz-Motiv."
fi
