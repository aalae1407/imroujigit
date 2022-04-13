function Enable-TeamsExtension
{
    param(
        [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
        [System.String]
        $upn,

        [Parameter(Mandatory=$True, Position=1, ValueFromPipeline=$false)]
        [System.String]
        $DID

        )

    Connect-MicrosoftTeams
    Set-csuser -Identity $upn -EnterpriseVoiceEnabled $true -HostedVoicemail $true -OnpremLineURI "tel:+1$DID"
    Grant-CsOnlineVoiceRoutingPolicy -Identity $upn -PolicyName "Teams Voice Users"
    Grant-CsTenantDialPlan -Identity $upn -PolicyName "Teams-DID-Users"
}

Enable-TeamsExtension