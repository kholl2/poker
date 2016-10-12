//
//  RulesController.m
//  holla4
//
//  Created by Kruthika Holla on 7/26/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import "RulesController.h"

@implementation RulesController


//Display rules of the winning hands that are enabled and grey out the rules of the disabled winning hands
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.mySettings.setNoCommonCards) {
        self.noCommonRuleOutlet.text = @"The winner is decided by the single largest card present in  the dealer hand or the player hand";
    }
    else{
        self.noCommonRuleOutlet.text = @"The winner is decided by the single largest card present in  the dealer hand or the player hand";
        self.noCommonRuleOutlet.textColor = [UIColor lightGrayColor];
    }
    if (self.mySettings.setPair) {
        self.pairOutlet.text = @"The winner is decided by the largest pair. If either dealer or player has two pairs, the one with two pairs wins. If both dealer and player have one pair and both the pairs are of the same number, the suit ranking is considered to decide the winner. If dealer and player have two pairs each and the larger pair is same for both, the larger of the second pair is considered to decide the winner, otherwise the winner is decided based only on the larger pair and the second pair is not considered ";
    }
    else{
        self.pairOutlet.text = @"The winner is decided by the largest pair. If either dealer or player has two pairs, the one with two pairs wins. If both dealer and player have one pair and both the pairs are of the same number, the suit ranking is considered to decide the winner. If dealer and player have two pairs each and the larger pair is same for both, the larger of the second pair is considered to decide the winner, otherwise the winner is decided based only on the larger pair and the second pair is not considered  ";
        self.pairOutlet.textColor = [UIColor lightGrayColor];
    }
    if (self.mySettings.setThree) {
       self.threeStrongestOutlet.text = @"The winner is decided by the hand that has three cards with the same number but different suits. If both have three of a kind, then the larger card is considered";
    }
    else{
        self.threeStrongestOutlet.text = @"The winner is decided by the hand that has three cards with the same number but different suits. If both have three of a kind, then the larger card is considered";
         self.threeStrongestOutlet.textColor = [UIColor lightGrayColor];
    }
    if (self.mySettings.setFour) {
        self.fourStrongestOutlet.text = @"The winner is decided by the hand with the largest four of a kind cards";
    }
    else{
        self.fourStrongestOutlet.text = @"The winner is decided by the hand with the largest four of a kind cards";
        self.fourStrongestOutlet.textColor = [UIColor lightGrayColor];
    }
    
    if (self.mySettings.setStraight) {
        self.straightOutlet.text = @"The winner is decided by the hand that has the largest continuous sequence of 5 cards";
    }
    else{
        self.straightOutlet.text = @"The winner is decided by the hand that has the largest continuous sequence of 5 cards";
        self.straightOutlet.textColor = [UIColor lightGrayColor];
    }
    
}

@end
