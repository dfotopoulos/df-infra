# 2026-07-08-004 Explicit Format Scripts

Prompt: user requested that every changed file may be explicitly formatted with
npm after editing and before commit, and that `package.json` may support
directories and wildcard file sets.

## Commands

```powershell
Get-Content C:\usr\src\df\devops\df-infra\package.json
```

Inspected existing npm formatting scripts.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\AGENTS.md
```

Read current project guidance before appending the new formatting rule.

```powershell
$pkgPath = 'C:\usr\src\df\devops\df-infra\package.json'; $pkg = Get-Content -Raw -LiteralPath $pkgPath | ConvertFrom-Json; ...; $pkg | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $pkgPath; $agents = 'C:\usr\src\df\devops\df-infra\AGENTS.md'; Add-Content -LiteralPath $agents -Value ...
```

Updated `package.json` with explicit file formatting scripts and documented the
rule in `AGENTS.md`.

```powershell
$logDir = 'C:\usr\src\df\devops\df-infra\doc\command-log\2026\2026-07\2026-07-08'; New-Item -ItemType Directory -Force -Path $logDir | Out-Null; $log = Join-Path $logDir '2026-07-08-004-explicit-format-scripts.md'; Set-Content -LiteralPath $log -Value ...
```

Created this command log entry.

```powershell
npm run format:files -- AGENTS.md package.json doc/command-log/2026/2026-07/2026-07-08/2026-07-08-003-windows-clean-target.md doc/command-log/2026/2026-07/2026-07-08/2026-07-08-004-explicit-format-scripts.md
```

Formatted the files changed by this prompt, plus the command log appended
immediately before it.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\package.json
```

Verified the resulting npm scripts include generic explicit file formatting
commands.

```powershell
npm run format:files -- doc/command-log/2026/2026-07/2026-07-08/2026-07-08-004-explicit-format-scripts.md
```

Formatted this command log after appending verification notes.

```powershell
npm run format:check
```

Ran the final repository formatting check.

```powershell
make all
```

Confirmed generated diagram outputs remain up to date.
