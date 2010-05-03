#import "PolygonTest.h"


@implementation PolygonTest

-(void) setUp {
	polygon = [PolygonShape alloc];
}

-(void) tearDown {
	[polygon release];
}

-(void) testInit {
	[polygon init];
	
	STAssertEquals(4, [polygon numberOfSides], 
				   @"Default number of sides for a polygon should be 4, Was @i.", [polygon numberOfSides]);
	
	STAssertEquals(3, [polygon minimumNumberOfSides], 
				   @"Default minimum number of sides for a polygon should be 3, was @i.", [polygon minimumNumberOfSides]);
	
	STAssertEquals(12, [polygon maximumNumberOfSides],
				   @"Default maximum number of sides for a polygon should be 12, was @i.", [polygon maximumNumberOfSides]);
}

-(void) testInitWithNumberOfSides {
	[polygon initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:10];
	
	STAssertEquals(6, [polygon numberOfSides], 
				   @"Number of sides should be 6, was %i", [polygon numberOfSides]);
	
	STAssertEquals(5, [polygon minimumNumberOfSides],
				   @"Minimum number of sides should be 5, was %i", [polygon minimumNumberOfSides]);
	
	STAssertEquals(10, [polygon maximumNumberOfSides],
				   @"Maximum number of sides should be 10, was %i", [polygon maximumNumberOfSides]);
}

-(void) testName {
	[polygon initWithNumberOfSides:4];
	STAssertEquals(@"Square", [polygon name], 
				   @"Four sided polygon should be a Square, was %@.", [polygon name]);
	
	[polygon setNumberOfSides:6];
	STAssertEquals(@"Hexagon", [polygon name], 
				   @"Six sided polygon should be a Hexagon, was %@.", [polygon name]);
	
}

-(void) testAngleInDegrees {
	[polygon initWithNumberOfSides:4];
	STAssertEquals((float)90, [polygon angleInDegrees], 
				   @"Square should have angle of 90 degrees, was %f", [polygon angleInDegrees]);
	
	[polygon setNumberOfSides:5];
	STAssertEquals((float)108, [polygon angleInDegrees], 
				   @"Pentagon should have angle of 108 degrees, was %f", [polygon angleInDegrees]);
}

-(void) testAngleInRadians {
	[polygon initWithNumberOfSides:4];
	STAssertEquals((float)M_PI / 2, [polygon angleInRadians],
				   @"Square should have angle of %f radians, was %f", M_PI / 2, [polygon angleInRadians]);
	
	[polygon setNumberOfSides:6];
	STAssertEquals((float)(2* M_PI / 3), [polygon angleInRadians],
				   @"Hexagon should have angle of %f radians, was %f", 2 * M_PI / 3, [polygon angleInRadians]);
}

-(void) testDescription {
	[polygon initWithNumberOfSides:4];
	NSString* expectedDescription = @"Hello I am a 4-sided polygon (aka Square) with angles of 90.000000 degrees (1.570796 radians)";
	STAssertEqualObjects(expectedDescription, [polygon description],
				   @"Descrption should be '%@', was '%@'", expectedDescription, [polygon description]);
}
														
@end
