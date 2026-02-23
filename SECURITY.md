# Security Checklist

## Abans de fer `git add .`

- Comprova que no hi ha fitxers de secrets locals (`.env`, claus, credencials).
- Evita pujar backups, dumps o arxius temporals.
- Mantén secrets només fora del repo (`~/.openclaw/secrets`).

## Abans de fer `git commit`

- Executa: `git diff --cached`
- Verifica que no hi ha tokens, claus privades ni contrasenyes.
- Confirma que només hi ha placeholders o exemples.

## Abans de fer `git push`

- Executa: `git status`
- Revisa els fitxers nous amb atenció.
- Si hi ha un dubte, no facis push fins validar-ho.

## Configuració recomanada

Activa el hook local:

```bash
./scripts/install-precommit.sh
```

Després comprova:

```bash
git config --get core.hooksPath
```
