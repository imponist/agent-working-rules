# Codex Model-Selection Policy

Start every new task with this hint before taking substantive task action:

> I recommend using the model `<model>` for `<task>`.

This Codex/ChatGPT-specific policy makes model choice a deliberate part of the task contract. It supplements the portable working rules; higher-priority platform, system, developer, safety, and permission instructions still win.

## Choose The Smallest Suitable Model

- Use **GPT-5.6 Luna** for fast, high-volume, bounded work: routing, classification, extraction, support, short summaries, background automation, and focused coding tasks.
- Use **GPT-5.6 Terra** as the default for ordinary production work: reporting, document analysis, coding, and tasks that require sound judgment.
- Use **GPT-5.6 Sol** for genuinely hard work: complex reasoning, materially unresolved ambiguity, advanced coding, or high-stakes decisions.
- Use **GPT-6 Astra** only for the most demanding work: exceptionally complex or consequential reasoning, deep technical investigation, difficult architecture, or work whose remaining uncertainty is genuinely beyond Sol's fit.

Do not choose Sol or Astra solely because the task is important, unfamiliar, or underspecified. First determine whether Terra can handle it through focused inspection or one targeted clarification. Escalate to Sol when the remaining reasoning, ambiguity, technical depth, or decision risk is genuinely beyond Terra's fit. Escalate from Sol to Astra only when that remaining work is genuinely beyond Sol's fit. A task may also be downgraded to Luna when it becomes bounded and repetitive.

### Choosing Astra, Sol, Terra, and Luna

Choose **Astra** when a task needs the strongest capability across multiple steps and tools. **Sol** offers depth and polish, **Terra** suits everyday work, and **Luna** suits clear, repeatable tasks.

#### Where each model shines

- **Astra, for the hardest end-to-end work.** Choose Astra for complete workflows across code, apps, and research that need sustained reasoning and judgment. Give it the sources, templates, constraints, and checks that define a useful result. Astra is better at asking focused questions and incorporating your guidance while keeping the original goal and constraints in view.
- **Sol, for complex, open-ended work.** Choose Sol for ambiguous, difficult, or high-value tasks that need extra analysis, judgment, or polish, such as complex code changes, deep research, or polished documents. For narrower tasks, define what done looks like to keep the work focused.
- **Terra, the pragmatic all-rounder.** Choose Terra for everyday work that needs strong reasoning and tool use when you do not need Sol's full depth. It is a natural starting point for work you previously gave GPT-5.5.
- **Luna, for clear, repeatable tasks.** Choose Luna for specific, high-volume tasks when you know what a good result looks like, such as extraction, classification, transformation, and structured summaries.

### Pick a reasoning effort

Use the lowest reasoning effort that produces the result you need. Increase it for tasks that need more planning, analysis, or checking.

- **Light** in the ChatGPT desktop app, ChatGPT Work on the web, and IDE extension, or Low in the CLI, suits quick, well-scoped tasks.
- **Medium** balances speed and depth for tasks that need more planning.
- **High** and **Extra High** suit difficult work with multiple steps, sources, or tradeoffs.

#### Know when to use Max or Ultra

**Max** gives the selected model more time to reason about a single task. Use it for the hardest problems, when depth matters more than speed or usage. If you don't see Max in your options, you'll have to enable it in your app settings.

**Ultra** uses subagents to handle separate parts of a complex task in parallel. Choose it when you can divide the work into meaningful parts. Most tasks do not need Max or Ultra.

## Enforce The Recommendation

If the active model is not the best fit, state the required hint with the better-fitting model, request that Florian switch models, and pause substantive task work until the switch happens. Do not silently continue on the less-fitting model for convenience or reassurance. This policy cannot itself change the active model; model availability and higher-priority instructions are the only exceptions.

## Usage Awareness

On ChatGPT Plus, local messages and cloud chats share a five-hour window, and additional weekly limits may apply. The following approximate local-message ranges illustrate why model choice matters:

| Model | Approximate messages per 5 hours |
| --- | ---: |
| GPT-6 Astra | 5-45 |
| GPT-5.6 Sol | 10–100 |
| GPT-5.6 Terra | 25–200 |
| GPT-5.6 Luna | 250–2,000 |
| GPT-5.5 | 15–80 |
| GPT-5.4 | 20–100 |
| GPT-5.4 mini | 60–350 |

These ranges are not cost estimates or guarantees. Actual consumption varies with task complexity, context retained, reasoning, tool use, retrieval, and caching; similar prompts can consume very different amounts.
