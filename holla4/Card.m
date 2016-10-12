//
//  Card.m
//  holla4
//
//  Created by Kruthika Holla on 7/16/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import "Card.h"

@implementation Card

-(id) init{
    self = [super init];
    self.cardDeck = [NSMutableArray array];
    if (self) {
        int j = 0;
        for(int i = 0; i<13; i++){
            self.cardDeck[i] = [NSString stringWithFormat:@"c%i",i+1];
        }
        for(int i = 13; i<26; i++){
           self.cardDeck[i] = [NSString stringWithFormat:@"d%i",j+1];
            j++;
        }
        j = 0;
        for(int i = 26; i<39; i++){
            self.cardDeck[i] = [NSString stringWithFormat:@"h%i",j+1];
            j++;
        }
        j = 0;
        for(int i = 39; i<52; i++){
            self.cardDeck[i] = [NSString stringWithFormat:@"s%i",j+1];
            j++;
        }
    }
    return self;
}



-(void) printCards{
    for (int i = 0; i< 52; i++)
        NSLog(@"%i: %@",i,[self.cardDeck objectAtIndex:i]);
}

@end
