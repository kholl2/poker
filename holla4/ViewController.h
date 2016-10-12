//
//  ViewController.h
//  holla4
//
//  Created by Kruthika Holla on 7/16/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"

@interface ViewController : UIViewController

@property Settings *mySettings;


@property (weak, nonatomic) IBOutlet UILabel *firstLabelOutlet;


@property (weak, nonatomic) IBOutlet UILabel *secondLabelOutlet;

@property (weak, nonatomic) IBOutlet UILabel *thirdLabelOutlet;


@property (weak, nonatomic) IBOutlet UILabel *fourthLabelOutlet;


@property (weak, nonatomic) IBOutlet UILabel *fifthLabelOutlet;



@property (weak, nonatomic) IBOutlet UISwitch *noCommonOutlet;

@property (weak, nonatomic) IBOutlet UISwitch *pairOutlet;


@property (weak, nonatomic) IBOutlet UISwitch *threeStrongestOutlet;

@property (weak, nonatomic) IBOutlet UISwitch *fourStrongestOutlet;

@property (weak, nonatomic) IBOutlet UISwitch *straightOutlet;

- (IBAction)noCommonSwitch:(id)sender;

- (IBAction)pairSwitch:(id)sender;

- (IBAction)threeStrongestSwitch:(id)sender;


- (IBAction)fourStrongestSwitch:(id)sender;

- (IBAction)straightSwitch:(id)sender;

@end

