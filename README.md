# Crakbit Bank — Core Banking & Operations Suite v1.6

Crakbit Bank v1.6 is a local banking-platform simulator focused on deeper core-banking behaviour, controlled branch operations, accounting integrity, enterprise risk, digital banking, corporate banking and operational resilience. It keeps the v1.5 enterprise modules and adds a new v1.6 core depth layer.

## Requirements

- Windows 10/11
- Node.js 22.5+ (Node 26 supported)
- No `npm install`
- No Docker
- No Prisma
- No external database server

The package uses Node.js built-ins and SQLite. Default port is **7979**; the launcher automatically moves to the next available port if required.

## Start

1. Extract the ZIP to a new folder.
2. Run `CHECK_SYSTEM.cmd`.
3. Run `START_CRAKBIT_BANK.cmd`.
4. Open the URL shown by the launcher (normally `http://127.0.0.1:7979`).

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

## v1.6 additions

### Product & core-processing depth
- Product Factory for deposit, term-deposit and loan products.
- Product currency, minimum balance, eligibility, rate, penalty and tier-rule configuration.
- Interest engine with daily-accrual simulation and tracked accrual runs.
- Pricing/fee-rule catalogue with segment/product targeting, waivers and caps model.
- Tax/withholding rule catalogue.
- Loan restructure workflow with independent maker/checker approval.
- Collateral register with market value, forced-sale value, valuation/insurance dates and LTV data.
- Standing-order/direct-debit mandates with frequency, next-run and retry controls.
- Cheque Clearing v2: inward/outward presentation, signature status, clear/return/hold and return reasons.
- Nostro/Vostro correspondent-account register.
- Inter-branch settlement positions.
- Suspense-account investigation and resolution workflow.

### Accounting, EOD and operational controls
- Manual GL adjustment workflow with evidence reference and maker-checker posting.
- Business-date control with close and next-business-day advance.
- Weekend/holiday calendar model.
- EOD v2 blocking gates for open tills and high/critical operational exceptions.
- Operational-limit matrix by role/branch/product/channel/transaction type.
- Branch opening/closing workflow by business date.
- Teller-to-teller cash transfer.
- Cash denomination tracking for vault/till owners.
- Cash shortage/excess exception workflow.
- Four-eyes / multi-approval chain catalogue and delegation model.
- Role templates for branch operations, credit and supervision.

### Customer intelligence and financial-crime depth
- Customer 360 v2 with products, loans, collateral, cases and service history.
- Customer relationship graph.
- Beneficial-ownership register.
- Relationship/watchlist/PEP screening simulator.
- Universal search across customers, accounts, loans, cases and transactions.
- Case SLA matrix and service-escalation model.
- Customer/bank secure messaging.

### Treasury, ALM and profitability
- Treasury dealer-limit register.
- Dealer blotter for FX spot/forward and money-market simulations.
- FX rate board retained from v1.5.
- ALM maturity-bucket gap view.
- Liquidity metrics and loan/deposit ratio.
- Branch profitability view.
- Product profitability view.
- Customer profitability model.
- NPL ratio / arrears portfolio indicators.
- Regulatory-style liquidity, credit and large-exposure pack.
- Exportable CSV management pack.

### Resilience, governance and security
- Exception Management Center with retry/resolve controls.
- Data-retention policy register.
- Schema migration/version history.
- Encrypted local secret vault using AES-256-GCM field-level encryption.
- Local master-key file generated at first startup.
- Point-in-time restore-point simulation via SQLite checkpoint copy.
- API performance metrics and slow-endpoint view.
- Synthetic 10K/100K load-test mode.
- Existing scheduled backups and DR simulation retained.
- Immutable audit hash chain retained.
- High-risk admin maker/checker retained.

### UX / accessibility
- Professional black/white/graphite interface retained.
- Light/dark mode.
- Command palette: **Ctrl/Cmd + K**.
- Dashboard shortcut: **Alt + 1**.
- Stronger keyboard focus indicators.
- Responsive tablet/touch controls.
- English/Sinhala preference retained.
- Secure-message center for retail and corporate portals.

## v1.5 and earlier retained

Corporate banking, payroll/bulk payments, treasury, trade finance, credit risk, collections, fraud, sanctions/PEP simulator, enterprise case management, GL, reconciliation, service desk, document management, digital signatures, API gateway, webhooks, notification gateway, PWA, BI, backup/DR, monitoring/jobs, multi-branch/multi-currency, receipt/barcode verification, customer consent, data archive/audit chain, ATM/POS/QR, merchants, CEFTS/RTGS-style transfers, SWIFT-style messages, Internet Banking, MFA/devices/sessions, KYC/onboarding, cards, teller/vault, loans, fixed deposits and double-entry accounting.

## Security / simulator boundary

This package is a **local engineering and banking-workflow simulator**, not production core-banking software for a licensed bank. SWIFT, RTGS/CEFTS, Visa/Mastercard, sanctions/PEP data, SMS/email delivery and regulatory reports are simulated. The AES-GCM secret vault protects values stored through that vault; the SQLite database file itself is **not fully encrypted**. A real deployment requires HSM/KMS, certified rails, regulator-specific controls, production IAM, independent security testing, HA/DR infrastructure and formal operational governance.
