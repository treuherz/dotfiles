#!/bin/bash
# Report Polytoken agent lifecycle state to Herdr.
# Called by hooks in ~/.config/polytoken/hooks.json.
# Usage: herdr-state.sh <state> [init]

# Only run inside a Herdr-managed pane.
test "${HERDR_ENV:-}" = 1 || exit 0
test -n "${HERDR_PANE_ID:-}" || exit 0

state="${1:-idle}"
init="${2:-}"

# Report semantic lifecycle state (drives waits, notifications, rollups).
herdr pane report-agent "$HERDR_PANE_ID" \
  --source custom:polytoken \
  --agent polytoken \
  --state "$state" \
  >/dev/null 2>&1 || true

# On session start, also set display-only metadata.
if [ -n "$init" ]; then
  herdr pane report-metadata "$HERDR_PANE_ID" \
    --source custom:polytoken \
    --agent polytoken \
    --title "Polytoken" \
    --display-agent "Polytoken" \
    --state-label working=working \
    --state-label idle=idle \
    --state-label blocked=blocked \
    --state-label done=done \
    >/dev/null 2>&1 || true
fi

exit 0
