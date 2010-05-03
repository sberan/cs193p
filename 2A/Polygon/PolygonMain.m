#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPolygonInfo() {
    NSMutableArray* polygons = [[NSMutableArray alloc] init];
    PolygonShape* polygon1 = [[PolygonShape alloc] init];
    [polygon1 setMinimumNumberOfSides:3];
    [polygon1 setMaximumNumberOfSides:7];
    [polygon1 setNumberOfSides:4];
    NSLog(@"Adding polygon: %@", polygon1);
    [polygons addObject:polygon1];
    
    PolygonShape* polygon2 = [[PolygonShape alloc] 
                              initWithNumberOfSides:6 
                              minimumNumberOfSides:5 
                              maximumNumberOfSides:9];
    NSLog(@"Adding polygon: %@", polygon2);
    [polygons addObject:polygon2];
    
    PolygonShape* polygon3 = [[PolygonShape alloc]
                              initWithNumberOfSides:12 
                              minimumNumberOfSides:9 
                              maximumNumberOfSides:12];
    NSLog(@"Adding polygon: %@", polygon3);
    [polygons addObject:polygon3];
    
    for(PolygonShape* polygon in polygons) {
        [polygon setNumberOfSides:10];
    }
    
    [polygon1 release];
    [polygon2 release];
    [polygon3 release];
    [polygons release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    PrintPolygonInfo();
    
    [pool drain];
    return 0;
}
