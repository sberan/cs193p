#import "Controller.h"
#import "math.h"

@implementation Controller

- (void)awakeFromNib {
    float numberOfSides = [[NSUserDefaults standardUserDefaults] floatForKey:@"numberOfSides"];
    if (numberOfSides) {
        sideSelection.value = numberOfSides;
    }
    [polygon addObserver:self forKeyPath:@"numberOfSides" options:0 context:nil];
    polygon.minimumNumberOfSides = round(sideSelection.minimumValue);
    polygon.maximumNumberOfSides = round(sideSelection.maximumValue);
    polygon.numberOfSides = round(sideSelection.value);
}

- (IBAction)updateNumberOfSides:(id)sender {
    if(round(sideSelection.value) != polygon.numberOfSides) {
        polygon.numberOfSides = round(sideSelection.value);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	[self updateView];
}
- (void)updateView {
    [[NSUserDefaults standardUserDefaults] setFloat:[polygon numberOfSides] forKey:@"numberOfSides"];
    name.text = polygon.name;
    numSides.text = [NSString stringWithFormat:@"%i", [polygon numberOfSides]];
    [polygonView setNeedsDisplay];
}
@end
