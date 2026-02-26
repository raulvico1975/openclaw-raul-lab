# Workflows

Estat actual (2026-02-24): directori reservat, sense workflows implementats.

## Quan afegir un workflow

Afegeix un workflow nomes si:
- hi ha objectiu operatiu clar
- hi ha trigger definit
- hi ha criteri de validacio del resultat

## Convencio recomanada

- Un fitxer per workflow: `workflows/<nom>.md`
- Incloure sempre:
  - context
  - trigger
  - passos
  - sortida esperada
  - fallbacks

## Checklist minima

1. Definir una metrica d'exit.
2. Provar el flux almenys un cop de punta a punta.
3. Documentar limits i riscos.
