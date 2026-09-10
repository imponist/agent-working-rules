# Efficiency Delegation Policy

Read this policy only when considering subagents or parallel work. Work locally by default. Delegation is an exception that must improve the task after accounting for its full cost and risk.

## Decision Rule

Complete the work with the main agent when one agent can do it efficiently. In particular, work locally when the task is small, short, linear, blocking, ambiguous, tightly coupled, already near completion, or likely to require frequent user decisions or shared context.

Delegate only when a bounded, independent lane has a concrete advantage from parallel speed, isolated noisy context, specialist review, or broader coverage. That advantage must clearly outweigh startup time, context transfer, additional tokens, coordination, result integration, latency, and the risk of interrupted or lost work. Parallelism is not a benefit by itself. Do not delegate work that the main agent could likely finish faster, or duplicate work between the main agent and subagents.

Delegated tokens are Florian's tokens. A cost, context, or budget warning from Florian applies to
the whole session including every delegated lane — not only to the main agent's own context. When he
signals cost pressure, cut delegated scope and model strength or stop delegating. Keeping the main
context small does not satisfy the warning.

Use the minimum useful number:

- Prefer one subagent for a bounded side investigation that lets the main agent remain on the critical path.
- Use two only for genuinely distinct lanes with a meaningful expected gain in completion time or coverage.

Ask Florian before using three or more subagents, recursive delegation, unusually expensive or deep review, overlapping write scopes, or delegation that depends on unresolved product intent.

## Model And Budget

- Set the subagent model explicitly for every delegated lane. Omitting it inherits the main agent's
  model, which is normally the most expensive option available.
- Match model strength to the nature of the work, not to the size of the data. Mechanical paging,
  extraction, filtering, and routine condensing belong on the cheapest capable model. Reserve the
  strong model for final synthesis and judgment, which the main agent normally keeps.
- Prefer a script to a model for anything deterministic. A lane that writes and runs a small script
  to page an API and filter the results costs a fraction of one that reads every record itself.
- State an explicit budget in the delegated task: how many records, calls, or pages the lane may
  consume before reporting back. A lane that finds the work larger than its budget stops and reports
  instead of continuing.

## Reliability And Recovery

The main agent must retain enough context to make decisions, integrate results, and continue if a subagent fails. Do not make success depend on coordinating many subagents or waiting for every delegated lane when a simpler local path is available.

Collect and preserve useful results as they become available. If orchestration becomes unstable, a subagent fails, or delegation stops providing a clear net benefit, stop spawning additional subagents and continue locally where possible.

Delegated lanes must fail fast. On a tool, connector, authentication, or network failure, retry at
most once, then persist whatever is already complete and report the failure. Never loop on retries,
schedule wait timers, or idle while waiting for a dependency to come back — a lane burning tokens
against a dead dependency is worse than a lane that stopped.

Require every lane to persist partial results to disk as it goes, so an interruption costs nothing
already earned. The main agent checks lane health when a dependency looks unhealthy and stops lanes
that can no longer make progress.

## Roles And Boundaries

Choose capabilities that match the work; role labels are descriptive and do not assume a platform has agents with those exact names:

- Explorer: read-only repository or document investigation.
- Researcher: current external documentation or source checks.
- Reviewer: independent correctness, security, regression, and test-gap analysis.
- Worker: implementation with explicit, disjoint file ownership.

Exploration, research, review, and planning are read-only by default. Parallel implementation is appropriate only when write scopes are clearly disjoint and integration order is understood. Keep recursive delegation disabled unless Florian explicitly approves it for the task.

## Delegation Contract

Every delegated task must state:

- the exact question or deliverable;
- relevant scope and source of truth;
- whether edits are allowed and, if so, the owned files;
- expected evidence and output shape;
- dependencies on other work;
- the budget: maximum records, calls, or pages before reporting back;
- fail-fast behavior on tool or connector errors, and where partial results are persisted;
- that the lane must not spawn subagents of its own.

The last three are not optional boilerplate. A delegated prompt that omits them has no brake: it can
retry forever, fan out recursively, and consume an unbounded budget without anyone noticing until the
session limit is reached.

The main agent remains responsible for decisions, integration, and independent verification. Mention delegation to Florian when it materially affects duration, cost, scope, or how results should be interpreted; routine orchestration does not require extra narration.
