#Check Readme file here: https://github.com/majkinetor/au/blob/master/README.md

import-module au

function global:au_GetLatest{
    $downloadPage = Invoke-WebRequest -Uri 'http://www.therenamer.com/'
    $version = $downloadPage.Content | Select-String -Pattern "latest version:.*?([\d\.]{3,})" | %{$_.Matches.Groups[1].Value}
    $downloadUrl = $downloadPage.Content | Select-String -Pattern "<a href=`"(.*?)`".*?title=`"Download theRenamer`"" | %{$_.Matches.Groups[1].Value}

    return @{ URL32 = $downloadUrl; Version = $version }
}

function global:au_SearchReplace{
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        'therenamer.nuspec' = @{
            "<version>\s*(.*)<\/version>"    = "<version>$($Latest.Version)</version>"
        }
     }
}

Update-Package