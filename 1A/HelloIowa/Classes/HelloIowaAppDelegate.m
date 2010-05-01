//
//  HelloIowaAppDelegate.m
//  HelloIowa
//
//  Created by Sam Beran on 4/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "HelloIowaAppDelegate.h"

@implementation HelloIowaAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
