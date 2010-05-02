#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (NSString*) name {
    return @"Square";
}

BOOL CheckRange(NSString* label, int val, int min, int max) {
    return NO;
}

- (void) setNumberOfSides:(int) newNumberOfSides {
    if (newNumberOfSides < [self minimumNumberOfSides]) {
        NSLog(@"Invalid number of sides: %i is less than the minimum of %i allowed",
              newNumberOfSides, 
              [self minimumNumberOfSides]);
    } else if (newNumberOfSides > [self maximumNumberOfSides]) {
        NSLog(@"Invalid number of sides: %i is greater than the maximum of %i allowed",
              newNumberOfSides,
              [self maximumNumberOfSides]);
    } else {
        numberOfSides = newNumberOfSides;
    }
}

- (void) setMinimumNumberOfSides:(int) newMinimumNumberOfSides {
    if (newMinimumNumberOfSides < 3) {
        NSLog(@"Invalid minimum number of sides: %i is less than the minimum of %i allowed",
              newMinimumNumberOfSides,
              3);
    } else {
        minimumNumberOfSides = newMinimumNumberOfSides;
    }
}

- (void) setMaximumNumberOfSides:(int) newMaximumNumberOfSides {
    if(LogIfIsBetween(newMaximumNumberOfSides, 2, 12) {
        maximumNumberOfSides = newMaximumNumberOfSides;
    }
}

- (float) angleInDegrees {
    return 360.0;
}

- (float) angleInRadians {
    return 25.0;
}

- (NSString*) description {
    return [NSString stringWithFormat: 
            @"Hello I am a %i-sided polygon (aka %@) with angles of %f degrees (%f radians)", 
            [self numberOfSides],
            [self name],
            [self angleInDegrees],
            [self angleInRadians]];
}
@end
