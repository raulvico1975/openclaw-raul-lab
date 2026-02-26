# openclaw-raul-lab

Laboratori personal d'OpenClaw per documentar setup, seguretat local i practica operativa.

## Estat real del repo (2026-02-24)

Aquest repositori es centrat en documentacio base i hardening de commits.

Contingut actual:
- `README.md`
- `SECURITY.md`
- `docs/setup-guide.md`
- `skills/README.md`
- `workflows/README.md`
- `.githooks/pre-commit`
- `scripts/install-precommit.sh`

No hi ha encara skills implementats ni workflows de negoci versionats en aquest repo.

## Darrers commits rellevants

- `b20d993` - blindatge anti-secrets (`.githooks`, `.gitignore`, `SECURITY.md`)
- `d91085a` - documentacio base de workflows
- `de761ff` - documentacio base de skills
- `0ede015` - setup guide inicial

## Objectiu del repo

1. Tenir una base de documentacio clara i actualitzable.
2. Evitar fuites de secrets en commits.
3. Preparar l'espai per afegir skills/workflows reals amb control de versions.

## Us rapid

### 1) Clonar

```bash
git clone https://github.com/raulvico1975/openclaw-raul-lab.git
cd openclaw-raul-lab
```

### 2) Activar proteccio anti-secrets

```bash
./scripts/install-precommit.sh
```

Validacio:

```bash
git config --get core.hooksPath
```

Ha de retornar `.githooks`.

### 3) Revisar doc operativa

- `docs/setup-guide.md` per l'operativa d'aquest laboratori
- `SECURITY.md` per la check-list abans de `git add/commit/push`

## Seguretat

Aquest repo no ha de contenir mai:
- tokens
- claus privades
- credencials
- dumps o backups amb dades sensibles

El pre-commit bloqueja patrons habituals de secrets, pero no substitueix revisio manual.
