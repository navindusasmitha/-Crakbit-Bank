# Crakbit Bank v1.5 — Functional Test Report

Tested on a fresh v1.5 database using the local HTTP API and browser assets.

## Passed checks

- Admin MFA login
- Manager MFA login
- Retail customer MFA login
- Corporate maker and approver MFA login
- Enterprise overview and BI endpoints
- Corporate portal and mandate users
- Payroll/supplier batch creation and CSV validation
- Maker submission + independent multi-user approvals
- Atomic bulk execution
- Treasury liquidity + FX APIs
- Money-market position creation/readback
- Trade finance creation
- Credit-risk and collections APIs
- Advanced fraud-rule catalogue
- Sanctions/PEP demo hit generation
- Enterprise case APIs
- GL chart/summary and reconciliation
- Customer service ticket workflow
- Document hashing and corporate document scoping
- OAuth client creation/token/open-banking account read
- Webhook/notification gateway configuration APIs
- PWA manifest + service worker HTTP 200
- User language/consent preference update
- Archive creation with integrity hash
- High-risk admin change request + independent approval
- Audit hash-chain verification
- Monitoring/health endpoint
- DR simulation
- Receipt creation + verification endpoint
- Static UI/JS/CSS delivery
- JavaScript and server syntax checks

## Ledger result from integration test

- Total debit: LKR 2,001,000.00
- Total credit: LKR 2,001,000.00
- Balanced: TRUE

The final distributed ZIP is cleaned of integration-test database records so it starts with fresh seeded demo data on first launch.
