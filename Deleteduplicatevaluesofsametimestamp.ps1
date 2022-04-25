
#Set PI Server Name
$con = Connect-PIDataArchive -PIDataArchiveMachine DEEPIKAVM002

#Set the time Period for which the archive values need to be deleted.
$starttime='01-oct-2019 10:00:00'
$endtime='01-Oct-2019 10:00:00'

#Provide the point name against the -Point Name parameter

$pivalues=(Get-PIValue -PointName LDPE.Osisoft.Z3 -StartTime $starttime -EndTime $endtime -Connection $con)

$count=$pivalues.count
$arsize=$count-1

For($i=0;$i -lt $arsize;$i++){


Remove-PIValue -Event $pivalues[$i] -Connection $con 
 
}

