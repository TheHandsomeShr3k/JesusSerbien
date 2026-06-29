# Laedt die 5 Bilder fuer die Praesentation "Jesus in Serbien" von
# Wikimedia Commons in den Ordner .\assets herunter.
#
# Verwendung (Rechtsklick auf die Datei -> "Mit PowerShell ausfuehren"),
# oder im PowerShell-Fenster im Projektordner:
#   powershell -ExecutionPolicy Bypass -File .\download-images.ps1

$ErrorActionPreference = "Stop"

# In den Ordner wechseln, in dem dieses Skript liegt
Set-Location -Path $PSScriptRoot
New-Item -ItemType Directory -Force -Path "assets" | Out-Null

$base = "https://commons.wikimedia.org/wiki/Special:FilePath"
$ua   = "jesus-in-serbien-presentation/1.0 (educational use)"

# Zieldateiname, Wikimedia-Dateiname, Breite
$images = @(
  @{ target = "01-weisser-engel.jpg";        file = "Beli andjeo2.jpg";                                          width = 1200 },
  @{ target = "02-kreuzigung-decani.jpg";     file = "Crucifixion of Christ - Visoki Dečani Monastery.jpg";       width = 1200 },
  @{ target = "03-pantokrator-hilandar.jpg";  file = "Christus Pantokrator 13 Jh. Hilandar.jpg";                  width = 1000 },
  @{ target = "04-tempel-aussen.jpg";         file = "Cathedral of Saint Sava, Belgrade.jpg";                     width = 1600 },
  @{ target = "05-tempel-innen.jpg";          file = "Interior Cathedral of Saint Sava, Belgrade.jpg";            width = 1600 }
)

Write-Host "Lade 5 Bilder nach .\assets ..."
Write-Host ""

$ok = 0
foreach ($img in $images) {
  $enc = [uri]::EscapeDataString($img.file)
  $url = "$base/$enc`?width=$($img.width)"
  $out = Join-Path "assets" $img.target
  Write-Host -NoNewline ("  -> {0} ... " -f $img.target)
  try {
    Invoke-WebRequest -Uri $url -OutFile $out -UserAgent $ua -UseBasicParsing
    Write-Host "ok"
    $ok++
  } catch {
    Write-Host "FEHLER (uebersprungen)"
  }
}

Write-Host ""
Write-Host ("Fertig: {0}/5 Bilder heruntergeladen." -f $ok)
if ($ok -lt 5) {
  Write-Host "Hinweis: Fehlende Bilder zeigen automatisch ein goldenes Ersatz-Motiv."
}
