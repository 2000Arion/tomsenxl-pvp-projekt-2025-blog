# Blog, News und Updates für das TomsenXL PVP Projekt 2025  

Dies ist die Open-Source-Website für [tomsenxl.mcevent.com.de](https://tomsenxl.mcevent.com.de). Diese Website steltl aktuelle **News, Ankündigungen und Updates** zum **TomsenXL PVP 2025** Projekt bereit.  

## 🚀 Setup & Entwicklung  

### Voraussetzungen  

- [Ruby](https://www.ruby-lang.org/) mit Bundler  
- [Jekyll](https://jekyllrb.com/)  
- Git  

### Installation  

1. Repository klonen:  

   ```sh
   git clone https://github.com/dein-repo/tomsenxl-pvp.git
   cd tomsenxl-pvp
   ```

2. Abhängigkeiten installieren:

   ```sh
   bundle install
   ```

3. Lokalen Server starten:  

   ```sh
   bundle exec jekyll serve
   ```

   Die Seite ist dann unter **http://localhost:4000** erreichbar.  

## 🛠 Deployment

Das Projekt nutzt [**Cloudflare Pages**](https://pages.cloudflare.com) für das Hosting. Änderungen werden automatisch deployed.  

Bei Bedarf kannst du auch manuell Builds erzeigen:  

### Windows (Powershell)

```sh
$env:JEKYLL_ENV="production"; bundle exec jekyll build
```

### Linux/macOS (Bash, zsh, etc.)

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

Der Output wird im `/_site` Verzeichnis ausgegeben.

## 📂 Struktur  

- `_posts/` – Blogartikel und News  
- `_config.yml` – Globale Konfiguration  
- `assets/` – Bilder, CSS, JS  
- `_data/` – Konfigurationsdaten  
- `_layouts/` – HTML-Templates  

## 📜 Lizenz

Dieses Projekt steht unter der **GNU General Public License v3.0**.
