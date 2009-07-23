//
//  MainViewController.h
//  bummer-btn
//
//  Created by Sam Schroeder on 7/23/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "FlipsideViewController.h"


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	UIButton *bummerButton;
}
@property(nonatomic, retain) IBOutlet UIButton *bummerButton;

- (IBAction)playTuba;
- (IBAction)showInfo;

@end
