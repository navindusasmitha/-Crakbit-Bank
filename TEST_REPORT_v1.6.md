# Crakbit Bank v1.6 — Release Test Report

Fresh-database integration test completed successfully.

## Passed flows

- Health/version 1.6
- Admin / Manager / Teller MFA login
- v1.6 overview, Product Factory, business-date, ALM, profitability, resilience and regulatory endpoints
- Loan creation
- Loan restructure maker/checker
- Collateral registration
- Branch open workflow
- Inter-branch settlement position
- Cash denomination update/read
- Two teller sessions and teller-to-teller cash transfer
- Cash shortage/excess exception creation
- Customer relationship creation
- Beneficial owner registration
- PEP-style relationship screening simulator
- Suspense creation and resolution
- Manual GL adjustment maker/checker posting
- Exception retry and resolve
- Mock notification delivery
- AES-GCM secret-vault write
- Point-in-time restore-point checkpoint
- 10,000-row synthetic load test
- Teller balancing/close
- Business-date close and next-business-day advance
- Trial balance integrity

## Ledger result

- Total debit: LKR 2,000,125.00
- Total credit: LKR 2,000,125.00
- Result: **BALANCED**

The release ZIP is reset after testing and contains no integration-test database.
