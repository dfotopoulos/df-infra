# 2026-07-08-001 First VPS Case

Prompt: "I have started the current project to document with code, in particular
dot graphviz some devops, cloud, webapps, DBs infrastructure. Read the
@agents.md and proceed to the first documented case."

Follow-up instruction: "The commands of every chat response may be logged with
comments within the directory doc\command-log in nested files of the form
YYYY/YYYY-MM/YYYY-MM-DD/YYYY-MM-DD-NNN-<slug>.md Keep this im memory. It sould
be triggered for every action taken after a prompt."

## Commands

```powershell
Get-Location
```

Confirmed the active workspace path.

```powershell
Get-ChildItem -Force C:\usr\src\df\devops\df-infra
```

Inspected the repository root.

```powershell
Get-ChildItem -Path C:\usr\src\df\devops\df-infra -Recurse -File -Include agents.md,AGENTS.md
```

Located the project guidance file.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\AGENTS.md
```

Read the infrastructure diagramming rules and first documented VPS inventory.

```powershell
Get-ChildItem -Recurse -File C:\usr\src\df\devops\df-infra\doc
```

Checked existing documentation files before adding new public docs.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\package.json
```

Reviewed available npm formatting scripts.

```powershell
dot -V
```

Confirmed Graphviz is installed.

```powershell
make --version
```

Confirmed GNU Make is installed.

```powershell
Get-ChildItem -Recurse -File C:\usr\src\df\devops\df-infra
```

Inspected the repository contents and existing sandbox example.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\sandbox\example-001\diagrams\cloud.dot
```

Reviewed the existing example DOT style.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\sandbox\example-001\Makefile
```

Reviewed the existing example Makefile targets.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\.gitignore
```

Checked ignored paths before adding generated outputs.

## File edits

Added the first public VPS documentation case:

- `inventory/vps.yaml`
- `diagrams/vps.dot`
- `doc/vps.md`
- `Makefile`
- `doc/command-log/2026/2026-07/2026-07-08/2026-07-08-001-first-vps-case.md`

```powershell
$path = 'C:\usr\src\df\devops\df-infra\diagrams\vps.dot'; $text = Get-Content -Raw -LiteralPath $path; $text = $text.Replace('splines=ortho,', 'splines=polyline,').Replace('shape=cloud,', 'shape=oval,'); Set-Content -LiteralPath $path -Value $text -NoNewline
```

Updated the DOT file after `apply_patch` failed with a Windows sandbox wrapper
error. The edit only replaced the unsupported `cloud` shape and orthogonal
splines.

```powershell
npm run format:yml
```

Formatted the YAML inventory with the configured project formatter.

```powershell
npm run format:md
```

Formatted Markdown documentation and the command log.

```powershell
make all
```

Regenerated diagram outputs after the DOT warning fixes.

```powershell
npm run format:check
```

Rechecked formatting. This showed existing JSON files needed Prettier
formatting.

```powershell
git diff -- AGENTS.md
```

Inspected the apparent `AGENTS.md` change; git reports it as content added from
an empty index entry, not an edit made for this task.

```powershell
npm run format:json
```

Confirmed the configured JSON script prints formatted output but does not write
changes.

```powershell
.\node_modules\.bin\prettier.cmd "**/*.json" --config .prettierrc.json --write
```

Formatted JSON files using the local Prettier binary with `--write`.

```powershell
Get-ChildItem -File C:\usr\src\df\devops\df-infra\output
```

Verified generated SVG, PNG, and PDF files exist.

```powershell
make all
```

Confirmed generated outputs are up to date.

```powershell
npm run format:check
```

Confirmed YAML, JSON, and Markdown formatting checks pass.

```powershell
git status --short
```

Reviewed the final working tree status.

```powershell
npm run format:md
```

Formatted the command log after appending the final verification notes.

```powershell
npm run format:check
```

Ran the final repository format check after the command log update.
