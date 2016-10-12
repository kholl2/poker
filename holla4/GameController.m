//
//  GameController.m
//  holla4
//
//  Created by Kruthika Holla on 7/16/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import "GameController.h"
#import "ViewController.h"

@interface GameController ()

@end

@implementation GameController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mySettings = [[Settings alloc]init];
    self.countP1Pressed = 0;
    self.countP2Pressed = 0;
    self.countP3Pressed = 0;
    self.countP4Pressed = 0;
    self.countP5Pressed = 0;
    
    self.cardImages = [NSMutableArray array];
    NSString *imageName;
    self.myGame = [Game new];
    self.myDeck = [self.myGame newGame];

    self.myRules = [Rules new];
    self.mySettings.setNoCommonCards = TRUE;
    self.mySettings.setPair = TRUE;
    self.mySettings.setThree = TRUE;
    self.mySettings.setFour = TRUE;
    self.mySettings.setStraight = TRUE;
    
    
    for (int i = 0; i < 52; i++) {
        NSString* card = self.myDeck.cards.cardDeck[i];
        imageName = [NSString stringWithFormat:@"%@.png",card];
        self.cardImages[i] = [UIImage imageNamed:imageName];
    }
    
    
    self.centerCard.center = self.view.center;
    self.playOutlet.hidden = YES;
    self.resetGameOutlet.hidden = YES;
    [self.playOutlet setEnabled: NO];
    [self.p1ButtonOutlet setEnabled:NO];
    [self.p2ButtonOutlet setEnabled:NO];
    [self.p3ButtonOutlet setEnabled:NO];
    [self.p4ButtonOutlet setEnabled:NO];
    [self.p5ButtonOutlet setEnabled:NO];
    
    self.dealerFirst.frame = CGRectMake(155, 262, self.dealerFirst.frame.size.width, self.dealerFirst.frame.size.height);
    self.playerFirst.frame = CGRectMake(155, 262, self.playerFirst.frame.size.width, self.playerFirst.frame.size.height);
    self.dealerSecond.frame = CGRectMake(155, 262, self.dealerSecond.frame.size.width, self.dealerSecond.frame.size.height);
    self.playerSecond.frame = CGRectMake(155, 262, self.playerSecond.frame.size.width, self.playerSecond.frame.size.height);
    self.dealerThird.frame = CGRectMake(155, 262, self.dealerThird.frame.size.width, self.dealerThird.frame.size.height);
    self.playerThird.frame = CGRectMake(155, 262, self.dealerFirst.frame.size.width, self.dealerFirst.frame.size.height);
    self.dealerFourth.frame = CGRectMake(155, 262, self.dealerThird.frame.size.width, self.dealerThird.frame.size.height);
    self.playerFourth.frame = CGRectMake(155, 262, self.playerFourth.frame.size.width, self.playerFourth.frame.size.height);
    self.dealerFifth.frame = CGRectMake(155, 262, self.dealerFifth.frame.size.width, self.dealerFifth.frame.size.height);
    self.playerFifth.frame = CGRectMake(155, 262, self.playerFifth.frame.size.width, self.playerFifth.frame.size.height);
    
    //[newDeck printDeck];

}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ID1"]) {
        ViewController *to = segue.destinationViewController;
        to.mySettings =  self.mySettings;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Deal button
