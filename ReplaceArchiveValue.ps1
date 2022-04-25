$con = Connect-PIDataArchive -PIDataArchiveMachine DEEPIKAVM002
$starttime='23-JUL-2019 10:00:00'
$endtime='18-AUG-2019 10:00:00'

$pivalues=(Get-PIValue -PointName LDPE.Osisoft.Z1 -StartTime $starttime -EndTime $endtime -Connection $con)

$count=$pivalues.count
$arsize=$count-1

For($i=0;$i -lt $count;$i++){

$originalvalue=$pivalues[$i]

If ($originalvalue>0) { 

Add-PIValue -PointName LDPE.Osisoft.Z1 -Value 0 -Time $pivalues[$i].TimeStamp -WriteMode replace -Connection $con
 
}
}
