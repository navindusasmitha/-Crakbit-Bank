# v1.6 Feature Matrix

## Core / product depth
- Product Factory — implemented
- Interest Engine v2 — daily accrual runs + tier/penalty/floating-rule model
- Loan Engine v2 — existing EMI/schedule flows retained + restructure/moratorium model and approval
- Collateral Management — implemented
- Standing Orders / Direct Debits — implemented
- Cheque Clearing v2 — implemented
- Nostro / Vostro — implemented
- Inter-branch settlement — implemented
- Suspense management — implemented
- Fee / pricing engine v2 — implemented rule catalogue/model
- Tax / withholding engine — implemented rule catalogue/model
- Regulatory-style report pack — implemented simulator

## Operations / controls
- EOD v2 / business-date controls — implemented
- Holiday/business calendar — implemented
- Operational limit matrix — implemented
- Dual control / maker-checker — implemented across GL/high-risk flows
- Manual GL adjustment workflow — implemented
- Exception Management Center — implemented
- Data-retention policies — implemented
- Branch opening/closing — implemented
- Teller-to-teller transfers — implemented
- Cash denomination tracking — implemented
- Cash shortage/excess workflow — implemented

## Security / resilience
- Sensitive-config field encryption — AES-256-GCM secret vault
- Key-management simulator — local master key lifecycle
- Secrets/config vault — implemented
- Schema migration/version history — implemented
- Scheduled backups / DR — retained from v1.5
- Restore-point simulation — implemented
- Performance dashboard — implemented
- 10K / 100K synthetic load-test mode — implemented

## Customer / compliance depth
- Customer relationship graph — implemented
- Beneficial Ownership Register — implemented
- Relationship/watchlist screening simulator — implemented
- Case SLA matrix — implemented model
- Complaint/service escalation — implemented API/model
- Customer 360 v2 — implemented
- Universal Search — implemented

## Access / workflow
- Role templates — implemented model/catalogue
- Four-eyes / multi-approval chains — implemented
- Approval delegation — implemented API/model
- Notification templates — implemented
- Mock email/SMS/push inbox — implemented
- Customer secure messaging — implemented
- Corporate beneficiary templates — implemented API/model
- Bulk recovery / partial-failure action register — implemented API/model

## Treasury / profitability
- Treasury dealer limits — implemented
- Dealer blotter — implemented
- FX rate board — retained
- Liquidity gap / ALM — implemented
- Branch profitability — implemented
- Product profitability — implemented
- Customer profitability — implemented
- NPL ratio / portfolio-at-risk indicators — implemented
- Exportable management pack — CSV export

## UX
- Professional monochrome banking UI — retained and expanded
- Light / dark mode — implemented
- Keyboard shortcuts — implemented
- Command palette — implemented (`Ctrl/Cmd + K`)
- Responsive tablet/touch mode — implemented
- Accessibility focus indicators — implemented

## Simulator boundary
Real external payment rails, card networks, sanctions feeds, regulator submissions, HSM/KMS and production-grade database encryption remain integration boundaries rather than live external connections.
