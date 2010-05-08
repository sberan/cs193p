#import <SenTestingKit/SenTestingKit.h>
#import "HelloPolyAppDelegate.h"

@interface HelloPolyAppDelegateTest : SenTestCase {
	HelloPolyAppDelegate* app;
}
@end

@implementation HelloPolyAppDelegateTest

-(void)setUp {
    app = [[HelloPolyAppDelegate alloc] init];
}

-(void)tearDown {
    [app release];
}


@end
