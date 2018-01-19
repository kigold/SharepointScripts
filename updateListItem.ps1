$siteURL = "https://yoursite.sharepoint.com/sites/hr"
Connect-PnPOnline -Url $siteURL
Write-Host $siteURL
$listName = "Staff_database"
#get List items
$list = Get-PnPListItem -List $listName
write-host $list.Count
#update each items
foreach($item in $list){
    Set-PnPListItem -List $listName -Identity $item -Values @{"EmploymentType" = "Permanent"};
}
#update each list item that is not a particular value
foreach($item in $list){
    if (-Not $item.FieldValues["EmploymentType"] -eq "Permanent"){
        Set-PnPListItem -List $listName -Identity $item -Values @{"EmploymentType" = "Permanent"};
    }
}

