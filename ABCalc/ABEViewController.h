/*************************************************************************/
/* ABEViewController.h
/*************************************************************************/
/* Copyright (c) 2014-present, UberBeta
/*
/* This source code is licensed under the GNU GPL v2.0 license found in the
/* LICENSE file in the root directory of this source tree.
/*************************************************************************/

#import <UIKit/UIKit.h>

@interface ABEViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *displayLabel;

// int buttons
- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
- (IBAction)button5:(id)sender;
- (IBAction)button6:(id)sender;
- (IBAction)button7:(id)sender;
- (IBAction)button8:(id)sender;
- (IBAction)button9:(id)sender;
- (IBAction)button0:(id)sender;

// operators
- (IBAction)buttonPlus:(id)sender;
- (IBAction)buttonMinus:(id)sender;
- (IBAction)buttonMultiply:(id)sender;
- (IBAction)buttonDivide:(id)sender;
- (IBAction)buttonDot:(id)sender;
- (IBAction)buttonEquals:(id)sender;

// function
- (IBAction)buttonClear:(id)sender;

@end
