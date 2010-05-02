#import <Cocoa/Cocoa.h>

@interface PolygonShape : NSObject {
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString* name;

@end
