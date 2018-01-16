# Sharepoint Automation with Power Shell

This is a collection of Powershell Scripts that would make basic sharepoint development tasks easier to perform.

## Getting Started

Install Power Shell on your Windows PC.
Click on the link below to view the setup requirements, this would enable you utilize SharePointPnP.PowerShell Commands.

[Click Here](https://github.com/SharePoint/PnP-PowerShell)

## Setting up Authentication
1. Go to control panel on your laptop and look for Credential Manager
2. Click on WIndows Credentials
3. Scroll to Generic Credentials and click "Add a generic credential"
4. Then fill the fields with your credentials
Internet or network address : Url of your sharepoint site
User Name: Your User Name
Password : Your Password 
5. Then click ok
Note, this saves your credentials onto the PC, if you cannot afford to do this, you can skip the steps in "Setting up Authentication", this would require that you manually type your credential everytime you run the script.


## Running the Scripts


1. Clone this repository
2. Edit the script by changing certain parameters to suit your enviroment,
such as site Url, List name etc.
3. Launch Power Shell with Administators priviledge on your PC
4. 
```
cd path/of/repo
```
5. Type the name of the script
```
name_of_script
```
6. Press enter, if all goes well, you should see prompts that were put in the script

...and thats all folks

### Break down into end to end tests