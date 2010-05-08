#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *angleDegreesLabel;
    IBOutlet UILabel *angleRadiansLabel;
    IBOutlet UILabel *minimumNumberOfSidesLabel;
    IBOutlet UILabel *maximumNumberOfSidesLabel;
    IBOutlet PolygonShape *polygon;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
@end
