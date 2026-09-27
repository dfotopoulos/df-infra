# Public VPS Inventory

This document describes the public VPS inventory rendered from
`diagrams/vps.dot`.

Sensitive operational details are intentionally excluded. Do not add VNC
endpoints, admin ports, passwords, tokens, private keys, or credentials to this
public document or its public diagram.

## Generated outputs

Run:

```sh
make all
```

Expected outputs:

- `output/vps.svg`
- `output/vps.png`
- `output/vps.pdf`

## Inventory

| Server      | Public IPv4     | IPv6           | Location       | Host system ID | OS                       | VPS plan   |
| ----------- | --------------- | -------------- | -------------- | -------------- | ------------------------ | ---------- |
| Romania     | 157.173.127.220 | Not documented | Romania        | Not documented | Arch Linux               | Hub Europe |
| Poland      | 213.199.38.135  | Not documented | Poland         | Not documented | Debian 13 Trixie         | Hub Europe |
| Denmark     | 95.111.236.11   | Not documented | Denmark        | Not documented | Arch Linux               | Hub Europe |
| Czech       | 158.220.114.68  | Not documented | Czech Republic | Not documented | Arch Linux               | Hub Europe |
| Netherlands | 85.208.51.73    | Not documented | Netherlands    | Not documented | Arch Linux               | Hub Europe |
| Germany     | 158.220.98.11   | Not documented | Germany        | Not documented | Debian 12                | Hub Europe |
| Finland     | 45.136.17.165   | Not documented | Finland        | Not documented | Rocky Linux 9            | Karlsruhe  |
| Norway      | 176.57.184.69   | Not documented | Norway         | Not documented | OS installed by customer | Hub Europe |
| Sweden      | 176.57.150.81   | Not documented | Sweden         | Not documented | Debian 12                | Hub Europe |

## Diagram source

The canonical diagram source is `diagrams/vps.dot`. Generated diagram files in
`output/` should be regenerated with `make all` instead of edited manually.

## `sweden-contabo.fyi`

### Docker host ports bound to `127.0.0.1`

|  Port | Service / Container                    |
| ----: | -------------------------------------- |
|    80 | `oneuptime-ingress-1`                  |
|   443 | `oneuptime-ingress-1`                  |
|  3002 | `oneuptime-app-1`                      |
|  3306 | `kimai-kimai_mysql-1`                  |
|  5000 | `nexus`                                |
|  5400 | `oneuptime-postgres-1`                 |
|  5432 | `postgres`                             |
|  5433 | `timescaledb`                          |
|  6379 | `oneuptime-redis-1`                    |
|  8001 | `kimai-kimai-1`                        |
|  8081 | `nexus`                                |
|  8082 | `kanboard-kanboard-1`                  |
|  8084 | `wordpress-sandbox-wordpress-1`        |
|  8085 | `wordpress-gutenberg-wordpress-1`      |
|  8086 | `wordpress-classic-editor-wordpress-1` |
|  8087 | `planka`                               |
|  8088 | `youtrack`                             |
|  8089 | `it-tools`                             |
|  8095 | `oneuptime-ingress-1`                  |
|  8123 | `oneuptime-clickhouse-1`               |
|  9000 | `oneuptime-clickhouse-1`               |
| 13245 | `it-tools`                             |
| 13306 | `kanboard-db-1`                        |
| 13307 | `wordpress-sandbox-db-1`               |
| 13308 | `wordpress-gutenberg-db-1`             |
| 13309 | `wordpress-classic-editor-db-1`        |
| 13443 | `kanboard-kanboard-1`                  |
| 15432 | `planka-postgres`                      |
| 23306 | `mysql-9`                              |
