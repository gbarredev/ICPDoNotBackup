/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "ICPDoNotBackup.h"
#import <Cordova/CDV.h>

@implementation ICPDoNotBackup

- (void) setDoNotBackup: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSArray *fileNames = @[
        @"googleanalytics-v2.sql",
        @"googleanalytics-v2.sql-shm",
        @"googleanalytics-v2.sql-wal",
        @"googleanalytics-v3.sql",
        @"googleanalytics-v3.sql-shm",
        @"googleanalytics-v3.sql-wal",
        @"googleanalytics-aux-v4.sql",
        @"googleanalytics-aux-v4.sql-shm",
        @"googleanalytics-aux-v4.sql-wal",
    ];
    NSArray *libraryURLs = [[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask];
    NSURL *libraryURL = libraryURLs.firstObject;
    for (NSString *fileName in fileNames) {
        NSURL *fileURL = [libraryURL URLByAppendingPathComponent:fileName];
        [fileURL setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:nil];
    };

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end

