# Claude Model-Selection Policy

Version: 1.0  
Last reviewed: 2026-09-10  
Source: [Anthropic — Optimizing for cost and intelligence](https://platform.claude.com/docs/en/about-claude/models/optimizing-for-cost-and-intelligence)

Use this policy whenever an agent can choose a Claude model, effort level, task or session budget,
or multi-model architecture. It applies to API applications, managed-agent configurations, and
delegated agent lanes. It does **not** give an agent authority to change the model running the
current interactive session; make one concise recommendation to the human if that model is a poor
fit, then continue within the authority available.

The objective is the required quality at the lowest **cost per completed task**, within the required
latency and risk limits. Never optimize a model choice solely for price per token, response speed,
or apparent intelligence.

## Non-Negotiable Operating Order

Apply the least risky, quality-preserving levers before paying for more intelligence:

1. Define success, a failure signal, latency requirement, and a per-task or per-session spend
   boundary. A test, verifier, reviewer rubric, or measurable business outcome is the preferred
   failure signal.
2. Remove free waste: cache stable context, keep volatile data at the end of the request, trim
   irrelevant inputs and stale tool results, defer unused tools, use files plus code execution for
   large structured data, and request only the output the consumer needs.
3. Send unattended work that may wait up to 24 hours through Batch API. Do not batch interactive
   work.
4. On the current model, measure two or three effort levels against representative tasks. Use
   lower effort when it meets the quality bar; do not assume difficult-looking work needs high
   effort.
5. Compare the next model tier only when the effort curve leaves a capability gap. Include retries,
   tool calls, cached tokens, failures, and downstream rework in the cost.
6. Add an advisor or orchestrator only after it beats the best single-model/effort baseline on the
   relevant workload.

Do not combine several levers at once during an experiment. Change one variable, retain the same
outcome checks, and measure the net result.

## Choose a Model Deliberately

Verify the currently available models, limits, prices, and supported parameters in Anthropic's
[model overview](https://platform.claude.com/docs/en/models/overview) before a production decision;
model strings and feature support change. The capability tiers are a starting hypothesis, not a
substitute for an evaluation:

| Work shape | Starting candidate | Escalate when |
| --- | --- | --- |
| High-volume, narrow, independently checkable work | Haiku | It misses the quality bar after prompt and effort tuning, or failures cost more than the saved tokens. |
| Everyday coding, analysis, tool use, or judgment | Sonnet | The measured task tail needs materially deeper reasoning, autonomy, or reliability. |
| Complex, long-horizon agentic coding or reasoning | Opus | The measured quality gap still remains at the appropriate effort. |
| Highest-capability, long-running agentic work | Fable | A cheaper model/effort combination achieves the same completed-task result. |

For an agentic workload, include the frontier model at `low` effort in the baseline when it is
available. A stronger model can cost less per successful task by taking fewer turns, searching less,
and avoiding retries. Conversely, Haiku belongs on routine bulk work with reliable checks, not on a
long, unverified agent loop merely because its token price is low.

Select a model explicitly for every delegated lane whenever the environment permits it. Do not
silently inherit the coordinator's model or spend profile. Give mechanical extraction, filtering,
pagination, classification, and routine condensation to the cheapest capable worker; keep final
synthesis, consequential judgment, and integration with the coordinator unless evaluation proves a
different split better.

## Tune Effort and Retry Safely

- Treat effort as the first intelligence/cost control after free savings. Start at the lowest
  measured level that reaches the quality bar, rather than setting `high` by habit.
- When outputs have a trustworthy automatic checker, run the cheap first pass at `low` (or the
  measured efficient setting) and re-run failures at the default or higher effort. Count both
  attempts and the added failure latency in the result.
- Without a reliable failure signal, do not use a cheap first-pass strategy as proof of quality.
  Evaluate representative outputs first, or use the setting that already meets the quality bar.
- Keep effort and thinking configuration stable within a cached conversation. Changing them can
  invalidate the cached prefix. Start a new session or make a supported per-message change only at
  a natural boundary, then verify cache diagnostics.

## Preserve Tokens Without Sacrificing Quality

### Caching

- Enable prompt caching before changing models. Place stable tool definitions, instructions, and
  durable context first; put timestamps, queue positions, and request-specific text in the newest
  user turn. Cache matching is byte-exact and ordered.
- Use the five-minute cache for uninterrupted loops. For human-in-the-loop sessions, use the
  one-hour duration when roughly one in twenty turns follows a 5-to-60-minute pause and long gaps
  over an hour are uncommon. For Fable 5.1, a five-minute keep-alive may be cheaper for
  minutes-long pauses; measure it and use the one-hour option as pauses approach an hour.
- Do not casually edit the system prompt, output schema, tool list/order, effort, thinking
  configuration, or task budget mid-session: each can break cache reuse. Make necessary changes at
  a task boundary and inspect cache-read metrics afterward.

### Input, context, and output hygiene

- Load tool definitions on demand when the catalog is large. Include only material documents,
  excerpts, images, and tool results; filter or summarize at task boundaries rather than carrying
  stale bulk results forward.
- Upload large data files and let code execution query them instead of pasting tables into prompts.
- Use compaction or context editing only for loops long enough to recover their overhead. Prefer
  a small, intentional task-boundary prune; if clearing context, clear in a few large batches.
- Audit prompts, tool descriptions, and skills when changing models. Remove legacy reasoning
  scaffolds, duplicate checks, contradictions, and forced verbosity that the current model no
  longer needs.
- Ask for the shortest output that truly serves the next consumer. Output tokens are expensive and
  become input again on later agent turns.

## Bound Cost Without Creating False Savings

Use three different controls for three different jobs:

| Control | Purpose | Rule |
| --- | --- | --- |
| Task budget | Guides the model to economize over a task | Set it once at task start, initially near the observed 90th-percentile token use, and verify behaviour. |
| `max_tokens` | Prevents a single response from running indefinitely | Keep it high enough for a valid solution—64K for agentic work, or 128K when a cutoff is costly. Treat `max_tokens` stops as failures, not savings. |
| Session/workspace spend limit | Enforced financial backstop | Set a session cap for the bill no run may exceed, plus a workspace limit for aggregate protection. |

Never lower `max_tokens` just to reduce the apparent cost per attempt. A truncated, billed attempt
that must be retried usually raises cost per completed task.

## Use More Than One Model Only for the Right Shape

### Advisor: a dependent chain with occasional hard decisions

Keep the lower-cost executor in the main loop and consult a stronger advisor for planning,
recovery, or consequential decisions. This fits serial coding, computer-use, and research work
where most actions are routine but a few decisions are not.

Before adopting it, compare against the advisor model alone at low effort. Measure consult rate,
quality, cost, and critical-path latency. If the executor consults on most tasks, run the stronger
model directly; the pairing is then usually more expensive. If it rarely consults because low
effort stopped it recognizing difficulty, restore enough executor effort and make the escalation
trigger explicit.

### Orchestrator: independent bulk work or work beyond one context window

Let a strong coordinator plan and synthesize while cheaper workers read or execute independent
partitions. Use it for a large body of independent files, documents, records, or cases—especially
when the total cannot fit in one context window—or to cap a long cost tail on otherwise routine
work.

Do not orchestrate a single dependent chain or work that fits comfortably in one context window
unless a benchmark proves it helps. Coordination, handoffs, and synthesis are real costs; a single
model at lower effort is often cheaper.

## Measure, Decide, and Revisit

Before a material rollout or model switch:

1. Sample representative production-like tasks, including the hardest tenth of the workload, and
   define an outcome check for each.
2. Record quality, latency, failure/retry rate, total cost, cache-read share, and **cost per
   completed task**. Price uncached input, each cache-write duration, cache reads, and output at
   their actual rates.
3. Baseline relevant model tiers across effort levels. A multi-model design must beat this full
   single-model curve, not only the default setting.
4. Run the candidate in shadow on a limited traffic slice before replacing the current path.
5. Keep the evaluation suite and spending telemetry active. Re-run it after a model release,
   prompt/tool change, workload shift, or a change in the cost tail.

When reporting a selection, state the model and effort per lane, the task class, quality check,
budget, and the evidence or remaining assumption. This makes a cost/intelligence trade-off visible
and correctable.

## Fast Decision Checklist

Before issuing a Claude request or delegating a lane, answer:

1. What makes this task successful, and can failure be checked?
2. What stable context can be cached and what input can be removed or deferred?
3. Does a person need the result now, or can it be batched?
4. What is the cheapest candidate that has evidence it meets the bar?
5. If it fails, is a higher-effort retry or a higher model tier the cheapest recovery?
6. Does the work genuinely justify an advisor or independent workers?
7. What task, session, and workspace budget stops a runaway tail?

If those answers are not known, run a small, bounded evaluation rather than making a permanent
choice from model reputation or token prices.
