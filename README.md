# Trainingsplan – Gotthard 2026

Webapp für den 20-Wochen Trainingsplan Oberrieden → Gotthard.

## Voraussetzungen

- Podman installiert (`brew install podman` auf Mac oder `apt install podman` auf Linux)

## Starten

```bash
# 1. Image bauen
podman build -t trainingsplan .

# 2. Container starten
podman run -d --name trainingsplan -p 8080:80 trainingsplan

# 3. Browser öffnen
open http://localhost:8080
```

## Stoppen / Neu starten

```bash
# Stoppen
podman stop trainingsplan

# Wieder starten
podman start trainingsplan

# Neu bauen nach Änderungen
podman stop trainingsplan
podman rm trainingsplan
podman build -t trainingsplan .
podman run -d --name trainingsplan -p 8080:80 trainingsplan
```

## Struktur

```
trainingsplan-app/
├── Containerfile       ← Podman Build-Datei
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

Nach Änderungen Container neu bauen (siehe oben).
