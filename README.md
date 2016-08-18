# ICPDoNotBackup

The only goal of ICPDoNotBackup plugin is to avoid your iOS / Cordova app to be rejected by App Store Validation Team because of Google Analytics SDK for iOS.

From the iOS Guidelines, any file in the '/Library' directory is automatically stored in iCloud, except if the 'do not backup' attribute is set. 
[https://developer.apple.com/icloud/documentation/data-storage/index.html](https://developer.apple.com/icloud/documentation/data-storage/index.html)

Google Analytics SDK for iOS generates some files at the root of '/Library'. These files can be more than 6Mo and they have not the 'do not backup' attribute. So your app will be rejected because :

> On launch and content download, your app stores 6.6 MB on the user's iCloud, which does not comply with the iOS Data Storage Guidelines.

This issue is confirmed : [Issue 556:	iOS SDK: Could results in rejection in review due to 2.23(iCloud Backup)](https://code.google.com/p/analytics-issues/issues/detail?id=556)

As I cannot wait for Google Analytics to be updated, I wrote this plugin for Cordova apps to set the 'do not backup' attribute on Google Analytics files as recommended in the previous link.


#INSTALLATION

This plugin has been tested on cordova-ios 4.1.1

`cordova plugin add https://github.com/guillaumebarre/ICPDoNotBackup`


#USAGE

At launch, after the 'deviceready' event, just use the unique method of this plugin :

    window.cordova.plugins.ICPDoNotBackup.setDoNotBackup();


