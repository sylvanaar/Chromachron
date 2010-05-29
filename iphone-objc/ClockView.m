//
//  ClockView.m
//  Chromachron
//
//  Created by Jon Akhtar on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ClockView.h"


@implementation ClockView


-(id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self != nil)
	{
		NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"background.png" ofType:nil];
		UIImage *img = [UIImage imageWithContentsOfFile:imagePath];
		colorWheel = CGImageRetain(img.CGImage);
	}
	return self;
}

-(void)dealloc
{
	CGImageRelease(colorWheel);
	[super dealloc];
}

-(void)drawRect:(CGRect)rect
{
	// Since we use the CGContextRef a lot, it is convienient for our demonstration classes to do the real work
	// inside of a method that passes the context as a parameter, rather than having to query the context
	// continuously, or setup that parameter for every subclass.
	[self drawInContext:UIGraphicsGetCurrentContext()];
}

-(void)drawInContext:(CGContextRef)context
{
    
	CGRect imageRect;
	imageRect.origin = CGPointMake(8.0, 8.0);
	imageRect.size = CGSizeMake(64.0, 64.0);
	
	// Note: The images are actually drawn upside down because Quartz image drawing expects
	// the coordinate system to have the origin in the lower-left corner, but a UIView
	// puts the origin in the upper-left corner. For the sake of brevity (and because
	// it likely would go unnoticed for the image used) this is not addressed here.
	// For the demonstration of PDF drawing however, it is addressed, as it would definately
	// be noticed, and one method of addressing it is shown there.
    
	// Draw the image in the upper left corner (0,0) with size 64x64
	CGContextDrawImage(context, imageRect, colorWheel);
	

}





@end
