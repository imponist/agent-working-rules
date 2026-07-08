# Efficiency Delegation Policy

Reusable agent-facing policy for making subagent and model-use decisions more efficient across cost, speed, and depth.

## Policy

The default optimization target is balanced efficiency: improve cost, speed, and depth together rather than blindly minimizing one at the expense of the others.

- Keep the main agent on the immediate critical path.
- Use subagents for bounded parallel side work that saves time, protects the main-thread context, or improves review quality.
- Prefer doing work locally when a task is small, linear, blocking, ambiguous, tightly coupled, or likely to require frequent back-and-forth.
- Default to 1-3 subagents. Use more only for clearly parallel large reviews or investigations, and stay within the configured thread limit.

## Standing Authorization

- The agent may automatically spawn subagents when the work is independent, well-scoped, read-heavy, noisy, or benefits from multiple perspectives.
- Ask the user first when delegation would exceed normal limits, use unusually expensive or deep review, create overlapping write scopes, or depend on unclear product intent.
- Before delegating, identify the immediate local task and delegate only non-overlapping sidecar work.
- Do not duplicate work between the main agent and subagents.

## Agent Selection

- Use `docs_researcher` for external or current documentation checks.
- Use `pr_explorer` or `explorer` for fast read-only codebase investigation.
- Use `reviewer` for correctness, security, regression, and test-gap review.
- Use `worker` only for implementation subtasks with clear, disjoint ownership.
- Do not override models manually unless the task has a clear reason; prefer the configured custom agent models.

## Operating Rules

Subagent prompts must include the exact question, scope, expected output, and whether file edits are allowed. Read-only is the default for exploration, documentation, review, and planning. Worker subagents may edit only when their write scope is disjoint and explicitly assigned.

While working, briefly report delegation decisions and why they are efficient. Close completed agents after integrating their results.
