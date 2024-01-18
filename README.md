# Horizon Post Office Bugs demo

This application demonstrates the nature of the some of the bugs uncovered in the Horizon Post Office system. These bugs caused discrepancies in the accounts of Post Office branches

## Start the application

```
docker compose build post-office
docker compose build horizon
docker compose up post-office
docker compose up horizon
```

## ACID

Atomicity
Concistency
Isolation
Durability
&
User roles and remote access
Logging

## Concepts to demo with this application and how

### Atomicity
Make a deposit but cancel it. The deposit will show in horizon but not in bank and PO ledgers. Reconcile to show that the cash account is in deficit.

### Concistency
More money than available in branch cash account - branch account shows a withdrawal of only available funds but Horizon shows intended amount so money is owed to PO account.

### Isolation
Make a withdrawal. Change the delay for sending of horizon record and then run reconciliation report which will show discrepancy.

### Durability
Turn off horizon server and deposit some money. Money will go into PO account and bank but not horizon. Turn on the Horizon server and it sends several messages resulting in many instances of that transaction.

### Roles and remote access
Login to cash branch and change a transaction and re-run the report

### Debugging
For one or more of the above issues in the system, show how you can debug by getting information about each record using a common key
