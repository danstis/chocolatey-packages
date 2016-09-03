$ErrorActionPreference = 'Stop';

$packageName= 'dattodrive'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.dattodrive.com/win/dattodrive-2.1.1.623-setup.exe'
$checksum   = '5f167f13dca2172045c719b06629e3af00fa16f1d3a05bb5406a014b04c7b7c9'

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
