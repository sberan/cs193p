#import "PolygonView.h"

@implementation PolygonView

-(void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath (context);
    NSArray *points = [polygon pointsInRect:rect];
    for(NSValue *pointVal in points) {
        CGPoint point = [pointVal CGPointValue];
        if([points indexOfObject:pointVal] == 0) {
            CGContextMoveToPoint(context, point.x, point.y);
        } else {
            CGContextAddLineToPoint(context, point.x, point.y);
        }
    }
    CGContextClosePath (context);
    CGContextSetLineWidth(context, 4);
    [[UIColor blackColor] setFill];
    [[UIColor grayColor] setStroke];
    CGContextDrawPath (context, kCGPathFillStroke);
}
@end
