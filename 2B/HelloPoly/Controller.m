#import "Controller.h"

@implementation Controller

- (void) updatePolygonBy:(int)delta {
    [polygon setNumberOfSides:[polygon numberOfSides] + delta];
    [nameLabel setText: [polygon name]];
    [numberOfSidesLabel setText: [NSString stringWithFormat:@"%i", [polygon numberOfSides]]];
    [minimumNumberOfSidesLabel setText: [NSString stringWithFormat:@"%i", [polygon minimumNumberOfSides]]];
    [maximumNumberOfSidesLabel setText: [NSString stringWithFormat:@"%i", [polygon maximumNumberOfSides]]];
    [angleDegreesLabel setText: [NSString stringWithFormat:@"%f", [polygon angleInDegrees]]];
    [angleRadiansLabel setText: [NSString stringWithFormat:@"%f", [polygon angleInRadians]]];
    [decreaseButton setEnabled: [polygon numberOfSides] > [polygon minimumNumberOfSides]];
    [increaseButton setEnabled: [polygon numberOfSides] < [polygon maximumNumberOfSides]];
     
}

- (void) awakeFromNib {
    [polygon setNumberOfSides:5];
    [self updatePolygonBy:0];
}

- (IBAction)decrease:(id)sender {
    [self updatePolygonBy: -1];
}

- (IBAction)increase:(id)sender {
    [self updatePolygonBy: 1];
}
@end
