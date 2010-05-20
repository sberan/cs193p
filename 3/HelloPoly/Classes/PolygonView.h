#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
    IBOutlet PolygonShape *polygon;
	CGPoint touchStartPoint;
	CGAffineTransform touchStartTransform;
}

@end
