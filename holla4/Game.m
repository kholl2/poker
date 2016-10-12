//
//  Game.m
//  holla4
//
//  Created by Kruthika Holla on 7/20/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import "Game.h"

@implementation Game

-(Deck*) newGame{
    Card *c = [[Card alloc]init];
    Deck *d = [[Deck alloc]initWithCard:c];
    [d shuffleDeck];
    //[d testDeck];
    return d;
}


@end
