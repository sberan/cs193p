#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
@end