- (IBAction)dealButton:(id)sender {
    self.myGame.playerHand = [NSMutableArray array];
    self.myGame.dealerHand = [NSMutableArray array];
    [self.dealOutlet setEnabled: NO];
    [self.settingsOutlet setEnabled: NO];
    self.dealOutlet.hidden = YES;


    //get Dealer cards
    for (int i = 0; i < 5; i++) {
        //NSString *cardName = [NSString stringWithFormat:@"%@.png",self.myDeck.cards.cardDeck[0]];
        [self.myGame.dealerHand addObject:self.myDeck.cards.cardDeck[0]];
        [self.myDeck.cards.cardDeck removeObjectAtIndex:0];
        [self.cardImages removeObjectAtIndex: 0];
    }
    
    
    //get player cards
    for (int i = 0; i < 5; i++) {
        //NSString *cardName = [NSString stringWithFormat:@"%@.png",self.myDeck.cards.cardDeck[0]];
        [self.myGame.playerHand addObject:[self.myDeck.cards.cardDeck objectAtIndex:0]];
        [self.myDeck.cards.cardDeck removeObjectAtIndex: 0];
    }
    
    
    //Animate dealing of cards
    CGRect frame = [self.dealerFirst frame];
    frame.origin.x += 96;
    frame.origin.y += 155;
    [self.dealerFirst setFrame:frame];
    [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
        CABasicAnimation *fullRotation;
        fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation.fromValue = [NSNumber numberWithFloat:0];
        fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
        fullRotation.duration = 0.3;
        fullRotation.repeatCount = 0;
        [self.dealerFirst.layer addAnimation:fullRotation forKey:@"360"];
        self.dealerFirst.frame = CGRectMake(59, 107, self.dealerFirst.frame.size.width, self.dealerFirst.frame.size.height);
        self.dealerFirst.image = [UIImage imageNamed:@"b2fv.png"];
    } completion:^(BOOL finished) {
        
    }];
    
    frame = [self.playerFirst frame];
    frame.origin.x += 96;
    frame.origin.y -= 173;
    [self.playerFirst setFrame:frame];
    [UIView animateWithDuration:0.3 delay:0.3 options:0 animations:^{
        CABasicAnimation *fullRotation;
        fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation.fromValue = [NSNumber numberWithFloat:0];
        fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
        fullRotation.duration = 0.5;
        fullRotation.repeatCount = 0;
        [self.playerFirst.layer addAnimation:fullRotation forKey:@"360"];
                self.playerFirst.frame = CGRectMake(59, 435, self.playerFirst.frame.size.width, self.playerFirst.frame.size.height);
        self.playerFirst.image = self.cardImages[0];
    } completion:^(BOOL finished) {
        
    }];
    
    frame = [self.dealerSecond frame];
    frame.origin.x += 67;
    frame.origin.y += 155;
    [self.dealerSecond setFrame:frame];
    [UIView animateWithDuration:0.5 delay:0.6 options:0 animations:^{
        self.dealerSecond.frame = CGRectMake(88, 107, self.dealerSecond.frame.size.width, self.dealerSecond.frame.size.height);
        self.dealerSecond.image = [UIImage imageNamed:@"b2fv.png"];
    } completion:^(BOOL finished) {
        
    }];
    
    
    frame = [self.playerSecond frame];
    frame.origin.x += 67;
    frame.origin.y -= 176;
    [self.playerSecond setFrame:frame];
    [UIView animateWithDuration:0.3 delay:0.9 options:0 animations:^{
        self.playerSecond.frame = CGRectMake(88, 438, self.playerSecond.frame.size.width, self.playerSecond.frame.size.height);
        self.playerSecond.image = self.cardImages[1];
    } completion:^(BOOL finished) {
        
    }];
    
    
    frame = [self.dealerThird frame];
    frame.origin.x += 27;
    frame.origin.y += 155;
    [self.dealerThird setFrame:frame];
    [UIView animateWithDuration:0.3 delay:1.2 options:0 animations:^{
        self.dealerThird.frame = CGRectMake(128 , 107, self.dealerThird.frame.size.width, self.dealerThird.frame.size.height);
        self.dealerThird.image = [UIImage imageNamed:@"b2fv.png"];
    } completion:^(BOOL finished) {
        
    }];
    
    
    frame = [self.playerThird frame];
    frame.origin.x += 27;
    frame.origin.y -= 176;
    [self.playerThird setFrame:frame];
    [UIView animateWithDuration:0.3 delay:1.5 options:0 animations:^{
        self.playerThird.frame = CGRectMake(128, 438, self.playerThird.frame.size.width, self.playerThird.frame.size.height);
        self.playerThird.image = self.cardImages[2];
    } completion:^(BOOL finished) {
        
    }];
    
    
    frame = [self.dealerFourth frame];
    frame.origin.x -= 23;
    frame.origin.y += 155;
    [self.dealerFourth setFrame:frame];
    [UIView animateWithDuration:0.3 delay:1.8 options:0 animations:^{
        self.dealerFourth.frame = CGRectMake(178, 107, self.dealerFourth.frame.size.width, self.dealerFourth.frame.size.height);
        self.dealerFourth.image = [UIImage imageNamed:@"b2fv.png"];
    } completion:^(BOOL finished) {
        
    }];
    
    
    frame = [self.playerFourth frame];
    frame.origin.x -= 23;
    frame.origin.y -= 176;
    [self.playerFourth setFrame:frame];
    [UIView animateWithDuration:0.3 delay:2.1 options:0 animations:^{
        self.playerFourth.frame = CGRectMake(178, 438, self.playerFourth.frame.size.width, self.playerFourth.frame.size.height);
        self.playerFourth.image = self.cardImages[3];
    } completion:^(BOOL finished) {
        
    }];
    
    
   frame = [self.dealerFifth frame];
   frame.origin.x -= 72;
   frame.origin.y += 155;
   [self.dealerFifth setFrame:frame];
   [UIView animateWithDuration:0.3 delay:2.4 options:0 animations:^{
        self.dealerFifth.frame = CGRectMake(229, 107, self.dealerFifth.frame.size.width, self.dealerFifth.frame.size.height);
        self.dealerFifth.image = [UIImage imageNamed:@"b2fv.png"];
    } completion:^(BOOL finished) {
        
    }];
    
    
    frame = [self.playerFifth frame];
    frame.origin.x -= 72;
    frame.origin.y -= 176;
    [self.playerFifth setFrame:frame];
    [UIView animateWithDuration:0.3 delay:2.7 options:0 animations:^{
        self.playerFifth.frame = CGRectMake(229, 438, self.playerFifth.frame.size.width, self.playerFifth.frame.size.height);
        self.playerFifth.image = self.cardImages[4];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.25 delay:2.7 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseIn animations:^{
        self.playOutlet.alpha = 0.0;
    }completion:^(BOOL finished){
        [UIView animateWithDuration:0.5
                              delay: 0.2
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.playOutlet.hidden = NO;
                             self.playOutlet.alpha = 1.0;
                             self.resetGameOutlet.hidden = NO;
                             self.playOutlet.alpha = 1.0;
                             [self.playOutlet setEnabled: YES];
                             [self.p1ButtonOutlet setEnabled:YES];
                             [self.p2ButtonOutlet setEnabled:YES];
                             [self.p3ButtonOutlet setEnabled:YES];
                             [self.p4ButtonOutlet setEnabled:YES];
                             [self.p5ButtonOutlet setEnabled:YES];
                         }
                         completion:nil];
        
    }];
   
    
}

 //Option to change player cards before pressing play button
