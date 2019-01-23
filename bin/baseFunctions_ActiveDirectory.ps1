############################################################################
# Description:
# Version/published date: v1/
############################################################################

# Purpose: Query AD for requied property
# Return: Required data
function QueryADGroupProperties
{
    param
    (
        # Parameter help description
        [Parameter (Mandatory=$true, HelpMessage="Please enter the AD Group you wish to query")]
        [string]$ADGroupName, [String] $requiredProperty
    )
    process
    {
        try {
            $result=Get-ADGroup -Identity $ADGroupName -Properties * | Select-Object -ExpandProperty $requiredProperty
        }
        catch {
            throw $_
            $result="Error"
        }
    }
    end
    {
        return $result
    }
}


# Purpose: Query AD for a list of AD logons of the requested AD group
# Return: List of AD logons
function QueryADGroupForUsers
{
    param
    (
        [Parameter (Mandatory=$true, HelpMessage="The name of the AD group you wish to query")]
        [string]$ADGroupName
    )

    process
    {
        Try
        {
            $result=Get-ADGroupMember -Identity $ADGroupName | Select-Object -ExpandProperty "SamAccountName" | Sort-Object -Property SamAccountName
        }
        Catch
        {
            throw $_
            # $Result="Error"
        }
    }
    end
    {
        return $result
    }
}


# Purpose: Indicates if a requested AD account is enabed
# Returns True|False|Error
function QueryADUserEnabledStatus
{
    param([string]$ADUser)

    process
    {
        Try
            {
                $result=(Get-ADUser -Identity $ADUser | Select-Object -ExpandProperty "Enabled")
            }
        Catch
            {
                $result="Error"
            }
    }
    end
    {
        return $result
    }
}