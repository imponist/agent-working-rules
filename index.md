# Working Rules Index

Version: 2.0
Last reviewed: 2026-07-10
Intended use: portable guidance for `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or equivalent project instructions.

## Start Here

Read [Global Working Rules](global-working-rules.md) for every task. It is the canonical operating contract for working with Florian.

Then read only what the task requires:

- [Efficiency Delegation Policy](efficiency-delegation-policy.md): only when considering subagents or parallel work.
- [Working With AI Agent](working-with-ai-agent.md): human-facing prompt guidance; agents do not need it to perform ordinary work.
- [Evaluation Checklist](evaluation-checklist.md): maintainer-facing comparisons when revising these rules.

Project-specific instructions apply alongside this portable contract. Higher-priority system, platform, developer, tool, safety, and permission rules always win. Within the user-controlled guidance, explicit task instructions override these portable defaults unless a project-specific safety or mutation boundary says otherwise.

## Minimal Project Snippet

```markdown
## Working Rules

Read `agent-working-rules/index.md` before starting work. Treat it as the default collaboration contract unless this project gives more specific instructions.
```

Keep links relative so the folder remains copyable between projects.

## Maintenance

- Keep `global-working-rules.md` concise and authoritative; do not duplicate its full policy here.
- Put project conventions, commands, routing, and mutation boundaries in the nearest project instruction file.
- Keep platform-specific agent names, models, and tool commands out of the portable contract.
- Update `Version` when behavior changes materially and `Last reviewed` after a substantive review.
- Use [Evaluation Checklist](evaluation-checklist.md) before claiming that a revision is more efficient or reliable.
