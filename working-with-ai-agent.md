# Working With AI Agent

Reusable rules for getting better work from AI Agent across projects.

## Operating Rules

1. Identify the why behind the task. Ask about the why when it is missing, unclear, or materially changes the work.
2. Identify what not to do. Ask for constraints when unclear choices could cause rework, risk, or unwanted scope.
3. Act once enough information is available. Do not re-derive settled decisions or narrate options that will not be pursued. When weighing a choice, recommend a path.
4. Prove results. Before claiming work is done, point to evidence: files changed, commands run, tests passed, sources read, or outputs produced. If unverified, say so plainly.
5. Keep it simple. Lead with the outcome, stay concise, and pause only when user input is truly needed.
6. Do not be a sycophant. Be plain, honest, and willing to say when an idea, task, or instruction is weak, risky, or counterproductive.

## Detailed Working Rules

These are the fuller rules behind the compact operating policy.

1. State the desired outcome first. Define what done means: answer, patch, test result, PR, wiki page, diagnosis, plan, or something else.
2. Give constraints upfront. Include deadlines, files or folders to avoid, stack preferences, style rules, deployment limits, and behavior that must not change.
3. Say whether AI Agent should act or advise. Use phrases like "implement this", "investigate only", "review this", "give me options first", or "ask before writing files".
4. Point AI Agent at the authoritative source. Name the repo, folder, document, service, issue, or note that should be treated as source of truth.
5. Prefer concrete examples over abstract intent. Replace "make this cleaner" with the exact duplication, behavior, or workflow that should improve.
6. Separate facts from guesses. Mark what is confirmed, suspected, inferred, or unknown.
7. Ask for evidence when quality matters. Request sources, file references, commands run, tests, or a short explanation of why the result is safe.
8. For bugs, provide reproduction data. Include expected behavior, actual behavior, command or request, logs, recent changes, and environment.
9. For code changes, state the acceptable risk level. Examples: minimal patch only, refactor if needed, no schema changes, or compatibility may break.
10. Use strong review prompts. Ask for correctness bugs, security risks, missing tests, architecture concerns, or production failure modes.
11. Let AI Agent use tools when the answer depends on current state. Repo contents, docs, APIs, versions, dates, prices, and regulations should be inspected instead of guessed.
12. Say whether speed or depth matters more. Use "quick answer", "deep dive", "80/20", "be exhaustive", or "caveman mode".
13. Do not over-specify implementation unless the exact method matters. If the outcome matters more than the route, say so.
14. Correct drift sharply. Useful corrections include "too broad", "use the vault, not web", "stop planning, implement", "you missed X", or "that is an assumption".
15. Ask AI Agent to preserve uncertainty. Good phrase: "mark what is known, inferred, and unknown".
16. For wiki work, be explicit about persistence. Use "query" for read-only, "ingest" for source integration, "file this" for saving synthesis, and "lint/fix the wiki" for maintenance.
17. For learning sessions, invoke the mode directly. Examples: "teacher: quiz me on X", "teacher: learn next", or "teacher: 10-minute review from queue".
18. When asking for a plan, say whether it should become issues. Examples: "make a plan only", "turn this into tickets", or "create a PRD".
19. Ask for tradeoffs, not reassurance. Better prompts: "what are the downsides?", "what assumption is weakest?", or "what would you reject here?".
20. Give permission boundaries once. Example: "You may edit generated wiki pages and run tests, but do not touch canonical notes or push commits."
21. Ask AI Agent to control scope when needed. Examples: "minimal patch only", "do not clean up unrelated files", or "report cleanup ideas separately".
22. Ask for blocker handling when work may fail. Good phrase: "If blocked, tell me what you tried, the evidence, and the smallest next action."
23. For consequential decisions, ask for a recommendation plus the deciding constraint. Good phrase: "recommend one path, name what you rejected, and say what would change your mind."
24. For reviews, ask for findings first, severity ordered, with file or source references. Avoid asking for a general impression when you need risk discovery.

## Prompt Template

Use this shape for non-trivial work:

```text
Goal:
Why:
Source of truth:
Allowed actions:
Do not:
Definition of done:
Quality bar:
```

## Evidence Expectations

Not every task needs the same proof. Choose an evidence level that matches the risk:

- Source-read evidence: files, notes, docs, or source passages inspected.
- Command-output evidence: commands run and relevant output.
- Test/build evidence: exact test, lint, build, or verification command and result.
- Runtime evidence: observed system behavior, logs, UI result, API response, or production-safe check.
- External evidence: current sources for facts that may change.
- Unverified: a plain label when verification was not possible or was intentionally not run.

Good prompt:

```text
Quality bar: Verify with focused tests if code changes are made. If you cannot run tests, say what was not verified.
```

Weak prompt:

```text
Make sure it works.
```

## Scope Boundaries

AI Agent is most reliable when scope is explicit. Say what should not change, especially for code, docs, or wiki work.

Good prompts:

```text
Implement the smallest fix that preserves the public API. Do not refactor unrelated modules.
```

```text
Update only generated wiki pages. Do not edit canonical notes.
```

```text
If you notice broader cleanup, report it separately instead of doing it.
```

## Blocker Handling

When a task might hit missing permissions, failing tools, unclear ownership, or external dependencies, define the blocker protocol upfront.

Good prompt:

```text
If blocked, stop and report: what you tried, the exact error or source evidence, what is still known, what is inferred, and the smallest next action.
```

Bad outcome to avoid:

```text
Partial implementation is described as done, while tests or required access were missing.
```

## Review Prompts

For reviews, ask for risk discovery rather than reassurance.

Strong review prompt:

```text
Review this for correctness bugs, regressions, security risks, production failure modes, and missing tests. Lead with findings ordered by severity, cite file/line evidence, then list residual risk.
```

Weak review prompt:

```text
Looks good?
```

## Decision Prompts

For consequential choices, ask AI Agent to recommend one path and explain the deciding constraint.

Good prompt:

```text
Recommend one approach. Briefly name the alternatives you rejected, the constraint that decides it, and what new information would change the recommendation.
```

## Project Snippet

Copy this into a project `AGENTS.md`, `CLAUDE.md`, or equivalent instruction file:

```markdown
## Working Rules

- Identify the why behind the task; ask when it is unclear or materially affects the work.
- Identify constraints and non-goals; ask when ambiguity creates real risk.
- Act once enough information is available; recommend instead of surveying endlessly.
- Prove completed work with evidence; mark unverified claims plainly.
- Keep responses simple and outcome-first.
- Do not be a sycophant; challenge weak assumptions or bad instructions honestly.
```

## Practical Prompt Examples

```text
Goal: Diagnose why service X fails after deploy.
Why: I need to decide whether to roll back or patch forward.
Source of truth: Server & k8s and the service repository.
Allowed actions: Read notes, inspect manifests, run read-only commands.
Do not: Change files or restart services.
Definition of done: Give likely root cause, evidence, and safest next action.
Quality bar: Separate facts from inference.
```

```text
Goal: Implement the bugfix.
Why: The current behavior breaks customer imports.
Source of truth: Existing tests and production behavior notes.
Allowed actions: Edit code, add focused tests, run verification.
Do not: Refactor unrelated modules or change public APIs.
Definition of done: Tests pass and the fix is explained with file references.
Quality bar: Minimal patch with clear evidence.
```
