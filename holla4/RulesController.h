//
//  RulesController.h
//  holla4
//
//  Created by Kruthika Holla on 7/26/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"

@interface RulesController : UIViewController

@property Settings *mySettings;

@property (weak, nonatomic) IBOutlet UILabel *noCommonRuleOutlet;

@property (weak, nonatomic) IBOutlet UITextView *pairOutlet;


@property (weak, nonatomic) IBOutlet UILabel *threeStrongestOutlet;

@property (weak, nonatomic) IBOutlet UILabel *fourStrongestOutlet;

@property (weak, nonatomic) IBOutlet UILabel *straightOutlet;

@end
