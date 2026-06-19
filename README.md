# strand

> Local AI agent harness with durable, queryable memory.

strand runs an AI coding agent locally and records every message, tool call,
cost, and decision to a local DuckDB database so you can query your history
later. Each session runs in its own git worktree, so the agent can never touch
your main checkout.

## Install

```sh
brew install ralaruri/strand/strand
```

Or tap first, then install:

```sh
brew tap ralaruri/strand
brew install strand
```

**Requirements:** macOS (Intel or Apple Silicon — the binary is universal).

## Quickstart

```sh
strand run "<task>"              # run the agent on a task
strand memory set "key" "value"  # store a fact
strand memory get "key"          # retrieve it
strand memory list               # list everything stored
strand history --search "topic"  # search past sessions
strand cost                      # cumulative API spend
strand grep "<text>"             # search tool outputs across sessions
strand query "<sql>"             # raw SQL against your full history
```

Your data lives in `~/.local/share/strand/db.duckdb`.

## Note on install

On install, strand appends a short "strand — persistent memory" section to
`~/.claude/CLAUDE.md` (creating the file if needed) so Claude Code knows the
tool is available. It won't duplicate the section on upgrades.

## Upgrade / uninstall

```sh
brew upgrade strand
brew uninstall strand
```
