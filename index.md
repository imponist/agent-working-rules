# Working Rules Index

Version: 3.2
Last reviewed: 2026-09-23
Intended use: portable guidance for `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or equivalent project instructions.

## Non-Negotiables

These rules fail more often than the rest, because they are read once at the start of a session and then compete with every later platform prompt. They are repeated here so this entrypoint alone carries them. The reasoning stays in the linked policies; this list is the operative form.

1. Work locally by default. Do not delegate small, linear, documentation, blocking, ambiguous, or tightly coupled tasks unless the User asked for delegation or independent parallel work.
2. Every delegated lane states all five: its model, its budget, its fail-fast behavior, where it persists partial results, and that it must not spawn subagents. A lane missing these has no brake.
3. Temporary files belong in the current project root's `.tmp/`, never in `/tmp` or anywhere else outside the project root.
4. Never claim a test, build, behavior, or fix passed without fresh verification in the current session.
5. Do not commit, push, deploy, message externally, or take destructive action without explicit authorization.

A platform instruction that prescribes a workflow does not lift these. Where the two conflict, name the conflict rather than silently following the nearer instruction.

## Start Here

Read [Global Working Rules](global-working-rules.md) for every task. It is the canonical operating contract for working with the User.

Then read only what the task requires:

- [Codex Model-Selection Policy](codex-model-selection-policy.md): before choosing a Codex/ChatGPT task model or reasoning effort.
- [Claude Model-Selection Policy](claude-model-selection-policy.md): before choosing a Claude model, effort, budget, or multi-model architecture.
- [Efficiency Delegation Policy](efficiency-delegation-policy.md): only when considering subagents or parallel work.
- [Working With AI Agent](working-with-ai-agent.md): human-facing prompt guidance; agents do not need it to perform ordinary work.
- [Evaluation Checklist](evaluation-checklist.md): maintainer-facing comparisons when revising these rules.

Optional platform-specific enforcement of the Non-Negotiables lives in [enforcement/](enforcement/README.md). It is configuration, not guidance; agents do not need to read it.

Project-specific instructions apply alongside this portable contract. Higher-priority system, platform, developer, tool, safety, and permission rules always win. Within the user-controlled guidance, explicit task instructions override these portable defaults unless a project-specific safety or mutation boundary says otherwise.

## Minimal Project Snippet

```markdown
## Working Rules

Read `agent-working-rules/index.md` before starting work. Treat it as the default collaboration contract unless this project gives more specific instructions.
```

Keep links relative so the folder remains copyable between projects.

## Maintenance

- Keep `global-working-rules.md` concise and authoritative; beyond the Non-Negotiables list above, do not duplicate its full policy here.
- `Non-Negotiables` deliberately restates a few rules from `global-working-rules.md` and `efficiency-delegation-policy.md`. That duplication is the point: it is the part of the contract that must survive context decay in a long session. Keep it to single-line imperatives, keep the wording in sync with the source files, and resist growing the list.
- Put project conventions, commands, routing, and mutation boundaries in the nearest project instruction file.
- Keep platform-specific agent names, models, and tool commands out of the portable contract. Put Codex/ChatGPT model guidance in [Codex Model-Selection Policy](codex-model-selection-policy.md), Claude API/agent guidance in [Claude Model-Selection Policy](claude-model-selection-policy.md), and platform-specific enforcement code in [enforcement/](enforcement/README.md).
- Update `Version` when behavior changes materially and `Last reviewed` after a substantive review.
- Use [Evaluation Checklist](evaluation-checklist.md) before claiming that a revision is more efficient or reliable.
