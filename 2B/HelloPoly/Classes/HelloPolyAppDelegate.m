#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}

@end
