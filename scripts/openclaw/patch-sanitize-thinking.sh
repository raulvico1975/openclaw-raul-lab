#!/usr/bin/env bash
set -euo pipefail

TARGET_FILE="${1:-/home/ubuntu/.openclaw/lib/node_modules/openclaw/dist/reply-Cx57rl6c.js}"
BACKUP_FILE="${TARGET_FILE}.bak"
MARKER="sanitize anthropic messages: remove thinking blocks"

if [[ ! -f "$TARGET_FILE" ]]; then
  echo "[ERR] Target not found: $TARGET_FILE" >&2
  exit 1
fi

if grep -Fq "$MARKER" "$TARGET_FILE"; then
  echo "[OK] Patch already present ($MARKER). No changes needed."
  exit 0
fi

if [[ ! -f "$BACKUP_FILE" ]]; then
  cp "$TARGET_FILE" "$BACKUP_FILE"
  echo "[OK] Backup created: $BACKUP_FILE"
else
  echo "[OK] Backup already exists: $BACKUP_FILE"
fi

perl -0777 -i -pe '
s#messages:\s*context\.messages\s*,#// sanitize anthropic messages: remove thinking blocks
messages: (Array.isArray(context.messages)
  ? context.messages.map((m) => {
      if (!m || typeof m !== "object") return m;
      const m2 = { ...m };
      delete m2.thinking;
      delete m2.redacted_thinking;
      if (Array.isArray(m2.content)) {
        m2.content = m2.content.filter((b) => !(b && typeof b === "object" && (b.type === "thinking" || b.type === "redacted_thinking")));
      }
      return m2;
    })
  : context.messages),#s
' "$TARGET_FILE"

if grep -Fq "$MARKER" "$TARGET_FILE"; then
  echo "[OK] Patch applied successfully: $TARGET_FILE"
  exit 0
fi

cp "$BACKUP_FILE" "$TARGET_FILE"
echo "[ERR] Patch failed (pattern not found or file changed). Restored from backup: $BACKUP_FILE" >&2
exit 1
