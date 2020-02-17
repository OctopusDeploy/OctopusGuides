#!/bin/bash

/usr/lib/jvm/java-13-openjdk-amd64/bin/java \
  "--enable-preview" \
  "-Xmx2g" \
  "-Dwebdriver.gecko.driver=/usr/bin/geckodriver" \
  "-DstepPause=$STEP_PAUSE" \
  "-DCucumberAlias-GuideSpecificScreenshotDir=$SCREENSHOT_PATH" \
  "-DCucumberAlias-ExternalMediaPath=$MEDIA_PATH" \
  "-DmoveCursorToElement=$MOVE_TO_MOUSE_CURSOR" \
  "-DmouseMoveVerticalOffset=$MOUSE_VERTICAL_OFFSET" \
  "-DdisableHighlights=$DISABLE_HIGHLIGHTS" \
  "-DdisableScreenshots=$DISABLE_SCREENSHOTS" \
  "-DdisableVideoRecording=$DISABLE_VIDEO" \
  "-DslackHookUrl=$SLACK_HOOK_URL" \
  "-DscreenshotS3Enabled=$STHREE_SCREENSHOT_ENABLED" \
  "-DscreenshotS3Bucket=$SCREENSHOT_BUCKET" \
  "-DstepHandlerMessage=$GITHUB_SHA" \
  "-DslackStepHandlerEnabled=$SLACK_STEP_HANDLER" \
  "-DslackStepHandlerErrorOnly=$SLACK_ON_ERROR_ONLY" \
  "-DCucumberAlias-ExternalBrowserType=$BROWSER_TYPE" \
  "-DCucumberAlias-ExternalDockerImage=$DOCKER_IMAGE" \
  "-DCucumberAlias-ExternalOctopusDockerImage=$OCTOPUS_DOCKER_IMAGE" \
  "-DCucumberAlias-ExternalConfigFile=$CONFIG_FILE" \
  "-DCucumberAlias-ExternalConfigMountPath=$CONFIG_FILE_MOUNT_PATH" \
  "-DCucumberAlias-ExternalConfigFileName=$CONFIG_FILE_NAME" \
  -jar /opt/webdrivertraining.1.0-SNAPSHOT.jar \
  --tags "$CUCUMBER_TAGS" \
  --plugin "$CUCUMBER_PLUGIN" \
  features/octopus/octopus-php-nginx-project.feature
