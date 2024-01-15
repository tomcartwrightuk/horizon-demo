# Horizon Post Office Bugs demo

This application demonstrates the nature of the some of the bugs uncovered in the Horizon Post Office system. These bugs caused discrepancies in the accounts of Post Office branches 


ACID

Atomicity - all tran
Concistency
Isolation
Durability
&
User roles and remote access
Logging

After you have set up the demo by transferring funds to the Priory Post Office, you can perform two cash withdrawals on behalf of customers.
After this bugs will occur in the system that demonstrate how the Horizon failed to adhere to the ACID principles.


## Concepts to demo with this application and how

### Atomicity
If you deposit exactly £50 with the name Mr X, the transaction does not register in branch account but does in horizon

### Concistency
More money than available in branch cash account - branch account shows a withdrawal of only available funds but Horizon shows intended amount.

### Isolation
Something to do with report. Delay the sending of horizon transaction and then run report.

### Durability
Turn off horizon server. Money is withdrawn from the PO account and bank but not horizon. Turn on the server and it sends several messages

### Roles and remote access
Login to cash branch and change a transaction and re-run the report

### Debugging
For one or more of the above issues in the system, show how you can debug by getting information about each record using a common key
