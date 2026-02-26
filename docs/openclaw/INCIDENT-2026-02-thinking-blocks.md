# INCIDENT-2026-02: thinking blocks + OOM + update segur d'OpenClaw

## Context
- Entorn: EC2 nou.
- Impacte inicial: accés SSM/SSH degradat per OOM (processos inestables i latència alta en la gestió remota).

## Símptomes
- Errors repetits en processar respostes amb Anthropic.
- Error exacte observat:
  - `thinking or redacted_thinking blocks ... cannot be modified`

## Causa arrel
- Hi havia sessions persistents que reenviaven a Anthropic missatges amb blocs `thinking` / `redacted_thinking` provinents de context previ.
- Anthropic rebutja aquests blocs quan han estat modificats o reenviats fora del flux esperat.

## Fix aplicat (runtime)
- Es va aplicar sanejament de `context.messages` abans de `streamFn` per evitar reenviar camps/blocs de pensament.
- Fitxer tocat en runtime:
  - `/home/ubuntu/.openclaw/lib/node_modules/openclaw/dist/reply-Cx57rl6c.js`
- Marker del patch:
  - `sanitize anthropic messages: remove thinking blocks`
- Backup generat:
  - `/home/ubuntu/.openclaw/lib/node_modules/openclaw/dist/reply-Cx57rl6c.js.bak`

## Fix d'infra (estabilització)
- Afegit swap de 2GB.
- Ajustats límits de systemd.
- Desactivats gateways no crítics per reduir pressió de memòria.

## Com verificar
Checklist recomanat:
1. Estat serveis usuari:
   - `systemctl --user status <gateway-service>`
2. Logs recents:
   - `journalctl --user -u <gateway-service> -n 80 --no-pager`
3. Smoke test funcional:
   - Prova Telegram 2 cops seguits i valida que no reapareix l'error.

## Update segur d'OpenClaw (sense perdre el fix)
Ordre obligatori després de cada update:
1. Executar update d'OpenClaw (procés habitual).
2. Executar patch local:
   - `scripts/openclaw/patch-sanitize-thinking.sh`
3. Reiniciar gateways afectats.
4. Fer smoke test de Telegram.

## Rollback ràpid
Si el patch trenca compatibilitat o falla el smoke test:
1. Restaurar backup `.bak` sobre el fitxer actiu:
   - `cp /home/ubuntu/.openclaw/lib/node_modules/openclaw/dist/reply-Cx57rl6c.js.bak /home/ubuntu/.openclaw/lib/node_modules/openclaw/dist/reply-Cx57rl6c.js`
2. Reiniciar serveis/gateways.
3. Repetir checklist de verificació.

## Notes operatives
- Aquest procediment és per repo/local i operació controlada.
- No fer canvis directes a producció fora de finestra i checklist.
