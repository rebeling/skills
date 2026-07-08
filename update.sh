#!/usr/bin/env bash
set -euo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
readonly SKILL_TARGETS=(
  "$HOME/.codex/skills"
  "$HOME/.claude/skills"
)

mkdir -p "${SKILL_TARGETS[@]}"

for skill_dir in "$SCRIPT_DIR"/*/; do
  [[ -f "${skill_dir}SKILL.md" ]] || continue

  skill_name="$(basename "$skill_dir")"

  for target_dir in "${SKILL_TARGETS[@]}"; do
    ln -sfn "$skill_dir" "$target_dir/$skill_name"
  done
done
