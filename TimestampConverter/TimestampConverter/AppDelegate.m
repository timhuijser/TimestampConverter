//
//  AppDelegate.m
//  TimestampConverter
//
//  Created by Tim on 28/04/15.
//  Copyright (c) 2015 TimHuijser. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Timestamp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

// Open application after closing and clicking dock app icon.
- (BOOL)applicationShouldHandleReopen:(NSApplication *)application hasVisibleWindows:(BOOL)flag {
    
    if(!flag) {
        id windowId;
        for(windowId in application.windows) {
            NSWindow *window = windowId;
            [window makeKeyAndOrderFront:self];
        }
    }
    return YES;
}

@end
