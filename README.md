# openclaw-raul-lab

**Laboratori personal d'OpenClaw**: configuració, skills, workflows, documentació i experiments.

## Què és això?

Aquest repositori és el meu **espai personal de treball amb [OpenClaw](https://openclaw.ai/)**, un framework d'agents autònoms per muntar AI assistants auto-hostejats, multi-canal i extensibles.

Aquí documento:

- **Configuració del meu setup** (VPS, secrets, integracions)
- **Skills** personalitzats per al meu context (ONG, projectes internacionals, administració)
- **Workflows i tasques** automatitzades o semi-automatitzades
- **Experiments i proves** (patrons de prompts, integracions amb APIs, etc.)
- **Documentació i notes** sobre com uso OpenClaw en el meu dia a dia

Els objectius són:

1. **Mantenir la configuració sota control de versions**: no perdre mai el treball fet
2. **Documentar patterns i bones pràctiques** per recordar-los més endavant
3. **Tenir un repo de referència** per replicar la configuració en altres entorns
4. **Compartir coneixement** amb la comunitat d'OpenClaw

---

## 📁 Estructura del repo

```
openclaw-raul-lab/
├── README.md              # Aquest fitxer
├── docs/                  # Documentació detallada
│   ├── setup-guide.md     # Guia d'instal·lació i configuració del meu entorn
│   ├── use-cases.md       # Casos d'ús i exemples reals
│   ├── patterns.md        # Patrons de prompts, bones pràctiques
│   └── infra.md           # Infraestructura: VPS, ports, secrets, etc.
├── skills/                # Skills personalitzats
│   ├── ong-admin/         # Eines per administració d'ONG
│   ├── project-mgmt/      # Gestió de projectes de cooperació
│   └── aeat-tools/        # Eines per fiscalitat espanyola
├── workflows/             # Workflows i automatitzacions
│   ├── daily-tasks.md     # Tasques diàries automatitzades
│   └── project-setup.md   # Setup inicial de projectes nous
├── experiments/           # Proves i experiments
│   ├── prompts/           # Proves de prompts
│   └── integrations/      # Integracions amb APIs externes
└── config/                # Configuracions de referència (sense secrets!)
    ├── openclaw.json      # Exemple de configuració
    └── .env.example       # Variables d'entorn (exemple)
```

---

## ⚙️ Tecnologies i eines

- **OpenClaw**: Framework d'agents ([openclaw/openclaw](https://github.com/openclaw/openclaw))
- **Entorn**: VPS auto-hostejat, Docker (opcional)
- **Skills**: Skills propis + ClawHub Marketplace
- **Llenguatges**: TypeScript, Python (segons skill)
- **Integracions**: Firebase, Google Drive, AEAT, APIs d'ONG, etc.

---

## 🚀 Com usar aquest repo

### 1. Clonar el repo

```bash
git clone https://github.com/raulvico1975/openclaw-raul-lab.git
cd openclaw-raul-lab
```

### 2. Llegir la documentació

Comença per:

- [`docs/setup-guide.md`](docs/setup-guide.md) per veure com munto el meu entorn
- [`docs/use-cases.md`](docs/use-cases.md) per exemples d'ús reals
- [`docs/patterns.md`](docs/patterns.md) per patrons de prompts i bones pràctiques

### 3. Activar protecció anti-secrets

```bash
./scripts/install-precommit.sh
```

També tens una checklist ràpida a [`SECURITY.md`](SECURITY.md).

### 4. Adaptar-ho al teu entorn

Aquest repo és **altament personal**: les configuracions, skills i workflows estan pensats per al meu context (ONG, cooperació internacional, administració).

Si vols reutilitzar-ho:

- Adapta `config/openclaw.json` i `config/.env.example` al teu cas
- Revisa els skills a `skills/` i modifica'ls segons les teves necessitats
- Llegeix els workflows a `workflows/` i ajusta'ls

---

## 📚 Recursos i referències

### Oficial OpenClaw

- [OpenClaw Docs](https://docs.openclaw.ai/)
- [Repo openclaw/openclaw](https://github.com/openclaw/openclaw)
- [ClawHub Marketplace](https://clawhub.io/)

### Comunitat i exemples

- [amanaiproduct/openclaw-setup](https://github.com/amanaiproduct/openclaw-setup) – Hardened setup prompt per macOS
- [HarleyCoops/CLAWDBOT](https://github.com/HarleyCoops/CLAWDBOT) – Documentació exhaustiva d'un projecte OpenClaw
- [Gist: OpenClaw Setup Guide (yalexx)](https://gist.github.com/) – Guia d'instal·lació completa

---

## 📌 Roadmap

- [x] Crear el repo i estructura inicial
- [ ] Documentar setup complet (`docs/setup-guide.md`)
- [ ] Afegir primer skill personalitzat (`skills/ong-admin/`)
- [ ] Documentar casos d'ús reals (`docs/use-cases.md`)
- [ ] Crear workflows per tasques diàries (`workflows/daily-tasks.md`)
- [ ] Experiments amb integracions API (`experiments/integrations/`)
- [ ] Afegir patrons de prompts (`docs/patterns.md`)

---

## 🔒 Notes de seguretat

⚠️ **IMPORTANT**: Aquest repo **NO** conté mai:

- Secrets, API keys, tokens
- Passwords o credencials
- Dades personals o sensibles d'ONG o projectes

Tots els fitxers de configuració són **exemples** (`.example`) o contenen placeholders. Els secrets reals viuen a `~/.openclaw/secrets` al meu VPS i **mai** es pugen a GitHub.

---

## 🌐 English summary

**openclaw-raul-lab** is my personal OpenClaw workspace, where I document:

- Setup & configuration (VPS, secrets, integrations)
- Custom skills for NGO administration & international cooperation
- Workflows & automation patterns
- Experiments with prompts & API integrations

This repo is highly personal and tailored to my context (international development, non-profit sector, Spanish fiscal compliance). Feel free to explore and adapt it to your own needs.

**Tech stack**: OpenClaw, TypeScript, Python, Firebase, Google Drive, Docker (optional).

**Resources**: [OpenClaw Docs](https://docs.openclaw.ai/) | [openclaw/openclaw](https://github.com/openclaw/openclaw) | [ClawHub](https://clawhub.io/)

---

## 💬 Contacte

Si tens preguntes o suggeriments sobre aquest repo, obre un issue o contacta'm via GitHub.

---

**Llicència**: MIT (veure [LICENSE](LICENSE))
