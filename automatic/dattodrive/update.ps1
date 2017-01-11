#Check Readme file here: https://github.com/majkinetor/au/blob/master/README.md

import-module au

function global:au_GetLatest{
    $downloadPage = Invoke-WebRequest -Uri 'https://download.dattodrive.com/'
    $version = $downloadPage.Content | Select-String -Pattern "/dattodrive-([\d\.]*?)-.*?exe" | %{$_.Matches.Groups[1].Value}
    $downloadUrl = "https://download.dattodrive.com" + ($downloadPage.Content | Select-String -Pattern "href=`"(/win/.*?)`".*?Windows" | %{$_.Matches.Groups[1].Value})

    return @{ URL32 = $downloadUrl; Version = $version }
}

function global:au_SearchReplace{
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        'dattodrive.nuspec' = @{
            "<version>\s*(.*)<\/version>"    = "<version>$($Latest.Version)</version>"
        }
     }
}

Update-Package