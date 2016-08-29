$ErrorActionPreference = 'Stop';

$packageName= 'theRenamer'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.therenamer.com/downloads/theRenamer_Setup.exe'
$checksum   = '89C7330F23E1BA99610002B58E6F43DA6D41F3C75A549551C84A8C6FD90425CA'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'theRenamer*'

  checksum      = $checksum
  checksumType  = 'sha256'


  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs