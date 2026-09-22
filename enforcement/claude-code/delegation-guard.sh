#!/usr/bin/env bash
# delegation-guard.sh — Claude Code PreToolUse guard for delegation tools.
#
# Blocks a subagent call whose prompt does not carry the delegation contract from
# ../../efficiency-delegation-policy.md ("Delegation Contract"). Reading that policy
# is not enough: it is read once per session and then competes with every later
# platform prompt that suggests spawning agents. This guard checks at call time.
#
# Claude Code specific. See ./README.md for installation.
#
# Exit 0 with no output  -> not a delegation call, or the contract is present.
# Exit 0 with deny JSON  -> blocked, with the missing clauses as the reason.
# Fails open on any environment problem: a broken guard must never block work.

set -uo pipefail

payload="$(cat)"

if ! command -v jq >/dev/null 2>&1; then
  printf 'delegation-guard: jq not found on PATH; guard skipped.\n' >&2
  exit 0
fi

field() { printf '%s' "$payload" | jq -r "$1" 2>/dev/null || printf ''; }

tool_name="$(field '.tool_name // empty')"
# "Task" and "Agent" are both used across Claude Code versions.
case "$tool_name" in
  Task|Agent) ;;
  *) exit 0 ;;
esac

prompt="$(field '.tool_input.prompt // ""')"
model="$(field '.tool_input.model // ""')"
subagent_type="$(field '.tool_input.subagent_type // ""')"

missing=''
add()  { missing="${missing}  - $1"$'\n'; }
has()  { printf '%s' "$prompt" | grep -Eiq -- "$1"; }

# A fork inherits the parent's model by design, so a model override is ignored there.
if [ "$subagent_type" != "fork" ] && [ -z "$model" ]; then
  add "model — set it explicitly. Omitting it inherits the main agent's model, normally the most expensive option available. Match model strength to the nature of the work, not the size of the data."
fi

has 'budget' \
  || add 'budget — state the maximum records, calls, or pages the lane may consume before it stops and reports back.'

has 'fail[- ]?fast' \
  || add 'fail-fast — on a tool, connector, authentication, or network failure: retry at most once, then persist what is done and report. No retry loops, no wait timers.'

has '\.tmp/|persist' \
  || add "partial results — name where the lane writes them as it goes (the project root's .tmp/), so an interruption costs nothing already earned."

has 'must not spawn|do not spawn|not spawn subagents|no nesting|without spawning' \
  || add 'no nesting — state that the lane must not spawn subagents of its own.'

[ -z "$missing" ] && exit 0

reason="Blocked by agent-working-rules delegation guard: this ${tool_name} call is missing part of the delegation contract.

Missing:
${missing}
First reconsider whether to delegate at all. efficiency-delegation-policy.md: work locally by
default, and do not delegate small, linear, documentation, blocking, ambiguous, or tightly
coupled tasks unless the User asked for delegation or independent parallel work. Parallelism is
not a benefit by itself, and delegated tokens are the User's tokens.

If delegation is warranted, add the missing clauses to the prompt, set the model explicitly, and
call again."

jq -n --arg r "$reason" '{
  hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "deny",
    permissionDecisionReason: $r
  }
}'
exit 0
