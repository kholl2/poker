//
//  Deck.m
//  holla4
//
//  Created by Kruthika Holla on 7/16/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import "Deck.h"

@implementation Deck

-(id) initWithCard:(Card *)c{
    self = [super init];
    if (self) {
        self.cards = c;
    }
    return self;
}

-(Card*) shuffleDeck{
    NSString *tmp;
    for (int i =0; i<52; i++) {
        int x = arc4random()%52;
        tmp = self.cards.cardDeck[i];
        self.cards.cardDeck[i] = self.cards.cardDeck[x];
        self.cards.cardDeck[x] = tmp;
    }
    return self.cards;
}

-(void) printDeck{
    int countCards = (int) [self.cards.cardDeck count];
    NSLog(@"Shuffled deck is:\n");
    for (int i = 0; i < countCards; i++) {
        NSLog(@"%i: %@",i,[self.cards.cardDeck objectAtIndex:i]);
    }
}

-(Card*) testDeck{
    NSString *tmp;
    tmp = self.cards.cardDeck[0];
    self.cards.cardDeck[0] = self.cards.cardDeck[2];
    self.cards.cardDeck[2] = tmp;
    
    tmp = self.cards.cardDeck[1];
    self.cards.cardDeck[1] = self.cards.cardDeck[3];
    self.cards.cardDeck[3] = tmp;
    
    tmp = self.cards.cardDeck[2];
    self.cards.cardDeck[2] = self.cards.cardDeck[4];
    self.cards.cardDeck[4] = tmp;
    
    tmp = self.cards.cardDeck[3];
    self.cards.cardDeck[3] = self.cards.cardDeck[5];
    self.cards.cardDeck[5] = tmp;
    
    tmp = self.cards.cardDeck[4];
    self.cards.cardDeck[4] = self.cards.cardDeck[6];
    self.cards.cardDeck[6] = tmp;
    
    tmp = self.cards.cardDeck[5];
    self.cards.cardDeck[5] = self.cards.cardDeck[7];
    self.cards.cardDeck[7] = tmp;
    
    tmp = self.cards.cardDeck[6];
    self.cards.cardDeck[6] = self.cards.cardDeck[20];
    self.cards.cardDeck[20] = tmp;
    
    tmp = self.cards.cardDeck[7];
    self.cards.cardDeck[7] = self.cards.cardDeck[46];
    self.cards.cardDeck[46] = tmp;
    
    tmp = self.cards.cardDeck[8];
    self.cards.cardDeck[8] = self.cards.cardDeck[43];
    self.cards.cardDeck[43] = tmp;
    
    tmp = self.cards.cardDeck[9];
    self.cards.cardDeck[9] = self.cards.cardDeck[33];
    self.cards.cardDeck[33] = tmp;
    
    return self.cards;
    
    
}

@end
