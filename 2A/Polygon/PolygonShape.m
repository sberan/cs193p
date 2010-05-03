#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (id) init {
    return [self initWithNumberOfSides:4];
}

- (id) initWithNumberOfSides:(int)sides {
    return [self initWithNumberOfSides: sides minimumNumberOfSides: 3 maximumNumberOfSides: 12];
}

- (id) initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
    [self setMinimumNumberOfSides:min];
    [self setMaximumNumberOfSides:max];
    [self setNumberOfSides:sides];
    return self;
}

- (NSString*) name {
    switch (numberOfSides) {
        case 3:
            return @"Triangle";
        case 4:
            return @"Square";
        case 5:
            return @"Pentagon";
        case 6:
            return @"Hexagon";
        case 7:
            return @"Heptagon";
        case 8:
            return @"Octagon";
        case 9:
            return @"Enneagon";
        case 10:
            return @"Decagon";
        case 11:
            return @"Hendecagon";
        case 12:
            return @"Dodecagon";
        default:
            return nil;
    }
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
              newMinimumNumberOfSides, 3);
    } else {
        minimumNumberOfSides = newMinimumNumberOfSides;
    }
}

- (void) setMaximumNumberOfSides:(int) newMaximumNumberOfSides {
    if (newMaximumNumberOfSides > 12) {
        NSLog(@"Invalid maximum number of sides: %i is greater than the maximum of %i allowed",
              newMaximumNumberOfSides, 12);
    } else {
        maximumNumberOfSides = newMaximumNumberOfSides;
    }
}

- (float) angleInDegrees {
    return (180 * ([self numberOfSides] - 2) / [self numberOfSides]);
}

- (float) angleInRadians {
    return [self angleInDegrees] * M_PI / 180;
}

- (NSString*) description {
    return [NSString stringWithFormat: 
            @"Hello I am a %i-sided polygon (aka %@) with angles of %f degrees (%f radians)", 
            [self numberOfSides],
            [self name],
            [self angleInDegrees],
            [self angleInRadians]];
}

- (void) dealloc {
    NSLog(@"deallocating polygon %@", [self name]);
    [super dealloc];
}
@end
