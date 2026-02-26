# Setup Guide - openclaw-raul-lab

Data: 2026-02-24

## 1) Que es aquest setup

Aquest repo no desplega OpenClaw per si sol.

Es un repositori de suport per:
- documentacio del laboratori
- bones practiques de seguretat en Git
- base per afegir skills/workflows en futures iteracions

## 2) Prerequisits locals

- `git`
- `rg` (recomanat per revisions rapides)
- shell tipus `zsh` o `bash`

## 3) Instal.lacio local

```bash
git clone https://github.com/raulvico1975/openclaw-raul-lab.git
cd openclaw-raul-lab
./scripts/install-precommit.sh
```

Comprovacio:

```bash
git config --get core.hooksPath
```

Esperat: `.githooks`

## 4) Que protegeix el pre-commit

Hook: `.githooks/pre-commit`

Bloqueja patrons comuns de secrets en el `git diff --cached`:
- AWS keys (`AKIA...`)
- tokens tipus GitHub/Slack
- claus privades PEM
- URIs amb credencials embegudes

## 5) Flux de treball recomanat

1. Editar docs/fitxers.
2. Revisar canvis: `git diff`.
3. Afegir selectivament: `git add <fitxer>`.
4. Revisar staged: `git diff --cached`.
5. Commit.

## 6) Relacio amb l'entorn productiu

La documentacio operativa de produccio d'aquest projecte viu fora d'aquest repo, al directori:
- `/Users/raulvico/Documents/clawbot-auto/`

Fitxers de referencia:
- `/Users/raulvico/Documents/clawbot-auto/DOCUMENTACIO_INFRA_ARQUITECTURA_ACTUAL.md`
- `/Users/raulvico/Documents/clawbot-auto/RUNBOOK_ACCESS_SERVIDOR.md`

## 7) Scope actual

Encara no hi ha:
- skills funcionals a `skills/*`
- workflows definits a `workflows/*`

Quan s'afegeixin, actualitza `skills/README.md` i `workflows/README.md` al mateix commit.
