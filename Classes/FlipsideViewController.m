//
//  FlipsideViewController.m
//  bummer-btn
//
//  Created by Sam Schroeder on 7/23/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
	pacDude = (UIImageView*)[[self view] viewWithTag:1];
	protonMicro = (UIImageView*)[[self view] viewWithTag:2];
    self.view.backgroundColor = [UIColor whiteColor];      
}


- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if([touch view] == pacDude)
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.pacdudegames.com/services.html"]]; 
	} else if ([touch view] == protonMicro && [MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *controller = [[[MFMailComposeViewController alloc] init] autorelease];
		controller.mailComposeDelegate = self;
		[controller setToRecipients:[NSArray arrayWithObject:@"samuelschroeder+protonmicro@gmail.com"]];
		[controller setSubject:@"Bummer Button App"];
		[controller setMessageBody:@"I love this app!" isHTML:NO];
		[self presentModalViewController:controller animated:YES];
	}
} 

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
}


- (void)dealloc {
    [super dealloc];
}


@end
