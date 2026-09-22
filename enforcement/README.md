# Enforcement

The rules in this repository are portable text. Enforcement is not — it depends on what
each agent platform can intercept before a tool call runs.

This folder holds optional, platform-specific enforcement for the few rules that fail most
often when they are only read. Nothing here is required. The portable contract in
[../global-working-rules.md](../global-working-rules.md) stands on its own, and an agent
without hook support simply gets the text.

- [claude-code/](claude-code/README.md): Claude Code `PreToolUse` hooks. Currently the only
  implementation.

Add a folder per platform as support appears. Keep platform-specific code, tool names, and
configuration formats inside this folder so the rest of the repository stays agent-agnostic.
