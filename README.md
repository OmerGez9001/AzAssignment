# AzAssignment

The complete assignment. In here you will find:
1. The ARM template, which includes a simple-vm, 3 storages (one is bound to the vm and will not be used) and 2 containers.
2. The Script, which does Deployment to the ARM template and runs a script that creates, uploads and copies blobs from storage A to storage B
3. The Dashboard json, which holds the dashboard that monitors the server and the 2 storage accounts.

Important notes:
1. Due to limited authorization during this assignment (had issues with premissions and access, something relating to my account in general), I was unable to run the scripts in the vm, which affected the dashboard. Because of that, I just uploaded a dashboard with the needed metrics (vm and the 2 storage accounts) in order to show that I fully understood how it works.
2. For the same reason as above, I couldn't run the scripts in Azure DevOps. I did manage to run a pipeline with the script, but it seems that I couldn't proceed to the deployment stage (again, the issue was related to premissions).

