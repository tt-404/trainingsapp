# Trainingsplan – Gotthard 2026

Webapp für den 20-Wochen Trainingsplan Oberrieden → Gotthard.

## Deployment (Raspberry Pi)

Jeder Push auf `main` deployt automatisch via GitHub Actions (self-hosted Runner).

```bash
# Manuell neu bauen und starten
podman compose up --build -d

# Logs anzeigen
podman compose logs -f

# Stoppen
podman compose down
```

## Lokale Entwicklung

```bash
# Image bauen
podman build -t trainingsplan .

# Container starten
podman run -d --name trainingsplan -p 8080:80 trainingsplan

# Browser öffnen
open http://localhost:8080

# Stoppen
podman stop trainingsplan && podman rm trainingsplan
```

## Struktur

```
trainingsapp/
├── Containerfile       ← Podman Build-Datei (Nginx Alpine)
├── docker-compose.yml  ← Compose-Konfiguration (Port 8080)
├── README.md           ← Diese Datei
└── app/
    └── index.html      ← Komplette Webapp (single file)
```

## Aktivitäten aktualisieren

Öffne `app/index.html` und suche nach `const activities = [`.
Dort kannst du neue Trainings nach diesem Schema hinzufügen:

```javascript
{ date:'17. Mai', name:'Buchenegg + Hütten', km:75, hm:1000, 
  hr_avg:138, hr_max:168, z2:48, z3:35, z4:15, 
  note:'Erste 1000-Hm-Runde!' },
```

Nach Änderungen einfach pushen — der Pi deployt automatisch.
