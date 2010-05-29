//
//  MainViewController.m
//  Chromachron
//
//  Created by Jon Akhtar on 5/20/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MainViewController.h"
#include "time.h"
#include "ChromachronAppDelegate.h"
#import "InAppSettings.h"

@implementation MainViewController


static const float PI = 3.1415;

NSArray* colors;
    
//UIColor fills[] = { 
//	[UIColor colorWithRed:179 blue:164 green:87 alpha:255],
/*	[1] = {221,71,31 ,255},
	[2] = {224,153,144 ,255},
	[3] = {172,30,38 ,255},
	[4] = {188,62,97 ,255},
	[5] = {141,41,106 ,255},
	[6] = {14,61,145 ,255},
	[7] = {40,111,72 ,255},
	[8] = {47,180,185 ,255},
	[9] = {98,60,41 ,255},
	[10] = {111,108,83 ,255},
	[11] = {120,81,39 ,255}, */
//}


//int i=0;

time_t currentTime;


int _12HOURS = 12*60;





- (void)timerTick:(NSTimer*)theTimer {
    time_t theTime;
    time( &theTime );   // get the calendar time
    struct tm *t = localtime( &theTime );  // convert to local

    int h = t->tm_hour;
    int m = t->tm_min;
    int s = t->tm_sec;
    h=h%12;
    m=m+h*60;
    
   // int minutes = t->tm_sec+60*t->tm_min; // tm_sec tm_min tm_hour
    

    topPlate.transform = CGAffineTransformMakeRotation((2*PI/_12HOURS)*(m));
    
    if (showSeconds) {
        innerPlate.transform = CGAffineTransformMakeRotation((2*PI/60)*(s));
    } else {
         innerPlate.transform = topPlate.transform;
    }

    
    colorWheel.backgroundColor = [UIColor redColor];
   
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];

    
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
   
 
    NSLog(@"%d", showSeconds);
    
    [self timerTick:nil];
    
   // topPlate.transform = CGAffineTransformMakeRotation(i);
    
        
}


- (void)viewWillAppear:(BOOL)animated{
    showSeconds = [[NSUserDefaults standardUserDefaults] boolForKey:@"showSeconds"];
    [super viewWillAppear:animated];
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
     showSeconds = controller.secondsSwitch.on;
    
    
    [[NSUserDefaults standardUserDefaults] setBool:showSeconds
                                            forKey:@"showSeconds"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"%d", showSeconds);
    
	[self dismissModalViewControllerAnimated:YES];
    
   
}


- (IBAction)showInfo:(id)sender {    
    InAppSettingsModalViewController *settings = [[InAppSettingsModalViewController alloc] init];
    [self presentModalViewController:settings animated:YES];
    [settings release];
    /*
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
    
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
    

	
	[controller release];
     */
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


@end
