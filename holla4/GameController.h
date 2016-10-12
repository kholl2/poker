//
//  GameController.h
//  holla4
//
//  Created by Kruthika Holla on 7/16/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "Card.h"
#import "Deck.h"
#import "Game.h"
#import "Rules.h"
#import "Settings.h"

@interface GameController : UIViewController

@property Game *myGame;
@property Deck *myDeck;
@property Rules *myRules;
@property NSMutableArray *cardImages;

@property Settings *mySettings;


@property (weak, nonatomic) IBOutlet UIImageView *centerCard;

- (IBAction)dealButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *dealOutlet;

@property (weak, nonatomic) IBOutlet UIImageView *centerCardOutlet;


@property (weak, nonatomic) IBOutlet UIImageView *dealerFirst;

@property (weak, nonatomic) IBOutlet UIImageView *dealerSecond;

@property (weak, nonatomic) IBOutlet UIImageView *dealerThird;

@property (weak, nonatomic) IBOutlet UIImageView *dealerFourth;

@property (weak, nonatomic) IBOutlet UIImageView *dealerFifth;

- (IBAction)p1Button:(id)sender;

- (IBAction)p2Button:(id)sender;

- (IBAction)p3Button:(id)sender;


- (IBAction)p4Button:(id)sender;


- (IBAction)p5Button:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *playerFirst;

@property (weak, nonatomic) IBOutlet UIImageView *playerSecond;
@property (weak, nonatomic) IBOutlet UIImageView *playerThird;

@property (weak, nonatomic) IBOutlet UIImageView *playerFourth;


@property (weak, nonatomic) IBOutlet UIImageView *playerFifth;



@property (weak, nonatomic) IBOutlet UIButton *p1ButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *p2ButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *p3ButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *p4ButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *p5ButtonOutlet;


@property int countP1Pressed;
@property int countP2Pressed;
@property int countP3Pressed;
@property int countP4Pressed;
@property int countP5Pressed;

- (IBAction)playButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *playOutlet;

@property (weak, nonatomic) IBOutlet UIButton *resetGameOutlet;

- (IBAction)resetGameButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelOutlet;

@property (weak, nonatomic) IBOutlet UIButton *settingsOutlet;


@end
