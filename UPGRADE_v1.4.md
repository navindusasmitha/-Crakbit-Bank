# Upgrade notes — v1.4

v1.4 builds on v1.3 and adds the payments/channel layer.

Major additions:

- Payments Hub
- ATM network + simulator
- POS network + authorization simulator
- Merchant management + settlement records
- QR issuance and payments
- CEFTS/RTGS simulation
- RTGS maker-checker
- Interbank settlement and return workflow
- SWIFT-style message simulation
- Fraud scoring queue
- Dispute center
- Payment reporting
- v1.4 payment settings
- professional payments UI

For the safest test, extract v1.4 into a new folder. If you copy an older `data\crakbit-bank.sqlite` into v1.4, startup migrations add the v1.4 tables and columns automatically. Keep a backup of old data before migration.
