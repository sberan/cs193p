#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;
- (void)applicationDidFinishLaunching:(UIApplication *)application {
	CGRect  rect = [[UIScreen mainScreen] bounds];
    [window setFrame:rect];
	[window makeKeyAndVisible];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}

@end
