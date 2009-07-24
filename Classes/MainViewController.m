//
//  MainViewController.m
//  bummer-btn
//
//  Created by Sam Schroeder on 7/23/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation MainViewController

@synthesize bummerButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)playTuba {
	SystemSoundID soundID;
	
	// find corresponding CAF file
	NSURL *cafURL = [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"sadTuba.caf"]];
	NSLog(@"cafURL: %@", cafURL);
	OSStatus error = AudioServicesCreateSystemSoundID((CFURLRef) cafURL, &soundID);
	// Yeah, I know there is a warning.  Don't care.
	
	AudioServicesPlaySystemSound (soundID);
}

- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[bummerButton release];
    [super dealloc];
}


@end