- (IBAction)p1Button:(id)sender {
    self.countP1Pressed++;
    NSMutableArray* p1images = [NSMutableArray array];
    p1images[0] = self.cardImages[0];
    p1images[1] = [UIImage imageNamed:@"b2fv.png"];
    
    if (self.countP1Pressed % 2 != 0) {
        CGRect frame = [self.p1ButtonOutlet frame];
        frame.origin.y -= 50;
        [self.p1ButtonOutlet setFrame:frame];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerFirst.frame = CGRectMake(59, 385, self.playerFirst.frame.size.width, self.playerFirst.frame.size.height);
            self.playerFirst.image = p1images[self.countP1Pressed % 2];
        }];
    }
    
    else{
        CGRect frame = [self.p1ButtonOutlet frame];
        frame.origin.y += 50;
        [self.p1ButtonOutlet setFrame:frame];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerFirst.frame = CGRectMake(59, 435, self.playerFirst.frame.size.width, self.playerFirst.frame.size.height);
            self.playerFirst.image = p1images[self.countP1Pressed % 2];
        }];

    }
    
}

- (IBAction)p2Button:(id)sender {
    self.countP2Pressed++;
    NSMutableArray* p2images = [NSMutableArray array];
    p2images[0] = self.cardImages[1];
    p2images[1] = [UIImage imageNamed:@"b2fv.png"];
    if (self.countP2Pressed % 2 != 0) {
        CGRect frame = [self.p2ButtonOutlet frame];
        frame.origin.y -= 50;
        [self.p2ButtonOutlet setFrame:frame];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerSecond.frame = CGRectMake(88, 385, self.playerSecond.frame.size.width, self.playerSecond.frame.size.height);
            self.playerSecond.image = p2images[self.countP2Pressed % 2];
        }];
    }
    else{
        CGRect frame = [self.p2ButtonOutlet frame];
        frame.origin.y += 50;
        [self.p2ButtonOutlet setFrame:frame];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerSecond.frame = CGRectMake(88, 435, self.playerSecond.frame.size.width, self.playerSecond.frame.size.height);
            self.playerSecond.image = p2images[self.countP2Pressed % 2];
        }];
    }
}

- (IBAction)p3Button:(id)sender {
    self.countP3Pressed++;
    NSMutableArray* p3images = [NSMutableArray array];
    p3images[0] = self.cardImages[2];
    p3images[1] = [UIImage imageNamed:@"b2fv.png"];
    if (self.countP3Pressed % 2 != 0) {
        CGRect frame = [self.p3ButtonOutlet frame];
        frame.origin.y -= 50;
        [self.p3ButtonOutlet setFrame:frame];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerThird.frame = CGRectMake(128, 385, self.playerThird.frame.size.width, self.playerThird.frame.size.height);
            self.playerThird.image = p3images[self.countP3Pressed % 2];
        }];
    }
    
    else{
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = [self.p3ButtonOutlet frame];
            frame.origin.y += 50;
            [self.p3ButtonOutlet setFrame:frame];
            self.playerThird.frame = CGRectMake(128, 435, self.playerThird.frame.size.width, self.playerThird.frame.size.height);
            self.playerThird.image = p3images[self.countP3Pressed % 2];
        }];
        
    }
}

