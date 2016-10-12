//
//  Deck.h
//  holla4
//
//  Created by Kruthika Holla on 7/16/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property Card *cards;

-(id) initWithCard: (Card*) c;
-(Card*) shuffleDeck;
-(void) printDeck;
-(Card*) testDeck;

@end
