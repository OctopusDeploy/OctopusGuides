& "C:\Program Files\OpenJDK\$((Get-ChildItem "C:\Program Files\OpenJDK\")[0])\bin\java" `
    "--enable-preview" `
    "-Xmx2g" `
    "-Dwebdriver.gecko.driver=C:\tools\geckodriver.exe" `
    "-DstepPause=$STEP_PAUSE" `
    "-DCucumberAlias-ExternalArtifactoryKey=$env:ARTIFACTORY_KEY" `
    "-DmoveCursorToElement=$env:MOVE_TO_MOUSE_CUSROR" `
    "-DmouseMoveVerticalOffset=$env:MOUSE_VERTICAL_OFFSET" `
    "-DdisableHighlights=$env:DISABLE_HIGHLIGHTS" `
    "-DdisableScreenshots=$env:DISABLE_SCREENSHOTS" `
    "-DdisableVideoRecording=$env:DISABLE_VIDEO" `
    "-DslackHookUrl=$env:SLACK_HOOK_URL" `
    "-DslackStepHandlerEnabled=$env:SLACK_STEP_HANDLER" `
    "-DslackStepHandlerErrorOnly=$env:SLACK_ON_ERROR_ONLY" `
    "-DscreenshotS3Enabled=$env:STHREE_SCREENSHOT_ENABLED" `
    "-DscreenshotS3Bucket=$env:SCREENSHOT_BUCKET" `
    "-DstepHandlerMessage=$env:GITHUB_SHA" `
    "-DCucumberAlias-GitUrl=$env:GIT_URL" `
    "-DCucumberAlias-ArtifactPath=$($env:NUGET_PATH)RandomQuotes.1.0.`${bamboo.buildNumber}.nupkg" `
    "-DCucumberAlias-ExternalOctopusAPIKey=$((cat C:\octopus_api.txt).Trim())" `
    "-DCucumberAlias-ExternalMediaPath=$env:MEDIA_PATH" `
    "-DCucumberAlias-GuideSpecificScreenshotDir=$env:SCREENSHOT_PATH" `
    "-DCucumberAlias-ExternalBrowserType=FirefoxNoImplicitWait" `
    "-DCucumberAlias-Hostname=$(hostname)" `
    "-DCucumberAlias-ExternalBambooPlugin=C:\tools\bamboo.jar" `
    -jar c:\tools\webdrivertraining.1.0-SNAPSHOT.jar `
    --tags $env:CUCUMBER_TAGS `
    --plugin progress `
    features\bamboo\bamboo-aspnet-project.feature
