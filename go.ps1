# include:
. .\bin\core.ps1
. .\bin\baseFunctions_ActiveDirectory.ps1


# Script variables / Overide:

$outputFolder=".\output"


QueryADGroupForUsers "Accenture_Tech_Triage" | Out-File -FilePath $tmpFile