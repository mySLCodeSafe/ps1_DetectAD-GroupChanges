# include:
. .\bin\core.ps1
. .\bin\baseFunctions_ActiveDirectory.ps1

# Script variables / Overide core:
$ADGroupForQuery="Accenture_Tech_Triage"
$lastRunDateFile=$inputFolder + "lastRun.data"

# Declare functions:
function validateChange([datetime]$lastRunDate, [datetime]$lastUpdateDate)
{
    echo $lastRunDate
    echo $lastUpdateDate
    if ($lastUpdateDate -ge $lastRunDate )
    {
        return $true
    }
    else {
        return $false
    }
}

# Main method:

try {
    # when was the script last executed:
    $input_lastRunDate = Get-Content -Path $lastRunDateFile | Convert-String
    echo $input_lastRunDate

    $lastRunDate=[datetime]::ParseExact("201901241611", "yyyyMMddHHmm", $null)
    #$lastRunDate=[datetime]::ParseExact($input_lastRunDate, "yyyyMMddHHmm", $null)
    echo $lastRunDate


    # when was the AD Group last modified:
    $ADGrpLastUpdated=Get-ADGroup -Identity $ADGroupForQuery -Properties * | Select-Object -ExpandProperty "whenChanged"

    # Did the AD group undergo a change after the last run
    #echo (validateChange $lastRunDate $ADGrpLastUpdated)
}
catch {
    throw $_
}


#Get-Date -Format yyyMMddHHmm
