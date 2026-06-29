# Jesus in Serbien — interaktive HTML-Präsentation

Eine in sich geschlossene, interaktive Präsentation über Jesus Christus in der
serbisch-orthodoxen Tradition (mittelalterliche Fresken, Klöster, Tempel des
Heiligen Sava). CSS, JavaScript und SVG sind direkt in `index.html` eingebettet.
Nur die fünf Fotos liegen separat im Ordner `assets/`.

---

## Schnellstart

1. **Bilder herunterladen** (einmalig). Wähle dein System:

   **macOS / Linux** — im Terminal, in diesem Ordner:
   ```bash
   bash download-images.sh
   ```

   **Windows** — im PowerShell-Fenster, in diesem Ordner:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\download-images.ps1
   ```

   Das Skript legt die fünf Bilder im Ordner `assets/` ab.

2. **Lokal ansehen:** `index.html` per Doppelklick im Browser öffnen.

3. **Auf GitHub Pages veröffentlichen** — siehe unten.

> Auch ohne Bilder läuft die Präsentation: Fehlt eine Datei, zeigt die Folie
> automatisch ein passendes goldenes Ersatz-Motiv (SVG-Fallback).

---

## Auf GitHub Pages veröffentlichen

1. Neues Repository auf GitHub anlegen (z. B. `jesus-in-serbien`).
2. **Den gesamten Inhalt dieses Ordners** hochladen — also `index.html` **und**
   den Ordner `assets/` mit den Bildern.

   Per Git-Befehl:
   ```bash
   git init
   git add .
   git commit -m "Präsentation Jesus in Serbien"
   git branch -M main
   git remote add origin https://github.com/DEIN-NAME/jesus-in-serbien.git
   git push -u origin main
   ```
3. Im Repository: **Settings → Pages**.
4. Unter **Build and deployment → Source** „Deploy from a branch" wählen,
   Branch `main`, Ordner `/ (root)`, dann **Save**.
5. Nach ein bis zwei Minuten ist die Seite erreichbar unter:
   ```
   https://DEIN-NAME.github.io/jesus-in-serbien/
   ```

Da die Datei `index.html` heißt, öffnet sich die Präsentation direkt unter
dieser Adresse — ohne den Dateinamen anhängen zu müssen.

---

## Steuerung der Präsentation

| Aktion | Tasten / Geste |
|---|---|
| Weiter / Zurück | Pfeiltasten, Leertaste, Bild ↑ / ↓, oder Wischen |
| Folienübersicht | Taste **G** (Escape schließt sie wieder) |
| Erste / letzte Folie | Pos1 / Ende |

Interaktiv sind außerdem: die anklickbare Zeitleiste, das Diagramm
„Eine Ikone lesen" (goldene Punkte), der Klostererkunder und das
Oster-Ruf-und-Antwort-Element.

---

## Die fünf Bilder (Quellen)

Alle von Wikimedia Commons. Falls du die Skripte nicht nutzen möchtest, kannst
du die Bilder manuell laden: Link öffnen, Bild speichern und **exakt unter dem
Zieldateinamen** im Ordner `assets/` ablegen.

| Zieldatei in `assets/` | Motiv | Quelle (Wikimedia Commons) |
|---|---|---|
| `01-weisser-engel.jpg` | Weißer Engel, Mileševa (um 1235) | File:Beli andjeo2.jpg |
| `02-kreuzigung-decani.jpg` | Kreuzigung Christi, Visoki Dečani (um 1350) | File:Crucifixion of Christ - Visoki Dečani Monastery.jpg |
| `03-pantokrator-hilandar.jpg` | Christus Pantokrator, Hilandar (13. Jh.) | File:Christus Pantokrator 13 Jh. Hilandar.jpg |
| `04-tempel-aussen.jpg` | Tempel des Heiligen Sava, Außenansicht | File:Cathedral of Saint Sava, Belgrade.jpg |
| `05-tempel-innen.jpg` | Tempel des Heiligen Sava, Mosaike innen | File:Interior Cathedral of Saint Sava, Belgrade.jpg |

Die Bilder stehen unter freien bzw. Creative-Commons-Lizenzen. Die genauen
Lizenz- und Urheberangaben findest du jeweils auf der Dateiseite bei Wikimedia
Commons; bei öffentlicher Nutzung bitte dort die Namensnennung prüfen.

---

## Ordnerstruktur

```
.
├── index.html              ← die Präsentation
├── assets/                 ← die fünf Bilder (per Skript befüllt)
├── download-images.sh      ← Bild-Download (macOS/Linux)
├── download-images.ps1     ← Bild-Download (Windows)
└── README.md               ← diese Datei
```
