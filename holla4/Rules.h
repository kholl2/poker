//
//  Rules.h
//  holla4
//
//  Created by Kruthika Holla on 7/21/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rules : NSObject

@property int sCount;
@property int hCount;
@property int cCount;
@property int dCount;

@property BOOL dealerHasStraight;
@property BOOL playerHasStraight;


@property BOOL dealerHasFour;
@property BOOL playerHasFour;

@property BOOL dealerHasThree;
@property BOOL playerHasThree;

@property BOOL dealerHasTwo;
@property BOOL playerHasTwo;

@property BOOL dealerHasOne;
@property BOOL playerHasOne;



-(BOOL) checkHandHasNoCommon: (NSMutableArray*) hand;

-(void) sortHand : (NSMutableArray*) hand;
-(int) straightCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand;
-(int) fourStrongCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand;
-(int) threeStrongCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand;
-(int) twoStrongCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand;
-(int) noCommonCards : (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand;


-(NSMutableArray*) getThePair : (NSMutableArray*) card1 and:(NSMutableArray*) card2;
-(NSMutableArray*) getSmallerPair: (NSMutableArray*) card1 and:(NSMutableArray*) card2;
-(int) rankSuits : (NSString*) suit;

@end
