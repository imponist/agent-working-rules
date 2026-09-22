# Claude Code Enforcement

Claude Code specific. Other agents ignore this folder.

## delegation-guard.sh

A `PreToolUse` hook on the subagent tool. It blocks a delegation call whose prompt does not
carry the delegation contract from [../../efficiency-delegation-policy.md](../../efficiency-delegation-policy.md),
and returns the missing clauses as the block reason.

It checks five things:

| Clause | Check |
| --- | --- |
| model | `tool_input.model` is set and non-empty (skipped for `subagent_type: fork`, which inherits the parent model by design) |
| budget | prompt contains `budget` |
| fail-fast | prompt contains `fail-fast` or `fail fast` |
| partial results | prompt contains `.tmp/` or `persist` |
| no nesting | prompt contains `must not spawn`, `do not spawn`, `not spawn subagents`, `no nesting`, or `without spawning` |

The checks are keyword-shaped on purpose. They cannot judge whether a budget is sensible — only
whether the agent stated one. That is enough: the failure being prevented is the prompt written
without any brake at all, not the prompt with a badly chosen number.

The guard does not, and cannot, decide whether delegating was warranted in the first place. It
puts that question in the block message instead.

### Why a hook and not more text

The rules already say all of this. An agent can read the entire chain at the start of a session,
then delegate with no model, no budget and no fail-fast clause an hour later, because the text has
faded while the platform keeps prompting for parallel agents. Text raises the odds. A hook runs on
every call.

## Install

Requires `jq` on `PATH`. Without it the guard logs a line to stderr and allows the call — a broken
guard must never block work.

Per user, covering every project (recommended — matches how this repository is meant to be used):

```bash
chmod +x /absolute/path/to/agent-working-rules/enforcement/claude-code/delegation-guard.sh
```

Then merge [settings.snippet.json](settings.snippet.json) into `~/.claude/settings.json`, replacing
the placeholder with the absolute path to one clone of this repository.

Per project, using the vendored copy:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Task|Agent",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PROJECT_DIR}/agent-working-rules/enforcement/claude-code/delegation-guard.sh"
          }
        ]
      }
    ]
  }
}
```

`matcher` covers both `Task` and `Agent`; the subagent tool is named differently across Claude Code
versions.

## Verify

Without starting a session:

```bash
echo '{"tool_name":"Agent","tool_input":{"prompt":"go find things"}}' \
  | ./delegation-guard.sh | jq -r '.hookSpecificOutput.permissionDecisionReason'
```

Expect all five clauses listed. A compliant prompt returns nothing and exits 0:

```bash
echo '{"tool_name":"Agent","tool_input":{"model":"haiku","prompt":"Budget: 20 reads. Fail-fast: retry once then report. Persist partials to .tmp/lane.md. You must not spawn subagents."}}' \
  | ./delegation-guard.sh; echo "exit=$?"
```

In a live session, run `/hooks` to confirm the hook is registered.

## Tuning

- To warn instead of block, change `permissionDecision` from `deny` to omitted and print the reason
  to stderr.
- To exempt a subagent type, extend the `case` on `subagent_type`.
- To relax a clause, widen its regex in the `has` call rather than deleting the check, so the
  requirement stays visible.

## Uninstall

Remove the `PreToolUse` entry from the settings file. Nothing else in this repository depends on it.
