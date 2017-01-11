$ErrorActionPreference = 'Stop';

$packageName= 'dattodrive'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.dattodrive.com/win/single/dattodrive-2.2.4.859-setup.exe'
$checksum   = '489516c802c9a635f67c0ef92fee48ff6218e1613e9a9ef33d13592990e39dec'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'datto*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs    = '/S'

  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
