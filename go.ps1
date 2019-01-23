# include:
. .\bin\baseFunctions_ActiveDirectory.ps1


# Script variables / Overide:
$tmpFileName=get-date -Format FileDateTime
$outputFolder=".\output"


QueryADGroupForUsers "Accenture_Tech_Triage" | Out-File -FilePath $outputFolder\shami.csv