# Agent Working Rules

Reusable instructions for working with AI coding agents across projects.

Humans should start here. Agents should start with [index.md](index.md).

## What This Is

This folder contains a portable collaboration contract for AI agents. It tells an agent how to work with you: when to ask questions, when to act, how to handle ambiguity, how to prove results, how to control scope, and how to avoid shallow agreement.

The goal is not to make the agent verbose or bureaucratic. The goal is to make its work more useful, honest, and verifiable.

## When To Use It

Use this folder when you want consistent agent behavior across repositories, tools, or projects.

It is especially useful when you want an agent to:

- infer missing task details without asking unnecessary questions;
- ask when ambiguity would cause rework or risk;
- challenge weak assumptions instead of agreeing by default;
- keep edits scoped to the task;
- report evidence before claiming work is done;
- preserve uncertainty instead of sounding falsely confident.

## How To Add It To A Project

Copy this folder into your project, then point your project-level agent instructions at it.

For `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or equivalent files, add:

```markdown
## Working Rules

Read `agent-working-rules/index.md` before starting work. Treat it as the default collaboration contract unless this project file gives more specific instructions.
```

If you do not want to copy the whole folder, copy the compact rules from [global-working-rules.md](global-working-rules.md) into your project instruction file instead.

## How To Use It With An Agent

The intended agent entrypoint is [index.md](index.md).

That file is written for agents. It explains instruction priority, the default task contract, action modes, scope control, evidence expectations, delegation rules, and completion standards.

The short version:

1. Your project instructions should tell the agent to read `agent-working-rules/index.md`.
2. Project-specific instructions still win when they conflict with these reusable rules.
3. The current user request still matters more than generic working preferences.
4. The agent should prove results with concrete evidence: files read or changed, commands run, tests passed, sources used, or verification gaps.

## How To Adapt It

Start by editing [global-working-rules.md](global-working-rules.md). That file is the compact baseline and is easiest to customize.

Then adjust [index.md](index.md) if you want to change the agent-facing workflow in more detail.

Good customization targets:

- how direct or terse the agent should be;
- whether it should ask before editing files;
- what counts as enough evidence for completion;
- how much planning you want before implementation;
- which folders, files, services, or actions are off limits;
- whether subagents or parallel research are allowed.

Avoid vague rules like "be smart" or "make it better". Agents respond better to concrete behavior, boundaries, and evidence requirements.

## File Map

- [index.md](index.md): main agent-facing entrypoint. Tell agents to read this first.
- [global-working-rules.md](global-working-rules.md): compact baseline rules suitable for copying into other instruction files.
- [working-with-ai-agent.md](working-with-ai-agent.md): fuller explanation, prompt template, examples, and guidance for asking better tasks.
- [efficiency-delegation-policy.md](efficiency-delegation-policy.md): rules for when delegation or subagents are worth using.

## Recommended Repository Shape

Keep this `README.md` human-facing and keep `index.md` agent-facing.

That split makes the GitHub landing page useful for colleagues while preserving a clear operational entrypoint for agents.
