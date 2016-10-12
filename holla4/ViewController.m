//
//  ViewController.m
//  holla4
//
//  Created by Kruthika Holla on 7/16/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

//Enable or disable the winning hands and pass the player's settings to the rulecontroller where the rules are displayed

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstLabelOutlet.text = @"Enable no common cards";
    self.secondLabelOutlet.text = @"Enable pairs";
    self.thirdLabelOutlet.text = @"Enable three of a kind";
    self.fourthLabelOutlet.text = @"Enable four of a kind";
    self.fifthLabelOutlet.text = @"Enable straight set";
    if (self.mySettings.setNoCommonCards) {
        [self.noCommonOutlet setOn: YES];
        self.firstLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        [self.noCommonOutlet setOn:NO];
        self.firstLabelOutlet.textColor = [UIColor lightGrayColor];
    }
    if (self.mySettings.setPair) {
        [self.pairOutlet setOn: YES];
        self.secondLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        [self.pairOutlet setOn: NO];
        self.secondLabelOutlet.textColor = [UIColor lightGrayColor];
    }
    if (self.mySettings.setThree) {
        [self.threeStrongestOutlet setOn: YES];
        self.thirdLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        [self.threeStrongestOutlet setOn: NO];
        self.thirdLabelOutlet.textColor = [UIColor lightGrayColor];
    }
    if (self.mySettings.setFour) {
        [self.fourStrongestOutlet setOn: YES];
        self.fourthLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        [self.fourStrongestOutlet setOn: NO];
        self.fourthLabelOutlet.textColor = [UIColor lightGrayColor];
    }
    if (self.mySettings.setStraight) {
        [self.straightOutlet setOn: YES];
        self.fifthLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        [self.straightOutlet setOn: NO];
        self.fifthLabelOutlet.textColor = [UIColor lightGrayColor];
    }
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ID2"]) {
        ViewController *to = segue.destinationViewController;
        to.mySettings =  self.mySettings;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)noCommonSwitch:(id)sender {
    if ([self.noCommonOutlet isOn]) {
        self.mySettings.setNoCommonCards = TRUE;
        self.firstLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        self.mySettings.setNoCommonCards = FALSE;
        self.firstLabelOutlet.textColor = [UIColor lightGrayColor];
    }
}

- (IBAction)pairSwitch:(id)sender {
    if ([self.pairOutlet isOn]) {
        self.mySettings.setPair = TRUE;
        self.secondLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        self.mySettings.setPair = FALSE;
        self.secondLabelOutlet.textColor = [UIColor lightGrayColor];
    }
}

- (IBAction)threeStrongestSwitch:(id)sender {
    if ([self.threeStrongestOutlet isOn]) {
        self.mySettings.setThree = TRUE;
        self.thirdLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        self.mySettings.setThree = FALSE;
        self.thirdLabelOutlet.textColor = [UIColor lightGrayColor];
    }
}

- (IBAction)fourStrongestSwitch:(id)sender {
    if ([self.fourStrongestOutlet isOn]) {
        self.mySettings.setFour = TRUE;
        self.fourthLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        self.mySettings.setFour = FALSE;
        self.fourthLabelOutlet.textColor = [UIColor lightGrayColor];
    }
}

- (IBAction)straightSwitch:(id)sender {
    if ([self.straightOutlet isOn]) {
        self.mySettings.setStraight = TRUE;
        self.fifthLabelOutlet.textColor = [UIColor blackColor];
    }
    else{
        self.mySettings.setStraight = FALSE;
        self.fifthLabelOutlet.textColor = [UIColor lightGrayColor];
    }
}
@end
