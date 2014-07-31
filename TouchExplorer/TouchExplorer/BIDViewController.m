//
//  BIDViewController.m
//  TouchExplorer
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel; @property (weak, nonatomic) IBOutlet UILabel *tapsLabel; @property (weak, nonatomic) IBOutlet UILabel *touchesLabel; - (void)updateLabelsFromTouches:(NSSet *)touches;
@end

@implementation BIDViewController
@synthesize messageLabel; @synthesize tapsLabel; @synthesize touchesLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view. // e.g. self.myOutlet = nil;
    self.messageLabel = nil;
    self.tapsLabel = nil;
    self.touchesLabel = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateLabelsFromTouches:(NSSet *)touches { NSUInteger numTaps = [[touches anyObject] tapCount]; NSString *tapsMessage = [[NSString alloc]
                                                                                                                                 initWithFormat:@"%d taps detected", numTaps]; tapsLabel.text = tapsMessage;
    NSUInteger numTouches = [touches count];
    NSString *touchMsg = [[NSString alloc] initWithFormat:
                          @"%d touches detected", numTouches]; touchesLabel.text = touchMsg;
}

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    messageLabel.text = @"Touches Began";
    [self updateLabelsFromTouches:touches]; }
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{ messageLabel.text = @"Touches Cancelled";
    [self updateLabelsFromTouches:touches];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { messageLabel.text = @"Touches Ended.";
    [self updateLabelsFromTouches:touches];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { messageLabel.text = @"Drag Detected";
    [self updateLabelsFromTouches:touches];
}
@end
