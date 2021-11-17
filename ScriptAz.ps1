#Connect to account using Connect-AzAccount first
Connect-AzAccount -UseDeviceAuthentication



#First command: Deploy ARM template
New-AzResourceGroupDeployment -ResourceGroupName RsGroupOG -TemplateFile .\finalTemplate.json
	 

#Second command: Run script

#part 1 - get storage accounts
$allstorage = Get-AzStorageAccount -ResourceGroupName RsGroupOG 

##NOTE - There's a total of 3 storage accounts, but the first one ($allstorage[0]) is missing a container (it came together with the simple-vm and I couldn't delete it without breaking the template), So the script will run on $allstorage[1] and $allstorage[2], which have containers



#part 2 - create and upload blobs
for ($num = 0; $num -lt 100; $num++){az storage blob upload --account-name $allstorage[1].StorageAccountName --container-name container1 --name helloworld+[string]$num --file helloworld+[string]$num --auth-mode login}


#part 3 - copy blobs to storage 2

$context = ($allstorage[1]).context
$sas = New-AzStorageAccountSASToken -Context $context -Service Blob,File,Table,Queue -ResourceType Service,Container,Object -Permission racwdlup
$strg1 = "https://" + $allstorage[1].StorageAccountName + ".blob.core.windows.net/Container1" + $sas

$context = ($allstorage[2]).context
$sas = New-AzStorageAccountSASToken -Context $context -Service Blob,File,Table,Queue -ResourceType Service,Container,Object -Permission racwdlup
$strg2 = "https://" + $allstorage[2].StorageAccountName + ".blob.core.windows.net/Container2?" + $sas

azcopy cp $strg1 $strg2
