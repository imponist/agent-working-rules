# Codex Model-Selection Policy

Version: 1.1
Last reviewed: 2026-09-23
Source: [OpenAI model catalog](https://developers.openai.com/api/docs/models) and [deprecations](https://developers.openai.com/api/docs/deprecations)

Use this policy before choosing the model or reasoning effort for a Codex/ChatGPT task. It
supplements the global working rules; platform availability, system/developer instructions, safety,
and permission constraints always win.

The goal is the smallest available model and lowest reasoning effort that can meet the task's
quality bar. Model choice is deliberate: it should reduce the User's cost, latency, and quota use
without creating rework, failed outputs, or a weaker result.

## Start Every Task With a Model Recommendation

Before substantive task action, state:

> I recommend using `<model>` for `<task>`.

If the active model is not the best fit, ask the User to switch once and pause substantive task work
until he decides. An agent cannot change the session model itself. Do not overrule model
availability or higher-priority instructions.

## Choose the Smallest Suitable Model

| Model | Use for | Escalate when |
| --- | --- | --- |
| **GPT-6 Luna** | Focused, high-volume, bounded work: routing, classification, extraction, support, short summaries, background automation, and focused coding. Compare it with GPT-5.6 Luna when both are available. | The task needs non-routine judgment, substantial integration, or deeper reasoning. |
| **GPT-5.6 Luna** | An established option for fast, high-volume, bounded work when prior evaluation, availability, or platform behavior favors it. | A lower-cost available candidate does not meet the quality bar, or the task needs non-routine judgment, substantial integration, or deeper reasoning. |
| **GPT-5.6 Terra** | Ordinary production work: reporting, document analysis, coding, and tasks requiring sound judgment. This is the practical default. | Focused inspection or one targeted clarification still leaves material ambiguity, technical depth, or decision risk. |
| **GPT-6 Sol** | Complex coding and agentic workflows that need more than ordinary production judgment. Compare it with GPT-5.6 Sol when both are available. | The remaining work needs exceptional sustained reasoning, difficult architecture, or investigation beyond Sol's fit. |
| **GPT-5.6 Sol** | An established flagship option for complex professional work when prior evaluation, availability, or platform behavior favors it. | The remaining work needs exceptional sustained reasoning, difficult architecture, or investigation beyond Sol's fit. |
| **GPT-6 Astra** | The most demanding, consequential end-to-end work: difficult architecture, deep technical investigation, or multiple hard tool-using steps. | Do not escalate further; constrain scope, clarify the decision, or split genuinely independent work instead. |

Newer releases do not retire the GPT-5.6 family by implication. Keep GPT-5.6 models as candidates until OpenAI publishes a deprecation or platform availability changes. Importance, unfamiliarity, or an underspecified prompt alone do not justify either Sol model or Astra. First see whether Terra can resolve the uncertainty through narrow inspection or one material clarification. Likewise, downgrade to a Luna model when a task becomes clear, bounded, and repetitive.

## Set Reasoning Effort Deliberately

Use the lowest effort that produces the required result. More effort is not a quality guarantee;
it consumes time and quota and can be wasteful on a clear task.

- **Light** in the desktop app, Work web app, and IDE extension—or **Low** in the CLI—for quick,
  well-scoped work.
- **Medium** for work that needs modest planning, analysis, or checking.
- **High** or **Extra High** for difficult, multi-step work with meaningful sources, trade-offs, or
  verification requirements.
- **Max** only when depth on a single hard task matters more than speed and usage.
- **Ultra** only when the task can be divided into meaningful, independent subproblems. It uses
  subagents; it is not a general-purpose quality setting.

Before raising effort or model strength, tighten the request: define done, give the relevant
source and constraints, specify the required output shape, and state how success will be checked.
Clear context is usually cheaper than brute-force reasoning.

Use only the models and reasoning-effort levels exposed by the active Codex or ChatGPT surface. When GPT-6 Sol and GPT-6 Luna are available alongside their GPT-5.6 counterparts, compare the lowest-cost candidate that meets the same representative quality check; do not assume a newer release is an automatic replacement.

## Cost-Intelligent Operating Rules

1. Match the choice to the hardest unresolved part of the task, not its apparent prestige or the
   size of the input.
2. For routine extraction, filtering, transformations, and narrow summaries, compare GPT-6 Luna
   and GPT-5.6 Luna when both are available; use the lowest-cost candidate that meets the quality
   bar.
3. Keep ordinary implementation, analysis, and synthesis on Terra unless concrete evidence shows
   that it cannot meet the quality bar.
4. For the small set of tasks where stronger reasoning changes the outcome, compare GPT-6 Sol and
   GPT-5.6 Sol when both are available; use Astra only when those candidates leave an objectively
   hard remainder.
5. Prefer targeted inspection, tests, and a concise clarification over an automatic model
   escalation. They produce evidence and often turn a hard-looking task into a bounded one.
6. When delegated work is permitted, choose the model for each lane explicitly. Give cheap,
   mechanical lanes the lowest capable model; retain integration and consequential decisions on the
   main model. Follow [Efficiency Delegation Policy](efficiency-delegation-policy.md) before
   creating lanes.
7. Reassess after new evidence. Escalate only the remaining difficult part; downgrade repeated or
   mechanical follow-on work.

## Fast Decision Check

Before acting, answer:

1. Is the task clear and repeatable? Compare GPT-6 Luna and GPT-5.6 Luna when both are available.
2. Does it need ordinary judgment, coding, or document analysis? Use Terra.
3. Is there unresolved complexity, ambiguity, or high decision risk that Terra cannot clear with
   focused work? Compare GPT-6 Sol and GPT-5.6 Sol when both are available.
4. Does that remaining challenge still exceed the available Sol candidates across several difficult
   steps or a consequential architecture/investigation? Use Astra.
5. What is the lowest reasoning effort consistent with the answer above?

State the recommendation and its reason concisely. If the task changes shape, update the choice
rather than staying on an unnecessarily expensive model.
