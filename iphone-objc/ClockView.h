//
//  ClockView.h
//  Chromachron
//
//  Created by Jon Akhtar on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ClockView : UIView {
    CGImageRef colorWheel;
    CGImageRef outerDisc;
    CGImageRef innerDisc;

}
-(void)drawInContext:(CGContextRef)context;
@end
