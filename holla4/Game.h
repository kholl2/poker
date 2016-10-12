//
//  Game.h
//  holla4
//
//  Created by Kruthika Holla on 7/20/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface Game : NSObject

@property NSMutableArray* playerHand;
@property NSMutableArray* dealerHand;

-(Deck*) newGame;


@end