- (IBAction)p4Button:(id)sender {
    self.countP4Pressed++;
    NSMutableArray* p4images = [NSMutableArray array];
    p4images[0] = self.cardImages[3];
    p4images[1] = [UIImage imageNamed:@"b2fv.png"];
    if (self.countP4Pressed % 2 != 0) {
        CGRect frame = [self.p4ButtonOutlet frame];
        frame.origin.y -= 50;
        [self.p4ButtonOutlet setFrame:frame];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerFourth.frame = CGRectMake(181, 385, self.playerFourth.frame.size.width, self.playerFourth.frame.size.height);
            self.playerFourth.image = p4images[self.countP4Pressed % 2];
        }];
    }
    
    else{
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = [self.p4ButtonOutlet frame];
            frame.origin.y += 50;
            [self.p4ButtonOutlet setFrame:frame];
            self.playerFourth.frame = CGRectMake(181, 435, self.playerFourth.frame.size.width, self.playerFourth.frame.size.height);
            self.playerFourth.image = p4images[self.countP4Pressed % 2];
        }];
        
    }
}

- (IBAction)p5Button:(id)sender {
    self.countP5Pressed++;
    NSMutableArray* p5images = [NSMutableArray array];
    p5images[0] = self.cardImages[4];
    p5images[1] = [UIImage imageNamed:@"b2fv.png"];
    if (self.countP5Pressed % 2 != 0) {
        CGRect frame = [self.p5ButtonOutlet frame];
        frame.origin.y -= 50;
        [self.p5ButtonOutlet setFrame:frame];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerFifth.frame = CGRectMake(229, 385, self.playerFifth.frame.size.width, self.playerFifth.frame.size.height);
            self.playerFifth.image = p5images[self.countP5Pressed % 2];
        }];
    }
    
    else{
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = [self.p5ButtonOutlet frame];
            frame.origin.y += 50;
            [self.p5ButtonOutlet setFrame:frame];
            self.playerFifth.frame = CGRectMake(229, 435, self.playerFifth.frame.size.width, self.playerFifth.frame.size.height);
            self.playerFifth.image = p5images[self.countP5Pressed % 2];
        }];
        
    }

}


