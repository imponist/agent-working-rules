# Codex Model-Selection Policy

Start every new task with this hint before taking substantive task action:

> I recommend using the model `<model>` for `<task>`.

This Codex/ChatGPT-specific policy makes model choice a deliberate part of the task contract. It supplements the portable working rules; higher-priority platform, system, developer, safety, and permission instructions still win.

## Choose The Smallest Suitable Model

- Use **GPT-5.6 Luna** for fast, high-volume, bounded work: routing, classification, extraction, support, short summaries, background automation, and focused coding tasks.
- Use **GPT-5.6 Terra** as the default for ordinary production work: reporting, document analysis, coding, and tasks that require sound judgment.
- Use **GPT-5.6 Sol** only for genuinely hard work: complex reasoning, materially unresolved ambiguity, advanced coding, or high-stakes decisions.

Do not choose Sol solely because the task is important, unfamiliar, or underspecified. First determine whether Terra can handle it through focused inspection or one targeted clarification. Escalate to Sol when the remaining reasoning, ambiguity, technical depth, or decision risk is genuinely beyond Terra's fit. A task may also be downgraded to Luna when it becomes bounded and repetitive.

## Enforce The Recommendation

If the active model is not the best fit, state the required hint with the better-fitting model, request that Florian switch models, and pause substantive task work until the switch happens. Do not silently continue on the less-fitting model for convenience or reassurance. This policy cannot itself change the active model; model availability and higher-priority instructions are the only exceptions.

## Usage Awareness

On ChatGPT Plus, local messages and cloud chats share a five-hour window, and additional weekly limits may apply. The following approximate local-message ranges illustrate why model choice matters:

| Model | Approximate messages per 5 hours |
| --- | ---: |
| GPT-5.6 Sol | 10–100 |
| GPT-5.6 Terra | 25–200 |
| GPT-5.6 Luna | 250–2,000 |
| GPT-5.5 | 15–80 |
| GPT-5.4 | 20–100 |
| GPT-5.4 mini | 60–350 |

These ranges are not cost estimates or guarantees. Actual consumption varies with task complexity, context retained, reasoning, tool use, retrieval, and caching; similar prompts can consume very different amounts.
