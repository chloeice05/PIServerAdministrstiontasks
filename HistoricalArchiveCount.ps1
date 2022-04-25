function Get-HistoricalPIArchiveCount {

    $piserverPath = $env:PISERVER

    $piartoolPath = (Get-Item -Path $piserverPath\adm\piartool.exe).FullName

    $piartoolAdOutput = & $piartoolPath -al
    

    foreach ($lines in $piartoolADoutput){
        if ($lines.StartsWith("Archive[")) {
        
        $arclist = $lines
        $totalarchivecount = $totalarchivecount +1

            if( $arclist.Contains('\future')) {
        
            $futurearccount = $futurearccount + 1
        
            }
        
        }

        $Archivecount= $totalarchivecount - $futurearccount

    }


 return $archivecount
 
}

Get-HistoricalPIArchiveCount