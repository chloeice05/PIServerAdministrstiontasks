#Define the piserver to grab data from

$con = Connect-PIDataArchive -PIDataArchiveMachine DEEPIKAVM002  


#define input file

$InputFile = 'C:\Deepika\WorkingFolder\Dupdata.csv'

#Add values from the csv files
Import-Csv $InputFile -Header time,value | % {

   Add-PIValue -PointName LDPE.Osisoft.Z3 -Value $_.value -Time $_.time -WriteMode Append -Connection $con

   }