//play button
- (IBAction)playButton:(id)sender {
    [self.settingsOutlet setEnabled: YES];
    [self.p1ButtonOutlet setEnabled:NO];
    [self.p2ButtonOutlet setEnabled:NO];
    [self.p3ButtonOutlet setEnabled:NO];
    [self.p4ButtonOutlet setEnabled:NO];
    [self.p5ButtonOutlet setEnabled:NO];
    self.resetGameOutlet.hidden = NO;
    BOOL replaceP1 = NO;
    BOOL replaceP2 = NO;
    BOOL replaceP3 = NO;
    BOOL replaceP4 = NO;
    BOOL replaceP5 = NO;
    for (int i = 0; i < 5; i++) {
        [self.cardImages removeObjectAtIndex:0];
    }
    self.playOutlet.hidden = YES;
    [self.playOutlet setEnabled:NO];
    if (self.countP1Pressed % 2 != 0){
        replaceP1 = YES;
        
    }
    if (self.countP2Pressed % 2 != 0){
        replaceP2 = YES;
        
    }
    if (self.countP3Pressed % 2 != 0){
        replaceP3 = YES;
        
    }
    if (self.countP4Pressed % 2 != 0){
        replaceP4 = YES;
        
    }
    if (self.countP5Pressed % 2 != 0){
        replaceP5 = YES;
        
    }
    //Replace cards that are flipped
    if (replaceP1) {
        [self.myGame.playerHand replaceObjectAtIndex:0 withObject:self.myDeck.cards.cardDeck[0]];
        [self.myDeck.cards.cardDeck removeObjectAtIndex: 0];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerFirst.frame = CGRectMake(59, 435, self.playerFirst.frame.size.width, self.playerFirst.frame.size.height);
            self.playerFirst.image = self.cardImages[0];
            [self.cardImages removeObjectAtIndex:0];
            
        }];
    }
    
    if (replaceP2) {
        [self.myGame.playerHand replaceObjectAtIndex:1 withObject:self.myDeck.cards.cardDeck[0]];
        [self.myDeck.cards.cardDeck removeObjectAtIndex: 0];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerSecond.frame = CGRectMake(88, 435, self.playerSecond.frame.size.width, self.playerSecond.frame.size.height);
            self.playerSecond.image = self.cardImages[0];
            [self.cardImages removeObjectAtIndex:0];
        }];
    }

    
    if (replaceP3) {
        [self.myGame.playerHand replaceObjectAtIndex:2 withObject:self.myDeck.cards.cardDeck[0]];
        [self.myDeck.cards.cardDeck removeObjectAtIndex: 0];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerThird.frame = CGRectMake(128, 435, self.playerThird.frame.size.width, self.playerThird.frame.size.height);
            self.playerThird.image = self.cardImages[0];
            [self.cardImages removeObjectAtIndex:0];
        }];
    }
    
    if (replaceP4) {
        [self.myGame.playerHand replaceObjectAtIndex:3 withObject:self.myDeck.cards.cardDeck[0]];
        [self.myDeck.cards.cardDeck removeObjectAtIndex: 0];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerFourth.frame = CGRectMake(178, 435, self.playerFourth.frame.size.width, self.playerFourth.frame.size.height);
            self.playerFourth.image = self.cardImages[0];
            [self.cardImages removeObjectAtIndex:0];
        }];
    }

    if (replaceP5) {
        [self.myGame.playerHand replaceObjectAtIndex:4 withObject:self.myDeck.cards.cardDeck[0]];
        [self.myDeck.cards.cardDeck removeObjectAtIndex: 0];
        [UIView animateWithDuration:0.5 animations:^{
            self.playerFifth.frame = CGRectMake(228, 435, self.playerFifth.frame.size.width, self.playerFifth.frame.size.height);
            self.playerFifth.image = self.cardImages[0];
            [self.cardImages removeObjectAtIndex:0];
        }];
    }

    
    //sort the player and dealer cards
    [self.myRules sortHand:self.myGame.dealerHand];
    [self.myRules sortHand:self.myGame.playerHand];
    
    //Display dealerhand
    [UIView animateWithDuration:0.0 delay:0.0 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
        self.dealerFirst.alpha = 0.0;
        self.dealerSecond.alpha = 0.0;
        self.dealerThird.alpha = 0.0;
        self.dealerFourth.alpha = 0.0;
        self.dealerFifth.alpha = 0.0;
    }completion: ^(BOOL finished){
        [UIView animateWithDuration:0.5
                              delay: 0.2
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.dealerFirst.alpha = 1.0;
                             self.dealerFirst.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.png",self.myGame.dealerHand[0]]];
                             self.dealerSecond.alpha = 1.0;
                             self.dealerSecond.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.png",self.myGame.dealerHand[1]]];
                             self.dealerThird.alpha = 1.0;
                             self.dealerThird.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.png",self.myGame.dealerHand[2]]];
                             self.dealerFourth.alpha = 1.0;
                             self.dealerFourth.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.png",self.myGame.dealerHand[3]]];
                             self.dealerFifth.alpha = 1.0;
                             self.dealerFifth.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.png",self.myGame.dealerHand[4]]];
                         }
                         completion:nil];
    }];
    
    //Check who wins based on the enabled winning hands
    int fourStrongest = 0, threeStrongest = 0, twoStrongest = 0, oneStrongest = 0, straight = 0;
    
    straight = [self.myRules straightCards:self.myGame.dealerHand or:self.myGame.playerHand];
    fourStrongest = [self.myRules fourStrongCards:self.myGame.dealerHand or:self.myGame.playerHand];
    threeStrongest = [self.myRules threeStrongCards:self.myGame.dealerHand or:self.myGame.playerHand];
    twoStrongest = [self.myRules twoStrongCards:self.myGame.dealerHand or:self.myGame.playerHand];
    oneStrongest = [self.myRules noCommonCards:self.myGame.dealerHand or:self.myGame.playerHand];
    
    
    if (!self.mySettings.setNoCommonCards && !self.mySettings.setPair && !self.mySettings.setThree && !self.mySettings.setFour && !self.mySettings.setStraight) {
        self.labelOutlet.text = @"Atleast one winning hand needs to be enabled!";
    }
    
        if ( (self.mySettings.setStraight && (!self.mySettings.setNoCommonCards && !self.mySettings.setPair && !self.mySettings.setThree && !self.mySettings.setFour)) || (self.mySettings.setStraight && (self.myRules.dealerHasStraight || self.myRules.playerHasStraight))) {
        [UIView animateWithDuration:0.0 delay:0.5 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
            self.labelOutlet.alpha = 0.0;
        }completion: ^(BOOL finished){
            [UIView animateWithDuration:0.5
                                  delay: 0.2
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 self.labelOutlet.alpha = 1.0;
                                 if (straight == 1 && self.myRules.playerHasStraight == TRUE && self.myRules.dealerHasStraight == FALSE) {
                                     self.labelOutlet.text = @"You win!! You have a straight set!!!";
                                 }
                                 if (straight == 2 && self.myRules.playerHasStraight == FALSE && self.myRules.dealerHasStraight == TRUE) {
                                     self.labelOutlet.text = @"Dealer wins..Dealer has a straight set";
                                 }
                                 if (straight == 3 && self.myRules.playerHasStraight == TRUE && self.myRules.dealerHasStraight == TRUE) {
                                     self.labelOutlet.text = @"You win!! Your straight set is stronger";
                                 }
                                 if (straight == 4 && self.myRules.playerHasStraight == TRUE && self.myRules.dealerHasStraight ==     TRUE) {
                                     self.labelOutlet.text = @"Dealer wins..Dealer's straight set is stronger";
                                 }
                                 
                                 if (straight == 5 && self.myRules.playerHasStraight == TRUE && self.myRules.dealerHasStraight ==     TRUE) {
                                     self.labelOutlet.text = @"It is a tie!!! Both of you have the same straight set!!!";
                                 }
                                 
                                 if (straight == 6 && !self.mySettings.setFour && !self.mySettings.setThree && !self.mySettings.setPair && !self.mySettings.setNoCommonCards) {
                                     self.labelOutlet.text = @"No result. Enable more winning hands in Settings and play again!";
                                 }
                                 
                             }
                             completion:nil];
        }];
    }
    
    
    
    
    if (self.mySettings.setFour){
        BOOL straightCards = FALSE;
        if (self.mySettings.setStraight) {
            if (self.myRules.dealerHasStraight && self.myRules.playerHasStraight) {
                straightCards = TRUE;
            }
        }
        if ((!straightCards && !self.mySettings.setThree && !self.mySettings.setPair && !self.mySettings.setNoCommonCards) || (!straightCards && (self.myRules.dealerHasFour || self.myRules.playerHasFour))){
            [UIView animateWithDuration:0.0 delay:0.5 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
                self.labelOutlet.alpha = 0.0;
            }completion: ^(BOOL finished){
                [UIView animateWithDuration:0.5
                                      delay: 0.2
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     self.labelOutlet.alpha = 1.0;
                                     if (fourStrongest == 1 && self.myRules.playerHasFour == TRUE && self.myRules.dealerHasFour == TRUE) {
                                         self.labelOutlet.text = @"You win!! You have the stronger cards";
                                     }
                                     if (fourStrongest == 2 && self.myRules.playerHasFour == TRUE && self.myRules.dealerHasFour == TRUE) {
                                         self.labelOutlet.text = @"Dealer wins..Your cards are not strong enough.";
                                     }
                                     if (fourStrongest == 1 && self.myRules.playerHasFour == TRUE && self.myRules.dealerHasFour == FALSE) {
                                         self.labelOutlet.text = @"You win!! You have four of a kind";
                                     }
                                     if (fourStrongest == 2 && self.myRules.playerHasFour == FALSE && self.myRules.dealerHasFour ==     TRUE) {
                                         self.labelOutlet.text = @"Dealer wins..Dealer has four of a kind";
                                     }
                                     
                                     if (fourStrongest == 3 && !self.mySettings.setThree && !self.mySettings.setPair && !self.mySettings.setNoCommonCards) {
                                         self.labelOutlet.text = @"No result. Enable more winning hands in Settings and play again!";
                                     }
                                     
                                 }
                                 completion:nil];
            }];

        }
    }
    

    if (self.mySettings.setThree){
        BOOL fourCards = FALSE, straightCards = FALSE;
        if (self.mySettings.setFour) {
            if (self.myRules.dealerHasFour || self.myRules.playerHasFour) {
                fourCards = TRUE;
            }
        }
        if (self.mySettings.setStraight) {
            if (self.myRules.dealerHasStraight && self.myRules.playerHasStraight) {
                straightCards = TRUE;
            }
        }
            if ((!straightCards && !fourCards && !self.mySettings.setPair && !self.mySettings.setNoCommonCards) || (!straightCards && !fourCards && (self.myRules.playerHasThree || self.myRules.dealerHasThree))){
                [UIView animateWithDuration:0.0 delay:0.5 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
                    self.labelOutlet.alpha = 0.0;
                }completion: ^(BOOL finished){
                    [UIView animateWithDuration:0.5
                                          delay: 0.2
                                        options:UIViewAnimationOptionCurveEaseIn
                                     animations:^{
                                         self.labelOutlet.alpha = 1.0;
                                         if (threeStrongest == 1 && self.myRules.playerHasThree == TRUE && self.myRules.dealerHasThree == TRUE ) {
                                             self.labelOutlet.text = @"You win!! You have stronger three of a kind cards";
                                         }
                                         if (threeStrongest == 2 && self.myRules.playerHasThree == TRUE && self.myRules.dealerHasThree == TRUE ) {
                                             self.labelOutlet.text = @"Dealer wins..Your cards are not strong enough.";
                                         }
                                         if (threeStrongest == 1 && self.myRules.playerHasThree == TRUE && self.myRules.dealerHasThree == FALSE ) {
                                             self.labelOutlet.text = @"You win!! You have three of a kind";
                                         }
                                         if (threeStrongest == 2 && self.myRules.playerHasThree == FALSE && self.myRules.dealerHasThree ==  TRUE ) {
                                             self.labelOutlet.text = @"Dealer wins..Dealer has three of a kind";
                                         }
                                         
                                         if (threeStrongest == 3 ) {
                                             self.labelOutlet.text = @"No result. Enable more winning hands and play again!";
                                         }
                                         
                                     }
                                     completion:nil];
                }];
            }
        
    }
    
   
    
    if (self.mySettings.setPair){
        BOOL fourCards = FALSE, straightCards = FALSE, threeCards = FALSE;
        if (self.mySettings.setFour) {
            if (self.myRules.dealerHasFour || self.myRules.playerHasFour) {
                fourCards = TRUE;
            }
        }
        if (self.mySettings.setStraight) {
            if (self.myRules.dealerHasStraight || self.myRules.playerHasStraight) {
                straightCards = TRUE;
            }
        }
        if (self.mySettings.setThree) {
            if (self.myRules.dealerHasThree || self.myRules.playerHasThree) {
                threeCards = TRUE;
            }
        }
        
        if ((!straightCards && !fourCards && !threeCards && !self.mySettings.setNoCommonCards) || (!straightCards && !fourCards && !threeCards && (self.myRules.playerHasTwo || self.myRules.dealerHasTwo))){
            [UIView animateWithDuration:0.0 delay:0.5 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
                self.labelOutlet.alpha = 0.0;
            }completion: ^(BOOL finished){
                [UIView animateWithDuration:0.5
                                      delay: 0.2
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     self.labelOutlet.alpha = 1.0;
                                     if (twoStrongest == 1 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo == TRUE ) {
                                         self.labelOutlet.text = @"You win!! You have the stronger pair";
                                     }
                                     if (twoStrongest == 2 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo == TRUE ) {
                                         self.labelOutlet.text = @"Dealer wins..Your pair is not strong enough.";
                                     }
                                     if (twoStrongest == 1 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo == FALSE ) {
                                         self.labelOutlet.text = @"You win!! You have a pair";
                                     }
                                     if (twoStrongest == 2 && self.myRules.playerHasTwo == FALSE && self.myRules.dealerHasTwo ==     TRUE ) {
                                         self.labelOutlet.text = @"Dealer wins..Dealer has a pair";
                                     }
                                     
                                     if (twoStrongest == 5 ) {
                                         self.labelOutlet.text = @"Dealer wins..Dealer has two pairs";
                                     }
                                     if (twoStrongest == 6) {
                                         self.labelOutlet.text = @"You win!! You have two pairs";
                                     }
                                     if (twoStrongest == 15 ) {
                                         self.labelOutlet.text = @"Dealer wins..Dealer has pairs";
                                     }
                                     if (twoStrongest == 16) {
                                         self.labelOutlet.text = @"You win!! You have pairs";
                                     }
                                     
                                     
                                     if (twoStrongest == 7 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo ==     TRUE ) {
                                         self.labelOutlet.text = @"You win!! Your smaller pair is stronger";
                                     }
                                     if (twoStrongest == 8 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo ==     TRUE ) {
                                         self.labelOutlet.text = @"Dealer wins... Dealer's smaller pair is stronger";
                                     }
                                     if (twoStrongest == 9 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo ==     TRUE ) {
                                         self.labelOutlet.text = @"You win!! Your smaller pair has the higher ranking suit";
                                     }
                                     if (twoStrongest == 10 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo ==     TRUE ) {
                                         self.labelOutlet.text = @"Dealer wins... Dealer's smaller pair has the higher ranking suit";
                                     }
                                     if (twoStrongest == 11 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo ==     TRUE ) {
                                         self.labelOutlet.text = @"You win!! Your bigger pair has the higher ranking suit";
                                     }
                                     if (twoStrongest == 12 && self.myRules.playerHasTwo == TRUE && self.myRules.dealerHasTwo ==     TRUE ) {
                                         self.labelOutlet.text = @"Dealer wins!! Dealer's bigger pair has the higher ranking suit";
                                     }
                                     if (twoStrongest == 4) {
                                         self.labelOutlet.text = @"It is a tie! Both of you have equally ranked pairs";
                                     }
                                     
                                     if (twoStrongest == 3 ) {
                                         self.labelOutlet.text = @"No result. Play again!!";
                                     }
                                     
                                 }
                                 completion:nil];
            }];

            
        
        }
    }

    
    
    if(self.mySettings.setNoCommonCards){
        BOOL fourCards = FALSE, straightCards = FALSE, threeCards = FALSE, pairCards = FALSE;
        if (self.mySettings.setFour) {
            if (self.myRules.dealerHasFour || self.myRules.playerHasFour) {
                fourCards = TRUE;
            }
        }
        if (self.mySettings.setStraight) {
            if (self.myRules.dealerHasStraight || self.myRules.playerHasStraight) {
                straightCards = TRUE;
            }
        }
        if (self.mySettings.setThree) {
            if (self.myRules.dealerHasThree || self.myRules.playerHasThree) {
                threeCards = TRUE;
            }
        }
        if (self.mySettings.setPair) {
            if (self.myRules.dealerHasTwo || self.myRules.playerHasTwo) {
                pairCards = TRUE;
            }
        }

        if (!straightCards && !fourCards && !threeCards && !pairCards){
            [UIView animateWithDuration:0.0 delay:0.5 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
                self.labelOutlet.alpha = 0.0;
            }completion: ^(BOOL finished){
                [UIView animateWithDuration:0.5
                                      delay: 0.2
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     self.labelOutlet.alpha = 1.0;
                                     if (oneStrongest == 1 ) {
                                         self.labelOutlet.text = @"You win!! You have the largest card";
                                     }
                                     if (oneStrongest == 2) {
                                         self.labelOutlet.text = @"Dealer wins..Dealer has the largest card";
                                     }
                                     if (oneStrongest == 3 ) {
                                         self.labelOutlet.text = @"You win!! Your largest card has a higher ranking suit";
                                     }
                                     if (oneStrongest == 4) {
                                         self.labelOutlet.text = @"Dealer wins..though you have the same highest card number, dealer has the higher ranked suit";
                                     }
                                 }
                                 completion:nil];
            }];
        }
    }
    
}

