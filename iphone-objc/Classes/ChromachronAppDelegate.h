//
//  ChromachronAppDelegate.h
//  Chromachron
//
//  Created by Jon Akhtar on 5/20/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface ChromachronAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
    NSTimer* clockTimer;
}
@property (retain) NSTimer* clockTimer;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

