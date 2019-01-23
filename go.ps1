# include:
. .\bin\core.ps1
. .\bin\baseFunctions_ActiveDirectory.ps1

# Script variables / Overide:
$ADGroupForQuery="Accenture_Tech_Triage"

function validateChange([datetime]$lastRunDate, [datetime]$lastUpdateDate)
{
    echo $lastRunDate
    echo $lastUpdateDate
    if ($lastRunDate -ge $lastUpdateDate )
    {
        return $true
    }
    else {
        return $false
    }
}


# Main method:
$ADQueryPropertyResult=(QueryADGroupProperties $ADGroupForQuery "whenChanged") #| Out-File $inputFolder\lastRun.data

$lastRun=Get-Date '01/20/2019'

echo (validateChange $lastRun $ADQueryPropertyResult)