//Reset the game
- (IBAction)resetGameButton:(id)sender {
    [self.settingsOutlet setEnabled: YES];
    self.playOutlet.hidden = YES;
    self.resetGameOutlet.hidden = YES;
    self.labelOutlet.text = @"";
    [self.myGame.dealerHand removeAllObjects];
    [self.myGame.playerHand removeAllObjects];
    self.myGame = [Game new];
    self.myDeck = [self.myGame newGame];
    self.myRules = [Rules new];
    
    NSString *imageName;
    for (int i = 0; i < 52; i++) {
        NSString* card = self.myDeck.cards.cardDeck[i];
        imageName = [NSString stringWithFormat:@"%@.png",card];
        self.cardImages[i] = [UIImage imageNamed:imageName];
    }
    
    self.countP1Pressed = 0;
    self.countP2Pressed = 0;
    self.countP3Pressed = 0;
    self.countP4Pressed = 0;
    self.countP5Pressed = 0;
    
    
    [self.p1ButtonOutlet setEnabled:NO];
    [self.p2ButtonOutlet setEnabled:NO];
    [self.p3ButtonOutlet setEnabled:NO];
    [self.p4ButtonOutlet setEnabled:NO];
    [self.p5ButtonOutlet setEnabled:NO];
    
    
    [UIView animateWithDuration:1.0 delay:0.0 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
        self.dealerFirst.alpha = 0.0;
        self.dealerSecond.alpha = 0.0;
        self.dealerThird.alpha = 0.0;
        self.dealerFourth.alpha = 0.0;
        self.dealerFifth.alpha = 0.0;
    }completion: ^(BOOL finished){
        [UIView animateWithDuration:1.0
                              delay: 0.2
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.dealerFirst.image = nil;
                             self.dealerFirst.alpha = 1.0;
                             self.dealerSecond.image = nil;
                             self.dealerSecond.alpha = 1.0;
                             self.dealerThird.image = nil;
                             self.dealerThird.alpha = 1.0;
                             self.dealerFourth.image = nil;
                             self.dealerFourth.alpha = 1.0;
                             self.dealerFifth.image = nil;
                             self.dealerFifth.alpha = 1.0;
                             
                         }
                         completion:nil];
    }];
    
    [UIView animateWithDuration:1.0 delay:0.5 options:(UIViewAnimationOptions)UIViewAnimationCurveEaseOut animations: ^{
        self.playerFirst.alpha = 0.0;
        self.playerSecond.alpha = 0.0;
        self.playerThird.alpha = 0.0;
        self.playerFourth.alpha = 0.0;
        self.playerFifth.alpha = 0.0;
    }completion: ^(BOOL finished){
        [UIView animateWithDuration:1.0
                              delay: 0.2
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.playerFirst.image = nil;
                             self.playerFirst.alpha = 1.0;
                             self.playerSecond.image = nil;
                             self.playerSecond.alpha = 1.0;
                             self.playerThird.image = nil;
                             self.playerThird.alpha = 1.0;
                             self.playerFourth.image = nil;
                             self.playerFourth.alpha = 1.0;
                             self.playerFifth.image = nil;
                             self.playerFifth.alpha = 1.0;
                             [self.dealOutlet setEnabled: YES];
                             self.dealOutlet.hidden = NO;
                             
                         }
                         completion:nil];
    }];
    
    
    
}

@end
