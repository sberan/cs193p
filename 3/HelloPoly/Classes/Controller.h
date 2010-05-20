#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    IBOutlet PolygonShape *polygon;
    IBOutlet UISlider *sideSelection;
    IBOutlet UILabel *name;
    IBOutlet UILabel *numSides;
    IBOutlet UIView *polygonView;
}
- (IBAction)updateNumberOfSides:(id)sender;
- (void)updateView;
@end
