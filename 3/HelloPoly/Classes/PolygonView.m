#import "PolygonView.h"
#import "math.h"

@implementation PolygonView

-(void) drawPath:(CGRect)rect {
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
}

-(void) drawGradient:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClip(context);
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 0.75 };
    CGFloat components[8] = { 0.7, 0.7, 0.8, 1.0,  // Start color
                              1.0, 1.0, 1.0, 1.0 }; // End color
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, num_locations);
    CGContextDrawLinearGradient(context, gradient, rect.origin, CGPointMake(rect.size.height, rect.size.width), 0);
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorSpace);
}

-(void) drawBorder:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4);
    CGFloat components[4] = {0.7, 0.7, 0.8, 1.0};
    CGColorRef cgColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), components);
    UIColor *color = [UIColor colorWithCGColor:cgColor];
    [color setStroke];
    CGContextDrawPath (context, kCGPathStroke);
	CGColorRelease(cgColor);
}

-(void) drawRect:(CGRect)rect {
    [self drawPath:rect];
    [self drawGradient:rect];
    [self drawPath:rect];
    [self drawBorder:rect];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if(touches.count == 1) {
        UITouch *touch = [[touches objectEnumerator] nextObject];
        touchStartPoint = [touch locationInView:self];
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if(touches.count == 1) {
        UITouch *touch = [[touches objectEnumerator] nextObject];
        CGPoint point = [touch locationInView:self];
		float ax = touchStartPoint.x - self.center.x;
		float ay =  self.center.y - touchStartPoint.y;
		float bx = point.x - self.center.x;
		float by = self.center.y - point.y;
		//http://www.euclideanspace.com/maths/algebra/vectors/angleBetween/index.htm
		float result = atan2(ay, ax) - atan2(by, bx);		
		self.transform = CGAffineTransformRotate(self.transform, result);
    }
}
@end
