//
//  MainViewController.h
//  Chromachron
//
//  Created by Jon Akhtar on 5/20/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    IBOutlet UIImageView* topPlate;
    IBOutlet UIImageView* innerPlate;   
    IBOutlet UIImageView* colorWheel;
    
    NSTimer* timer;
    
    BOOL showSeconds;
}

- (IBAction)showInfo:(id)sender;

@end
