# Setup Guide

## Guia d'instal·lació i configuració del meu entorn OpenClaw

_Aquest document descriu com tinc muntat el meu entorn OpenClaw, per poder replicar-ho en altres màquines o restaurar-ho si cal._

---

## 1. Entorn i infraestructura

### Hardware / Hosting

- **On corre**: [Per definir: VPS, màquina local, Docker...]
- **Sistema operatiu**: [Per definir: Ubuntu 24.04, macOS, etc.]
- **Memòria / CPU**: [Per definir]

### Xarxa i accessos

- **Ports oberts**: [Per definir: 3000, 8080...]
- **Domini / IP**: [Per definir]
- **SSL / Certificats**: [Per definir]

---

## 2. Instal·lació d'OpenClaw

### Prerequisites

```bash
# Node.js (v20+)
# Docker (opcional)
# Git
```

### Passos d'instal·lació

```bash
# Clonar el repo oficial
git clone https://github.com/openclaw/openclaw.git
cd openclaw

# Instal·lar dependències
npm install

# Configurar secrets
cp .env.example .env
# Editar .env amb les claus reals

# Arrancar
npm run dev
```

---

## 3. Configuració personalitzada

### Fitxers de configuració

- **`~/.openclaw/openclaw.json`**: Configuració principal (workspace, skills, etc.)
- **`~/.openclaw/secrets`**: Secrets (API keys, tokens, etc.)
- **`~/.openclaw/workspace/`**: Workspace personalitzat (aquest repo!)

### Exemple de `openclaw.json`

```json
{
  "workspace": "~/.openclaw/workspace",
  "skills": [
    "ong-admin",
    "project-mgmt",
    "aeat-tools"
  ],
  "integrations": {
    "firebase": true,
    "google-drive": true
  }
}
```

---

## 4. Skills personalitzats

### On viuen els skills

- **Skills oficials**: ClawHub Marketplace
- **Skills propis**: `~/.openclaw/workspace/skills/`

### Com afegir un skill propi

```bash
cd ~/.openclaw/workspace/skills
mkdir nou-skill
cd nou-skill
npm init -y
# Crear skill segons la doc oficial
```

---

## 5. Integracions

### Firebase

- **Project ID**: [Per definir]
- **Service Account**: `~/.openclaw/secrets/firebase-service-account.json`

### Google Drive

- **OAuth credentials**: `~/.openclaw/secrets/google-oauth.json`

### AEAT (Agència Tributària)

- **Certificat digital**: [Per definir]
- **Configuració**: [Per definir]

---

## 6. Backup i restauració

### Què cal fer backup

- `~/.openclaw/openclaw.json`
- `~/.openclaw/secrets/` (MOLT IMPORTANT: mai pujar a GitHub!)
- `~/.openclaw/workspace/` (aquest repo)

### Com restaurar

```bash
# Clonar aquest repo
git clone https://github.com/raulvico1975/openclaw-raul-lab.git ~/.openclaw/workspace

# Restaurar secrets des de backup local
cp -r /backup/openclaw/secrets ~/.openclaw/

# Restaurar configuració
cp /backup/openclaw/openclaw.json ~/.openclaw/

# Reinstal·lar OpenClaw i arrencar
cd ~/openclaw
npm install
npm run dev
```

---

## 7. Monitoratge i logs

### On trobar els logs

- **Logs d'OpenClaw**: `~/.openclaw/logs/`
- **Logs del sistema**: `/var/log/`

### Com monitorar

```bash
# Veure logs en temps real
tail -f ~/.openclaw/logs/openclaw.log

# Cercar errors
grep ERROR ~/.openclaw/logs/openclaw.log
```

---

## 8. Troubleshooting

### Problema: OpenClaw no arrenca

- Comprovar que Node.js és v20+
- Comprovar que `.env` té totes les variables
- Comprovar logs: `~/.openclaw/logs/openclaw.log`

### Problema: Skills no carreguen

- Comprovar que estan a `~/.openclaw/workspace/skills/`
- Comprovar que `openclaw.json` els té llistats
- Reinstal·lar dependències: `npm install` dins del skill

---

## 9. Recursos

- [OpenClaw Docs - Setup](https://docs.openclaw.ai/setup)
- [OpenClaw GitHub](https://github.com/openclaw/openclaw)
- [ClawHub Marketplace](https://clawhub.io/)

---

_Última actualització: 2026-02-19_
