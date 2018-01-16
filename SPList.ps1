#$cred = Get-Credential
#save credential in WIndows Credential Manager, Create a generic credential
$siteURL = "https://Yoursite.sharepoint.com/"
Connect-PnPOnline -Url $siteURL
Write-Host $siteURL
#Create List
$listName = "ListNamen"
$listDisplayName = "List Name"
New-PnPList -Title $listDisplayName -Url $listName -Template "GenericList"
Write-Host "created List"
#add fields to the list
$xml = "<Field Type='User' UserSelectionMode='PeopleOnly' Name='EmployeeName' DisplayName='Employee Name'/>"
Add-PnPFieldFromXml -List $listName -FieldXml $xml
$xml = "<Field Type='Text' Name='StaffNumber' DisplayName='Staff Number'/>"
Add-PnPFieldFromXml -List $listName -FieldXml $xml
for($i=1; $i -le 3; $i++)
{
    $xml = "<Field Type='Text' Name='NameOfInstitution$i' DisplayName='Name Of Institution $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='DateTime' Name='InstitutionDateStarted$i' DisplayName='Institution Date Started $i' Format='DateOnly'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml 
    $xml = "<Field Type='DateTime' Name='Institution DateEnded$i' DisplayName='Institution Date Ended $i' Format='DateOnly'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Text' Name='Course$i' DisplayName='Course $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Text' Name='Qualificaiton$i' DisplayName='Qualification $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Text' Name='Grade$i' DisplayName='Grade $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
}
for($i=1; $i -le 3; $i++)
{
    $xml = "<Field Type='Text' Name='PreviousEmployer$i' DisplayName='Previous Employer $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='DateTime' Name='EmployedDateStarted$i' DisplayName='Employed Date Started $i' Format='DateOnly'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml 
    $xml = "<Field Type='DateTime' Name='EmployedDateEnded$i' DisplayName='Employed Date Ended $i' Format='DateOnly'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Text' Name='Salary$i' DisplayName='Salary $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Text' Name='JobTitle$i' DisplayName='Job Title $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Text' Name='ReasonForLeaving$i' DisplayName='Reason For Leaving $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
}
for($i=1; $i -le 2; $i++)
{
    $xml = "<Field Type='Text' Name='References$i' DisplayName='References $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Text' Name='ReferenceAddress$i' DisplayName='Reference Address $i' />"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml 
    $xml = "<Field Type='Text' Name='Status$i' DisplayName='Status $i'/>"
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
    $xml = "<Field Type='Choice' Name='RefType$i' DisplayName='Ref Type $i'>
        <CHOICES>
            <CHOICE>Professional</CHOICE>
            <CHOICE>Academic</CHOICE>
            <CHOICE>Personal</CHOICE>
            <CHOICE>Former Employer</CHOICE>
        </CHOICES>
    </Field>
    "
    Add-PnPFieldFromXml -List $listName -FieldXml $xml
}

Write-Host "Fields Added"