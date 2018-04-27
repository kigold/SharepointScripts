<# PROBLEM
   You have a sharepoint List with some workflow running on the items,
   Some Workflows are suspended for one reason or the other,
   You want to Resume all the workflows that are Suspended.
   You can do this manually, one at a time using your web browser,
   Or you can just run this script

   SOLUTION
   This script will loop through your list, and for each item, it will get the workflow running on the item with the name you specified
   and if the workflow's status matches the Status you set (Suspended), then it will resume it

   EXTENSION
   You extend this script to Stop and Resart Workflows, thats if you ever need that,
   Just go to this site https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps.
   that is you will replace 
     Resume-PnPWorkflowInstance
    with    
     Stop-PnPWorkflowInstance && Start-PnPWorkflowInstance
    i think thats all you need.
#>
#set values
$siteURL = "https://<site-Name>.sharepoint.com"
$listName = "<List Name>"
$WF_Name = "<Workflow Name"

Connect-PnPOnline -Url $siteURL
Write-Host $siteURL

#get List items
$L = Get-PNPList $listName
$list = Get-PnPListItem -List $listName
$WF_SubID = Get-PnPWorkflowSubscription -Name $WF_Name -list $L
write-host "List Count:" $list.Count
write-host "Subscription ID:" $WF_SubID.Id
$listcount = 0;
$count = 0;
$resumed = 0;
foreach( $item in $list) 
{
    $listcount ++
    write-host "ListCOunt" $listCount
    Get-PnPWorkflowInstance -List $L -ListItem $item | Where-Object {$_.WorkflowSubscriptionId -eq $WF_SubID.id} |
        Foreach-Object {
            $count ++;
            Write-host " "
            Write-host "############################### " $count "################################"
            Write-host "#WOrkflowID: " $_.Id
            #Write-host "#WOrkflowSubID: " $_.WorkflowSubscriptionId
            Write-host "#status: " $_.Status
            if ($_.Status -eq "Suspended"){
                Resume-PnPWorkflowInstance -Identity $_
                write-host "***********resuming a workflow Instance for:" $item["Title"] "****************"
                $resumed ++;
            }
        }
}
write-host "Total Workflow that were Resumed: " $resumed