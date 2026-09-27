# 2026-07-08-003 Windows Clean Target

Prompt: user reported `make clean` fails on Windows because `rm` is not found.

## Commands

```powershell
Get-Content C:\usr\src\df\devops\df-infra\Makefile
```

Inspected the current Makefile clean target.

```powershell
Get-ChildItem -File C:\usr\src\df\devops\df-infra\output
```

Confirmed generated diagram outputs existed before testing clean behavior.

```powershell
$path = 'C:\usr\src\df\devops\df-infra\Makefile'; $text = Get-Content -Raw -LiteralPath $path; ...; Set-Content -LiteralPath $path -Value $text -NoNewline
```

Updated `clean` to use PowerShell `Remove-Item` on Windows and keep `rm -f` on
non-Windows systems.

```powershell
$logDir = 'C:\usr\src\df\devops\df-infra\doc\command-log\2026\2026-07\2026-07-08'; New-Item -ItemType Directory -Force -Path $logDir | Out-Null; $log = Join-Path $logDir '2026-07-08-003-windows-clean-target.md'; Set-Content -LiteralPath $log -Value ...
```

Created this command log entry.

```powershell
make clean
```

Tested the first Windows PowerShell clean recipe. It still exited with status 1
under the sandboxed tool session.

```powershell
Get-Content C:\usr\src\df\devops\df-infra\Makefile
```

Reviewed the updated Makefile after the failed clean attempt.

```powershell
Get-ChildItem -File C:\usr\src\df\devops\df-infra\output
```

Checked whether the failed clean attempt removed generated outputs.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Force -ErrorAction SilentlyContinue output/vps.svg, output/vps.png, output/vps.pdf; if ($?) { exit 0 } else { exit 1 }"
```

Tried to reproduce the PowerShell command directly; the nested `$?` expansion
made this diagnostic invalid.

```powershell
$path = 'C:\usr\src\df\devops\df-infra\Makefile'; $text = Get-Content -Raw -LiteralPath $path; $text = $text.Replace(...); Set-Content -LiteralPath $path -Value $text -NoNewline
```

Simplified the Windows clean recipe to remove `output/vps.*`.

```powershell
make clean
```

Retested clean in the sandbox. It still failed because sandboxed deletion of
generated files was denied.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Force -ErrorAction SilentlyContinue output/vps.*"
```

Confirmed direct nested PowerShell deletion also failed under the sandbox.

```powershell
where powershell
```

Attempted to inspect PowerShell resolution. In PowerShell, `where` is an alias
and did not provide useful output here.

```powershell
cmd /c del /q output\vps.svg output\vps.png output\vps.pdf
```

Checked `cmd del` as an alternative; sandboxed deletion was also denied.

```powershell
Get-ChildItem -File C:\usr\src\df\devops\df-infra\output | Format-List FullName,Attributes,IsReadOnly
```

Verified generated files were normal non-read-only archive files.

```powershell
Remove-Item -LiteralPath C:\usr\src\df\devops\df-infra\output\vps.svg -Force -ErrorAction Stop
```

Confirmed the denial was deletion access, not file attributes.

```powershell
make clean
```

Ran `make clean` with approval outside the sandbox. It passed and removed
generated diagram outputs.

```powershell
make all
```

Regenerated SVG, PNG, and PDF outputs after clean.

```powershell
Get-ChildItem -File C:\usr\src\df\devops\df-infra\output
```

Verified regenerated outputs exist.
