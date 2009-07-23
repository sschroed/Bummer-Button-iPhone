//
//  bummer_btnAppDelegate.m
//  bummer-btn
//
//  Created by Sam Schroeder on 7/23/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "bummer_btnAppDelegate.h"
#import "MainViewController.h"

@implementation bummer_btnAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
