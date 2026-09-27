# 2026-07-08-005 Makefile Npm Targets

Prompt: "Enhance the Makefile to use npm and support all targets provided by
package.json"

## Commands

```powershell
Get-Content C:\usr\src\df\devops\df-infra\Makefile
```

Inspected the existing Makefile diagram and clean targets.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\package.json
```

Read the npm scripts that need Makefile support.

```powershell
$path = 'C:\usr\src\df\devops\df-infra\Makefile'; Set-Content -LiteralPath $path -NoNewline -Value ...
```

Rewrote the Makefile to add npm-backed aliases for every package script, plus
`npm-script SCRIPT=...` for direct script dispatch.

```powershell
$logDir = 'C:\usr\src\df\devops\df-infra\doc\command-log\2026\2026-07\2026-07-08'; New-Item -ItemType Directory -Force -Path $logDir | Out-Null; $log = Join-Path $logDir '2026-07-08-005-makefile-npm-targets.md'; Set-Content -LiteralPath $log -Value ...
```

Created this command log entry.

```powershell
npm run format:files -- doc/command-log/2026/2026-07/2026-07-08/2026-07-08-005-makefile-npm-targets.md
```

Formatted this command log with the explicit npm file formatter.

```powershell
make format-check
```

Verified the Makefile `format-check` alias calls `npm run format:check`
successfully.

```powershell
make all
```

Verified the existing diagram build target still works.

```powershell
make npm-script SCRIPT=format:check
```

Verified generic dispatch can run a package script with a colon in its name.

```powershell
make format-files-check FORMAT_FILES=package.json
```

Verified explicit file formatting checks can be invoked through Make.

```powershell
make format-yml-check
```

Verified the YAML check alias.

```powershell
make format-json-check
```

Verified the JSON check alias.

```powershell
make format-md-check
```

Verified the Markdown check alias.

```powershell
git diff -- Makefile doc/command-log/2026/2026-07/2026-07-08/2026-07-08-005-makefile-npm-targets.md
```

Attempted to inspect the final diff. These files are untracked in the current
repository state, so no tracked diff was shown.

```powershell
npm run format:files -- doc/command-log/2026/2026-07/2026-07-08/2026-07-08-005-makefile-npm-targets.md
```

Formatted this command log after appending final verification notes.

```powershell
make format-check
```

Ran the final formatting check through Make.
