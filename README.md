Create a basic setup of your infrastructure code and Cloud provider.
Create a simple definition of any Cloud resource.
Verify connectivity with Cloud provider.
Deploy any resource using infrastructure code to verify connectivity to the Cloud provider.
Create the IaC setup.
Add the code to deploy the following resources: dedicated space for resources (resource group, etc.), private network, public endpoint, load balancer, vault (secret manager or similar service), serverless function, storage account.
The public endpoint (IP) should be bounded to the load balancer, load balancer should balance traffic for the function and have connectivity only to this function.
All resources, except load balancer, should be deployed in a private network. Access between these resources should use only a private network.
Add IAM permissions for the resources: the function should have access to the storage account (not all available storage accounts) and vault (secret manager or similar service).
Add a code for the connection between the function, storage account and vault (secret manager or similar service). It should have both IAM and private networking access.
Add a simple code for the function.
Function should be able to take a value from the Vault (secret manager or similar service) and print its value. To test connectivity between the function and vault.
By call to the function it should be able to list all the files in the storage account and return it as a response. To test connectivity between the function and storage account.

Deploy resources and verify the whole setup.
Verify the infrastructure setup. Check if resources have IAM and private networking access to each other, check if no resources are exposed to the internet.
Verify the function setup. Check if the function can retrieve a value from the Vault (secret manager or similar service), and get a list of the files from the storage account.
