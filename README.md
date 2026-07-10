# Agent Working Rules

Portable instructions for working with Florian across AI coding agents and projects.

Humans should start here. Agents should start with [index.md](index.md).

## Purpose

These rules define when an agent should ask or act, how it should control scope, which actions require explicit authorization, and what evidence supports a completion claim. The aim is consistent, honest work without turning every task into a long planning exercise.

The structure separates mandatory behavior from optional guidance:

- [index.md](index.md): short agent entrypoint and routing map.
- [global-working-rules.md](global-working-rules.md): canonical portable operating contract.
- [efficiency-delegation-policy.md](efficiency-delegation-policy.md): conditional policy read only when parallel work is under consideration.
- [working-with-ai-agent.md](working-with-ai-agent.md): human-facing prompt guide and examples.
- [evaluation-checklist.md](evaluation-checklist.md): maintainer-facing comparison method for rule revisions.

## Add It To A Project

Copy this folder into the project and add the following to its `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or equivalent instructions:

```markdown
## Working Rules

Read `agent-working-rules/index.md` before starting work. Treat it as the default collaboration contract unless this project gives more specific instructions.
```

Keep project-specific conventions, commands, source routing, safety rules, and mutation boundaries in the project's own instruction files. They should not be generalized into this portable repository unless they recur across projects.

If copying the folder is undesirable, copy [global-working-rules.md](global-working-rules.md) directly into the project instructions. That file is the canonical compact policy.

## Adaptation

Good customization targets include:

- directness and response depth;
- when edits require confirmation;
- test and evidence expectations;
- minimal patch versus broader refactoring;
- forbidden files, systems, or external actions;
- whether and when parallel agents are worth their cost.

Avoid vague instructions such as “be smart” or “make it better.” Prefer observable behavior, boundaries, and evidence requirements.

Keep platform-specific model names, configured agent names, and tool commands in project or platform configuration. The portable policy describes capabilities rather than assuming that every agent environment exposes the same tools.

## Maintaining The Rules

Treat [global-working-rules.md](global-working-rules.md) as the single source of truth for operating behavior. Do not repeat its full policy in `index.md`, this README, or the human prompt guide.

When changing behavior:

1. State the failure or inefficiency the new rule addresses.
2. Prefer consolidating or replacing a rule over adding another overlapping instruction.
3. Update the version and review date in `index.md` when behavior changes materially.
4. Use [evaluation-checklist.md](evaluation-checklist.md) to compare the candidate with the current contract on representative tasks.
5. Claim an improvement only when the comparison preserves quality and boundaries while improving the intended metric.

Rule quality cannot be established from prose alone. A smaller prompt may be cheaper but miss important boundaries; a longer prompt may improve one difficult task while creating unnecessary ceremony everywhere else. Measure the tradeoff.
