# This is a script designed to loop over a list of links, load the web page, and then load all the links found
# in the page looking for HTTP errors that indicate dead links.

$errorPages = @()

foreach($line in Get-Content .\links.txt)
{
    if (-not [string]::IsNullOrEmpty($line))
    {
        Write-Host "Testing $line"

        & "C:\Program Files\Java\jdk-13\bin\java.exe" `
        --enable-preview `
        "-Dio.netty.leakDetection.level=DISABLED" `
        "-Dwebdriver.gecko.driver=C:\tools\geckodriver.exe" `
        "-DstepPause=$STEP_PAUSE" `
        "-DCucumberAlias-ExternalBrowserType=FirefoxHeadless" `
        "-DCucumberAlias-ExternalURL=$line" `
        -jar ..\WebDriverTraining\target\webdrivertraining.1.0-SNAPSHOT.jar `
        features\verify\verify.feature

        if ($LASTEXITCODE -ne 0)
        {
            $errorPages += $line
        }

        #break
    }
}

if ($errorPages.Count -ne 0)
{
    Write-Host "Found errors:"
    $errorPages | % { Write-Host $_ }
}