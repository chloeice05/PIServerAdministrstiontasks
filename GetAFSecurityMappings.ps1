#Set the AF Server and the AF Database
$AFServer= Get-AFServer -Name "DeepikaVM001-PI"
$DBCount=(Get-AFDatabase -AFServer $AFServer).count

Write-Host "`n`n Database Security`n`n"

#Loop through each Database to fetch the security settings associated with the DB
For($i=0;$i -lt $DBCount;$i++){
    $AFDB=Get-AFDatabase -index $i -AFServer $AFServer
    $AFDBSec=get-AFSecurity -AFObject $AFDB
    Write-host "Name" $AFDB,"`n", "Security"$AFDBsec
}

#Fetch names of all users for each Identity
Write-Host "`n`n Security Identities`n`n"

$AFmapcount= (Get-AFSecurityMapping -Name * -Refresh -AFServer $AFServer).count

for($i=0;$i -lt $afidcount;$i++){
    $AFSecmap=get-AFSecurityMapping -index $i -Refresh -AFServer $AFServer|Select-Object SecurityIdentity,Name| Sort-Object SecurityIdentity
    Write-host $AFSecmap
}


