# Efficiency Delegation Policy

Read this policy only when considering subagents or parallel work. Optimize cost, speed, context quality, and result quality together.

## Decision Rule

Work locally when the task is small, linear, blocking, ambiguous, tightly coupled, or likely to require frequent user decisions.

Delegate only when work is independent and well-scoped, and the expected benefit from parallel speed, isolated noisy context, specialist review, or broader coverage outweighs the additional token and coordination cost. Do not duplicate work between the main agent and subagents.

Use the minimum useful number:

- One subagent for a bounded side investigation that lets the main agent remain on the critical path.
- Two for genuinely distinct parallel lanes.
- Three only for clearly large investigations or reviews with separate concerns.

Ask Florian before using more than three subagents, recursive delegation, unusually expensive or deep review, overlapping write scopes, or delegation that depends on unresolved product intent.

## Roles And Boundaries

Choose capabilities that match the work; role labels are descriptive and do not assume a platform has agents with those exact names:

- Explorer: read-only repository or document investigation.
- Researcher: current external documentation or source checks.
- Reviewer: independent correctness, security, regression, and test-gap analysis.
- Worker: implementation with explicit, disjoint file ownership.

Exploration, research, review, and planning are read-only by default. Parallel implementation is appropriate only when write scopes are clearly disjoint and integration order is understood. Keep recursive delegation disabled unless Florian explicitly requests it or the project defines a bounded need.

## Delegation Contract

Every delegated task must state:

- the exact question or deliverable;
- relevant scope and source of truth;
- whether edits are allowed and, if so, the owned files;
- expected evidence and output shape;
- dependencies on other work.

The main agent remains responsible for decisions, integration, and independent verification. Mention delegation to Florian when it materially affects duration, cost, scope, or how results should be interpreted; routine orchestration does not require extra narration.
