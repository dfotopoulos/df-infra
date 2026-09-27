# Infrastructure Diagramming Rules

The project documents VPS/cloud infrastructure using Graphviz, Makefile, and
optionally npm-based tooling on Windows.

## Canonical approach

- Graphviz DOT files are the primary diagram source.
- SVG is the primary output format.
- PNG may be generated for sharing.
- PDF may be generated for reports.
- Use `make` targets to generate all outputs.
- Prefer deterministic, version-controlled diagrams.
- Do not edit generated SVG/PNG/PDF manually.

## Diagram style

Use Graphviz clusters to group infrastructure:

- Provider / Cloud VPS inventory
- Geographic/server-name grouping
- Operating system grouping
- Public network information
- Services hosted on each VPS
- Databases
- Reverse proxies
- Firewalls
- Monitoring
- Backups

Represent each VPS as a cluster or structured node containing:

- Server name
- Public IPv4
- IPv6
- Location
- Host system ID
- OS
- VPS plan

Avoid putting sensitive operational access details in public diagrams.

## Security rule

Do not expose VNC endpoints, admin ports, passwords, tokens, private keys, or
credentials in public diagrams.

If VNC data is needed, put it only in a restricted/private inventory file and
render it only in internal diagrams.

## VPS inventory to document

Servers:

- Romania — 157.173.127.220 — Arch Linux — Hub Europe
- Poland — 213.199.38.135 — Debian 13 Trixie — Hub Europe
- Denmark — 95.111.236.11 — Arch Linux — Hub Europe
- Czech — 158.220.114.68 — Arch Linux — Hub Europe
- Netherlands — 85.208.51.73 — Arch Linux — Hub Europe
- Germany — 158.220.98.11 — Debian 12 — Hub Europe
- Finland — 45.136.17.165 — Rocky Linux 9 — Karlsruhe
- Norway — 176.57.184.69 — OS installed by customer — Hub Europe
- Sweden — 176.57.150.81 — Debian 12 — Hub Europe

## Makefile expectations

Provide targets such as:

```make
all: diagrams

diagrams: svg png pdf

svg:
	dot -Tsvg diagrams/vps.dot -o output/vps.svg

png:
	dot -Tpng diagrams/vps.dot -o output/vps.png

pdf:
	dot -Tpdf diagrams/vps.dot -o output/vps.pdf

clean:
	rm -f output/*.svg output/*.png output/*.pdf
```

## Windows compatibility

Assume the project may be run on Windows.

Prefer commands compatible with:

- Git Bash
- MSYS2
- WSL
- GNU Make for Windows

Avoid Linux-only shell features unless documented.

## Suggested repository layout

```text
infra-docs/
├── AGENTS.md
├── Makefile
├── inventory/
│   └── vps.yaml
├── diagrams/
│   └── vps.dot
├── output/
│   ├── vps.svg
│   ├── vps.png
│   └── vps.pdf
└── docs/
    └── vps.md
```

## Agent behavior

When asked to update infrastructure documentation:

1. Update the structured inventory first.
2. Update Graphviz DOT files second.
3. Update Markdown documentation third.
4. Ensure `make all` can regenerate outputs.
5. Keep labels readable and not overcrowded.
6. Prefer SVG for documentation.
7. Keep sensitive connection data out of public diagrams.

## Commit messages

When a commit is requested, use this message structure:

1. Header of at most 3 words.
2. Blank line.
3. One sentence describing the purpose of the commit in more detail.
4. Blank line.
5. One or more paragraphs describing what the commit implements and how it
   works.

## Releases

When a release is requested, create release documentation under:

```text
doc/releases/v0.0.1/README.md
```

Use a release document that includes:

- Release title with version.
- Summary table for tag, date, commit range, and type.
- Commit summary table.
- Detailed "What changed" sections grouped by area.
- Impact on the running system.
- Prerequisites.
- Tag, push, deploy, verification, and rollback steps where applicable.

## Formatting changed files

After editing files, explicitly format the changed files before commit when an
npm formatter can handle them.

Use the generic file formatter for targeted paths, directories, or wildcard
sets:

```sh
npm run format:files -- AGENTS.md doc/**/*.md inventory/*.yaml package.json
```

Use `npm run format:check` before finishing work. Files not supported by
Prettier, such as Graphviz DOT files, should still be reviewed manually and
verified with `make all` when they affect generated diagrams.
