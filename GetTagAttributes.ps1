# Connect to a PI Data Archive.  Example here connects to PIDA with same name as this computer.  
$piconn = Connect-PIDataArchive -PIDataArchiveMachine DEEPIKAVM001-PI  
# Get a list of PIPoints and include the 'engunits' point attribute  
$pitags = Get-PIPoint -name * -Connection $piconn -attributes name,pointid,pointsource,location1,location4
# Loop over each point in the point list  
foreach ($pitag in $pitags) {  
    $tagname = $pitag.Point.Name
    $ptid= $pitag.Attributes.pointid
    $ptsource = $pitag.attributes.pointsource 
    $loc1 = $pitag.Attributes.location1
    $loc4 = $pitag.Attributes.location4    
    Write-Host $tagname $ptid $ptsource $loc1 $loc4  
}  