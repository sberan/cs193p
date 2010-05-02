#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPolygonInfo() {
    PolygonShape* polygon = [[PolygonShape alloc] init];
    [polygon setMinimumNumberOfSides:2];
    [polygon setMaximumNumberOfSides:10];
    [polygon setNumberOfSides:5];
    NSLog(@"Polygon: %@", polygon);
    [polygon release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    PrintPolygonInfo();
    
    [pool drain];
    return 0;
}
