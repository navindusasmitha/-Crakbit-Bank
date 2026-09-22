# Crakbit Bank v1.6 Architecture

## Runtime

- Node.js HTTP server (`server.mjs`)
- v1.6 core-depth module (`v16.mjs`)
- Node built-in SQLite
- SPA frontend (`public/`)
- Local storage directories for backups, archives and controlled documents

## Layering

1. **Channels** — staff operations, retail Internet Banking, corporate banking, PWA, ATM/POS/QR simulators.
2. **Access & security** — MFA, sessions, role permissions, maker/checker, audit chain, field-level encrypted secret vault.
3. **Core banking** — customers, accounts, product factory, interest, loan lifecycle, collateral, deposits, mandates, cheque clearing.
4. **Payments** — internal transfers, ATM/POS/QR, merchant settlement, CEFTS/RTGS-style queues, SWIFT-style messaging.
5. **Finance & treasury** — double-entry journal, GL, suspense, manual GL adjustments, Nostro/Vostro, treasury blotter, ALM.
6. **Control** — AML/fraud, screening, cases, reconciliation, EOD/business-date controls, limits, exceptions.
7. **Enterprise** — corporate banking, bulk payments, trade finance, collections, service desk, documents, API/webhooks.
8. **Resilience** — backup/restore, restore-point simulation, schema versions, API metrics, load tests, retention policies.

## Accounting invariant

Every posted financial journal is represented by paired debit/credit ledger entries. The release test validates that total debits equal total credits after controlled GL adjustment posting.

## v1.6 security note

Sensitive values stored via the v1.6 secret-vault endpoint are encrypted with AES-256-GCM using a locally generated key at `data/v16-master.key`. This is field-level protection for the simulator and is not equivalent to production HSM-backed full-database encryption.
