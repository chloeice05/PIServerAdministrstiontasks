#Set the AF Server and the AF Database
$AFServer= Get-AFServer -Name "DeepikaVM001-PI"
$AFDB=Get-AFDatabase -name DeepikaTest -AFServer $AFServer

#Fetch EventFrames for the AF Database between the specified Start and End Time
$EventFramesall= Find-AFEventFrame -StartTime "20-SEP-19" -EndTime "23-oct-19" -AFDatabase $AFDB

#Filter the Event Frames that belong to a certain template
$EventFrames= $EventFramesall|Where-Object{$_.Template -like 'LowTemperature' }

#Delete Event Frames if CanBecAcknowledged is False
Foreach ($EventFrame in $eventFrames){


    if ($EventFrame.CanBeAcknowledged -like "False"){

    Remove-AFEventFrame -AFEventFrame $EventFrame -CheckIn

    }

}