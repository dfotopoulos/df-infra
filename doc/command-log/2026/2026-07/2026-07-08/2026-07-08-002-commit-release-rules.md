# 2026-07-08-002 Commit Release Rules

Prompt: "Another information tham may be kept at all times is that when a commit
is requested then..."

## Commands

```powershell
$agents = 'C:\usr\src\df\devops\df-infra\AGENTS.md'; Add-Content -LiteralPath $agents -Value ...; $logDir = 'C:\usr\src\df\devops\df-infra\doc\command-log\2026\2026-07\2026-07-08'; New-Item -ItemType Directory -Force -Path $logDir | Out-Null; $log = Join-Path $logDir '2026-07-08-002-commit-release-rules.md'; Set-Content -LiteralPath $log -Value ...
```

Persisted the commit message and release documentation rules in `AGENTS.md` and
created this command log entry.

```powershell
npm run format:md
```

Formatted Markdown after updating `AGENTS.md` and this command log.

```powershell
git diff -- AGENTS.md doc/command-log/2026/2026-07/2026-07-08/2026-07-08-002-commit-release-rules.md
```

Reviewed the persisted guidance change.

```powershell
npm run format:check
```

Ran the final repository format check after the guidance update.
