# Crakbit Bank — Core Banking & Operations Suite v1.6

Crakbit Bank v1.6 is a local banking-platform simulator focused on core-banking depth, branch operations, double-entry accounting, digital and corporate banking, payments, treasury, risk, compliance, reconciliation and operational resilience.

## Quick start from GitHub

This repository includes the complete v1.6 release payload under `.release/v1.6/`. Large application source files are restored from that verified payload on the first run.

### Windows

1. Clone or download this repository.
2. Run `CHECK_SYSTEM.cmd` — it automatically restores the application source when needed and validates it.
3. Run `START_CRAKBIT_BANK.cmd`.
4. Open the URL shown by the launcher, normally `http://127.0.0.1:7979`.

You can also run `RESTORE_SOURCE.cmd` manually before starting the bank.

## Requirements

- Windows 10/11
- Node.js 22.5+ (Node 26 supported)
- No `npm install`
- No Docker
- No Prisma
- No external database server

The simulator uses Node.js built-ins and SQLite. Port **7979** is preferred; the server can move to the next available port if needed.

## Demo login

Password for all demo users: `ChangeMe123!`

- Admin: `admin@crakbit.bank`
- Manager: `manager@crakbit.bank`
- Teller: `teller@crakbit.bank`
- Compliance: `compliance@crakbit.bank`
- Auditor: `auditor@crakbit.bank`
- Retail customer: `customer@crakbit.bank`
- Corporate maker: `corporate@crakbit.bank`
- Corporate approver: `corp.approver@crakbit.bank`

MFA is enabled. The local demo displays the OTP after password verification.

## v1.6 highlights

- Product Factory for deposit, FD and loan products
- Interest engine and pricing/tax rule catalogues
- Loan restructuring + maker/checker and collateral management
- Standing orders / direct-debit mandates
- Cheque Clearing v2
- Nostro/Vostro and inter-branch settlement
- Suspense investigation/resolution
- Manual GL adjustments with independent approval
- Business-date and EOD v2 controls
- Branch open/close, teller transfers and cash denominations
- Operational limits and multi-approval chains
- Customer 360 v2, relationship graph and UBO register
- Relationship/PEP/watchlist screening simulator
- Treasury dealer limits and blotter
- ALM/liquidity gaps, NPL and profitability dashboards
- Exception Management Center
- AES-256-GCM field-level secret vault
- Restore-point simulation, migration history and load-test mode
- Light/dark professional UI, command palette and keyboard shortcuts

Earlier modules remain included: Internet Banking, corporate banking, payroll/bulk payments, ATM/POS/QR simulators, merchants, CEFTS/RTGS-style payments, SWIFT-style messaging, cards, KYC/AML, fraud, sanctions simulator, loans, fixed deposits, teller/vault operations, GL/reconciliation, service desk, API gateway, webhooks, notifications, PWA, BI, backup/DR and immutable audit chain.

See `FEATURE_MATRIX_v1.6.md`, `ARCHITECTURE.md` and `TEST_REPORT_v1.6.md` for more detail.

## Repository payload integrity

`restore-source.mjs` joins the five `.release/v1.6/*.b64` chunks, verifies the release ZIP using SHA-256 (`f36cadf9122588e15c7dba88ec2bcb1473746523116431010b308a0098612457`), extracts it locally, and restores only the large runtime source files (`server.mjs`, `v16.mjs`, `public/app.js`, `public/style.css`).

## Simulator boundary

This is a local engineering and banking-workflow simulator, not certified production core-banking software. SWIFT, RTGS/CEFTS, Visa/Mastercard, sanctions/PEP feeds, regulator submissions, SMS/email delivery and HSM/KMS are simulated or represented as integration boundaries. Production deployment requires certified integrations, production IAM/key management, independent security testing, HA/DR infrastructure and regulator-specific governance.
