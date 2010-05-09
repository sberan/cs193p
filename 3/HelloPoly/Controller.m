#import "Controller.h"
#import "math.h"

@implementation Controller

- (void) updateView {
    [polygon setMinimumNumberOfSides:round([sideSelection minimumValue])];
    [polygon setMaximumNumberOfSides:round([sideSelection maximumValue])];
    [polygon setNumberOfSides:round([sideSelection value])];
    
    [name setText:[polygon name]];
    [numSides setText:[NSString stringWithFormat:@"%i", [polygon numberOfSides]]];
    
    [polygonView setNeedsDisplay];
    
    [defaults setFloat:[polygon numberOfSides] forKey:@"numberOfSides"];
}

- (void) awakeFromNib {
    defaults = [NSUserDefaults standardUserDefaults];
    float numberOfSides = [defaults floatForKey:@"numberOfSides"] ;
    if (numberOfSides) {
        [sideSelection setValue:numberOfSides];
    }
    [self updateView];
}

- (IBAction)updateNumberOfSides:(id)sender {
    if ([polygon numberOfSides] != round([sideSelection value])) {
        [self updateView];
    }
}
@end
