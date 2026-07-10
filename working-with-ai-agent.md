# Working With AI Agents

This is a human-facing guide for giving AI agents effective tasks. Agents should use [Global Working Rules](global-working-rules.md) as their operating contract and do not need to read this guide for ordinary work.

## A Strong Task Shape

For non-trivial work, provide the fields that materially affect the result:

```text
Goal:
Why:
Source of truth:
Allowed actions:
Do not:
Definition of done:
Quality bar:
```

You do not need to fill every field for simple or obvious work. The agent should infer missing details when the request and project context make them clear.

## Give Intent And Boundaries

- State the outcome first: an answer, diagnosis, patch, test result, review, plan, issue, or saved document.
- Explain why when it changes priorities, risk tolerance, or the decision the result must support.
- Point to the authoritative repo, folder, document, service, issue, API, test, or observed behavior.
- Say whether the agent should advise, investigate, review, implement, or persist information.
- Name meaningful boundaries such as files to avoid, public behavior to preserve, forbidden external actions, or whether commits and pushes are allowed.
- Define the quality bar with terms such as quick answer, 80/20, deep review, minimal patch, exhaustive, or compatibility may break.

Prefer concrete examples and observable behavior over abstract requests such as “make this cleaner” or “ensure it works.”

## Ask For Appropriate Evidence

Choose proof that matches the risk:

- Source evidence for explanations or documentation questions.
- Command output for repository or environment claims.
- Focused tests, lint, or builds for code changes.
- Runtime behavior, logs, UI observations, or API responses when static checks are insufficient.
- Current external sources for facts that may have changed.
- A plain unverified label when a check cannot or should not be run.

Good quality-bar instruction:

```text
Run the focused tests for changed behavior. If verification is unavailable, state exactly what remains unverified.
```

Avoid vague requests such as “make sure it works.”

## Bugs And Investigations

When available, provide:

- expected and actual behavior;
- a command, request, or sequence that reproduces the problem;
- exact errors, logs, screenshots, or timestamps;
- recent changes and the relevant environment;
- whether the task is diagnosis only or includes a fix.

Example:

```text
Goal: Diagnose why service X fails after deployment.
Why: I need to decide whether to roll back or patch forward.
Source of truth: Server & k8s notes and the service repository.
Allowed actions: Read notes, inspect manifests, and run read-only commands.
Do not: Change files or restart services.
Definition of done: Give the likely cause, evidence, and safest next action.
Quality bar: Separate confirmed facts from inference.
```

## Implementations And Reviews

For narrow changes, state the behavior that must remain stable and whether refactoring is acceptable:

```text
Implement the smallest fix that preserves the public API. Add focused tests. Report broader cleanup separately instead of doing it.
```

For reviews, ask for risk discovery rather than reassurance:

```text
Review this for correctness bugs, regressions, security risks, production failure modes, and missing tests. Lead with findings ordered by severity and cite file or source evidence.
```

For consequential choices, request a recommendation and the deciding constraint:

```text
Recommend one approach. Briefly identify the rejected alternatives, the constraint that decides the choice, and what new evidence would change the recommendation.
```

## Correcting Drift

Short corrections are useful routing signals:

- `too broad`
- `use the repository, not the web`
- `investigate only`
- `stop planning, implement`
- `that is an assumption`
- `mark what is confirmed, inferred, and unknown`

Do not repeat settled context after a correction. State the changed direction and continue.

## Permission Examples

```text
You may edit generated wiki pages and run checks. Do not modify canonical notes, create commits, push, or contact external systems.
```

```text
Read and review only. If a fix is warranted, describe it without changing files.
```

Explicit boundaries once are more useful than repeated permission checks throughout the task.
