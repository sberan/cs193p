#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
    IBOutlet PolygonShape *polygon;
	CGPoint touchStartPoint;
	CGAffineTransform touchStartTransform;
}

@end
