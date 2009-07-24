//
//  FlipsideViewController.h
//  bummer-btn
//
//  Created by Sam Schroeder on 7/23/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import <MessageUI/MessageUI.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController <MFMailComposeViewControllerDelegate> {
	id <FlipsideViewControllerDelegate> delegate;
	UIImageView *pacDude;
	UIImageView *protonMicro;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

