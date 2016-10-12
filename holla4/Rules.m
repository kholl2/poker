//
//  Rules.m
//  holla4
//
//  Created by Kruthika Holla on 7/21/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import "Rules.h"

@implementation Rules

-(void) sortHand:(NSMutableArray *)hand {
    
    //sort spades cards
    self.sCount = 0;
    NSMutableArray* spadesCards = [NSMutableArray array];
    for (int i = 0; i<5; i++) {
        if ([hand[i] hasPrefix :@"s"]){
            self.sCount++;
            [spadesCards addObject:hand[i]];
        }
    }
    if ([spadesCards count] > 0) {
        [hand removeObjectsInArray:spadesCards];
    }
    
    if ([spadesCards count] > 1) {
        int pos_min;
        NSString *tmp;
        for (int i = 0; i< [spadesCards count] - 1; i++) {
            pos_min = i;
            for (int j = i+1; j < [spadesCards count]; j++) {
                int first = [[spadesCards[j] substringFromIndex:1]intValue];
                int second = [[spadesCards[pos_min] substringFromIndex:1] intValue];
                if (first == 1) {
                    first = 14;
                }
                if (second == 1) {
                    second = 14;
                }
                if (first < second) {
                    pos_min = j;
                }
            }
            if (pos_min!=i) {
                tmp = spadesCards[i];
                spadesCards[i] = spadesCards[pos_min];
                spadesCards[pos_min] = tmp;
            }
        }
        for (int i = (int)[spadesCards count] - 1; i >= 0; i--) {
            [hand insertObject:spadesCards[i] atIndex:0];
        }
    }
    
    if ([spadesCards count] == 1) {
        [hand insertObject:spadesCards[0] atIndex:0];
    }
    
    //sort heart cards
    self.hCount = 0;
    NSMutableArray* heartCards = [NSMutableArray array];
    for (int i = 0; i<5; i++) {
        if ([hand[i] hasPrefix :@"h"]){
            self.hCount++;
            [heartCards addObject:hand[i]];
        }
    }
    if ([heartCards count] > 0) {
        [hand removeObjectsInArray:heartCards];
    }
    
    if ([heartCards count] > 1) {
        int pos_min;
        NSString *tmp;
        for (int i = 0; i< [heartCards count] - 1; i++) {
            pos_min = i;
            for (int j = i+1; j < [heartCards count]; j++) {
                int first = [[heartCards[j] substringFromIndex:1]intValue];
                int second = [[heartCards[pos_min] substringFromIndex:1]intValue];
                if (first == 1) {
                    first = 14;
                }
                if (second == 1) {
                    second = 14;
                }
                if (first < second) {
                    pos_min = j;
                }
            }
            if (pos_min!=i) {
                tmp = heartCards[i];
                heartCards[i] = heartCards[pos_min];
                heartCards[pos_min] = tmp;
            }
        }
        for (int i = (int)[heartCards count] - 1; i >= 0; i--) {
            [hand insertObject:heartCards[i] atIndex:0];
        }
    }
    
    if ([heartCards count] == 1) {
        [hand insertObject:heartCards[0] atIndex:0];
    }

    
    //sort clubs cards
    self.cCount = 0;
    NSMutableArray* clubCards = [NSMutableArray array];
    for (int i = 0; i<5; i++) {
        if ([hand[i] hasPrefix :@"c"]){
            self.cCount++;
            [clubCards addObject:hand[i]];
        }
    }
    if ([clubCards count] > 0) {
        [hand removeObjectsInArray:clubCards];
    }
    
    if ([clubCards count] > 1) {
        int pos_min = 0;
        NSString *tmp;
        for (int i = 0; i< [clubCards count] - 1; i++) {
            pos_min = i;
            for (int j = i+1; j < [clubCards count]; j++) {
                int first = [[clubCards[j] substringFromIndex:1] intValue];
                int second = [[clubCards[pos_min] substringFromIndex:1] intValue];
                if (first == 1) {
                    first = 14;
                }
                if (second == 1) {
                    second = 14;
                }
                if (first < second) {
                    pos_min = j;
                }
            }
            if (pos_min!=i) {
                tmp = clubCards[i];
                clubCards[i] = clubCards[pos_min];
                clubCards[pos_min] = tmp;
            }
        }
        
   
        for (int i = (int)[clubCards count] - 1; i >= 0; i--) {
            [hand insertObject:clubCards[i] atIndex:0];
        }
        
    }
    
    if ([clubCards count] == 1) {
        [hand insertObject:clubCards[0] atIndex:0];
    }
    
    
    //sort diamonds cards
    self.dCount = 0;
    NSMutableArray* diamonCards = [NSMutableArray array];
    for (int i = 0; i<5; i++) {
        if ([hand[i] hasPrefix :@"d"]){
            self.dCount++;
            [diamonCards addObject:hand[i]];
        }
    }
    
    
    if (self.dCount > 0) {
        [hand removeObjectsInArray:diamonCards];
    }
    
    
    
    if (self.dCount > 1) {
        int pos_min = 0;
        NSString *tmp;
        for (int i = 0; i< (self.dCount - 1); i++) {
            pos_min = i;
            for (int j = i+1; j < self.dCount; j++) {
                int first = [[diamonCards[j] substringFromIndex:1]intValue];
                int second = [[diamonCards[pos_min] substringFromIndex:1]intValue];
                if (first == 1) {
                    first = 14;
                }
                if (second == 1) {
                    second = 14;
                }
                if (first < second) {
                    pos_min = j;
                }
            }
            if (pos_min!=i) {
                tmp = diamonCards[i];
                diamonCards[i] = diamonCards[pos_min];
                diamonCards[pos_min] = tmp;
            }
        }
        for (int i = (self.dCount-1); i >=0; i--) {
            [hand insertObject:diamonCards[i] atIndex:0];
        }
        
    }
    
    if ([diamonCards count] == 1) {
        [hand insertObject:diamonCards[0] atIndex:0];
    }
}

-(BOOL) checkHandHasNoCommon:(NSMutableArray *)hand{
    int count;
    for (int i = 0; i < 4; i++) {
        int index = i;
        for (int j = i+1; j < 5; j++){
            int first = [[hand[index] substringFromIndex:1]intValue];
            int second = [[hand[j] substringFromIndex:1]intValue];
            if (first == second && index == 0) {
                count++;
            }
            if (first == second && index == 1) {
                count++;
            }
            
            if (first == second && index == 2) {
                count++;
            }
            if (first == second && index == 3) {
                count++;
            }
            
        }
    }
    if (count > 0) {
        return TRUE;
    }
    return FALSE;
}



-(int) fourStrongCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand{
    int count1 = 0;
    int count2 = 0;
    NSString *dealerCard;
    NSString *playerCard;
    self.dealerHasFour = FALSE;
    self.playerHasFour =FALSE;
    for (int i = 0; i < 2; i++) {
        int index = i;
        for (int j = i+1; j < 5; j++){
            int first = [[dealerHand[index] substringFromIndex:1]intValue];
            int second = [[dealerHand[j] substringFromIndex:1]intValue];
            if (first == second && index == 0) {
                count1++;
                if (count1 == 3) {
                    dealerCard = dealerHand[j];
                    self.dealerHasFour = TRUE;
                    break;
                }
            }
            if (first == second && index == 1) {
                count2++;
                if (count2 == 3) {
                    dealerCard = dealerHand[j];
                    self.dealerHasFour = TRUE;
                }
            }
            
        }
    }
    
    count1 = 0;
    count2 = 0;
    for (int i = 0; i < 2; i++) {
        int index = i;
        for (int j = i+1; j < 5; j++){
            int first = [[playerHand[index] substringFromIndex:1]intValue];
            int second = [[playerHand[j] substringFromIndex:1]intValue];
            if (first == second && index == 0) {
                count1++;
                if (count1 == 3) {
                    playerCard = playerHand[j];
                    self.playerHasFour = TRUE;
                    break;
                }
            }
            if (first == second && index == 1) {
                count2++;
                if (count2 == 3) {
                    playerCard = playerHand[j];
                    self.playerHasFour = TRUE;
                }
            }
        }
    }
    
    if (self.playerHasFour && self.dealerHasFour) {
        int first = [[playerCard substringFromIndex:1]intValue];
        int second = [[dealerCard substringFromIndex:1]intValue];
        if (first == 1) {
            first = 14;
        }
        if (second == 1) {
            second = 14;
        }
        if (first > second) {
            return 1;
        }
        else
            return  2;
    }
    
    if (self.playerHasFour && !self.dealerHasFour){
        return 1;
    }
    
    if (!self.playerHasFour && self.dealerHasFour) {
        return 2;
    }
    
    return 3;
}

-(int) threeStrongCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand{
    int count1 = 0;
    int count2 = 0;
    int count3 = 0;
    NSString *dealerCard;
    NSString *playerCard;
    self.dealerHasThree = FALSE;
    self.playerHasThree =FALSE;
    for (int i = 0; i < 3; i++) {
        int index = i;
        for (int j = i+1; j < 5; j++){
            int first = [[dealerHand[index] substringFromIndex:1]intValue];
            int second = [[dealerHand[j] substringFromIndex:1]intValue];
            if (first == second && index == 0) {
                count1++;
                if (count1 == 2) {
                    dealerCard = dealerHand[j];
                    self.dealerHasThree = TRUE;
                    break;
                }
            }
            if (first == second && index == 1) {
                count2++;
                if (count2 == 2) {
                    dealerCard = dealerHand[j];
                    self.dealerHasThree = TRUE;
                    break;
                }
            }
            
            if (first == second && index == 2) {
                count3++;
                if (count3 == 2) {
                    dealerCard = dealerHand[j];
                    self.dealerHasThree = TRUE;
                }
            }
            
        }
    }
    count1 = 0;
    count2 = 0;
    count3 = 0;
    for (int i = 0; i < 3; i++) {
        int index = i;
        for (int j = i+1; j < 5; j++){
            int first = [[playerHand[index] substringFromIndex:1]intValue];
            int second = [[playerHand[j] substringFromIndex:1]intValue];
            if (first == second && index == 0) {
                count1++;
                if (count1 == 2) {
                    playerCard = playerHand[j];
                    self.playerHasThree = TRUE;
                    break;
                }
            }
            if (first == second && index == 1) {
                count2++;
                if (count2 == 2) {
                    playerCard = playerHand[j];
                    self.playerHasThree = TRUE;
                    break;
                }
            }
            if (first == second && index == 2) {
                count3++;
                if (count3 == 2) {
                    playerCard = playerHand[j];
                    self.playerHasThree = TRUE;
                }
            }
        }
    }
    
    if (self.playerHasThree && self.dealerHasThree) {
        int first = [[playerCard substringFromIndex:1]intValue];
        int second = [[dealerCard substringFromIndex:1]intValue];
        if (first == 1) {
            first = 14;
        }
        if (second == 1) {
            second = 14;
        }
        if (first > second) {
            return 1;
        }
        else
            return  2;
    }
    
    if (self.playerHasThree && !self.dealerHasThree){
        return 1;
    }
    
    if (!self.playerHasThree && self.dealerHasThree) {
        return 2;
    }
    
    return 3;
    
}

-(NSMutableArray*) getThePair : (NSMutableArray*) card1 and:(NSMutableArray*) card2{
    int first = [[card1[0] substringFromIndex:1]intValue];
    int second = [[card2[0] substringFromIndex:1]intValue];
    if (first == 1) {
        first = 14;
    }
    if (second == 1) {
        second = 14;
    }
    if (first > second) {
        return card1;
    }
    if (second > first) {
        return card2;
    }
    else
        return card1;
}

-(NSMutableArray*) getSmallerPair: (NSMutableArray*) card1 and:(NSMutableArray*) card2{
    int first = [[card1[0] substringFromIndex:1]intValue];
    int second = [[card2[0] substringFromIndex:1]intValue];
    if (first == 1) {
        first = 14;
    }
    if (second == 1) {
        second = 14;
    }
    if (first > second) {
        return card2;
    }
    if (second > first) {
        return card1;
    }
    else
        return card1;
    
}


-(int) rankSuits : (NSString*) suit{
    if ([suit isEqualToString:@"d"]) {
        return 1;
    }
    if ([suit isEqualToString:@"c"]) {
        return 2;
    }
    if ([suit isEqualToString:@"h"]) {
        return 3;
    }
    if ([suit isEqualToString:@"s"]) {
        return 4;
    }
    return 0;
}


-(int) twoStrongCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand{
    
    int count1 = 0;
    int count2 = 0;
    int count3 = 0;
    int count4 = 0;
    int count = 0;
    NSMutableArray *dealerPair;
    NSMutableArray *playerPair;
    self.dealerHasTwo = FALSE;
    self.playerHasTwo =FALSE;
    BOOL dealerHasTwo1 = FALSE;
    BOOL dealerHasTwo2 = FALSE;
    BOOL dealerHasTwo3 = FALSE;
    BOOL dealerHasTwo4 = FALSE;
    NSMutableArray* dealerCard1,  *dealerCard2, *dealerCard3, *dealerCard4;
    dealerCard1 = [NSMutableArray array];
    dealerCard2 = [NSMutableArray array];
    dealerCard3 = [NSMutableArray array];
    dealerCard4 = [NSMutableArray array];
    dealerPair = [NSMutableArray array];
    BOOL playerHasTwo1 = FALSE;
    BOOL playerHasTwo2 = FALSE;
    BOOL playerHasTwo3 = FALSE;
    BOOL playerHasTwo4 = FALSE;
    NSMutableArray* playerCard1, *playerCard2, *playerCard3, *playerCard4;
    playerCard1 = [NSMutableArray array];
    playerCard2 = [NSMutableArray array];
    playerCard3 = [NSMutableArray array];
    playerCard4 = [NSMutableArray array];
    playerPair = [NSMutableArray array];
    NSMutableArray *smallerPlayerPair = [NSMutableArray array];
    NSMutableArray *smallerDealerPair = [NSMutableArray array];
    BOOL dealerTwoPairs = FALSE;
    BOOL playerTwoPairs = FALSE;
    for (int i = 0; i < 4; i++) {
        int index = i;
        for (int j = i+1; j < 5; j++){
            int first = [[dealerHand[index] substringFromIndex:1]intValue];
            int second = [[dealerHand[j] substringFromIndex:1]intValue];
            if (first == second && index == 0) {
                count1++;
                if (count1 == 1) {
                    [dealerCard1 addObject:dealerHand[j]];
                    [dealerCard1 addObject:dealerHand[index]];
                    dealerHasTwo1 = TRUE;
                    count++;
                    break;
                }
            }
            if (first == second && index == 1) {
                count2++;
                if (count2 == 1) {
                    [dealerCard2 addObject:dealerHand[j]];
                    [dealerCard2 addObject:dealerHand[index]];
                    dealerHasTwo2 = TRUE;
                    count++;
                    break;
                }
            }
            
            if (first == second && index == 2) {
                count3++;
                if (count3 == 1) {
                    [dealerCard3 addObject:dealerHand[j]];
                    [dealerCard3 addObject:dealerHand[index]];
                    dealerHasTwo3 = TRUE;
                    count++;
                    break;
                }
            }
            if (first == second && index == 3) {
                count4++;
                if (count4 == 1) {
                    [dealerCard4 addObject:dealerHand[j]];
                    [dealerCard4 addObject:dealerHand[index]];
                    dealerHasTwo4 = TRUE;
                    count++;
                }
            }
            
        }
    }
    if (count > 0) {
        self.dealerHasTwo = TRUE;
    }
    
    
    if (self.dealerHasTwo && count == 1) {
        if (dealerHasTwo1)
            [dealerPair addObjectsFromArray:dealerCard1];
        if (dealerCard2)
            [dealerPair addObjectsFromArray:dealerCard2];
        if (dealerCard3)
            [dealerPair addObjectsFromArray:dealerCard3];
        if (dealerCard4)
            [dealerPair addObjectsFromArray:dealerCard4];
    }
    

    count1 = 0;
    count2 = 0;
    count3 = 0;
    count4 = 0;
    int countp = 0;
    for (int i = 0; i < 4; i++) {
        int index = i;
        for (int j = i+1; j < 5; j++){
            int first = [[playerHand[index] substringFromIndex:1]intValue];
            int second = [[playerHand[j] substringFromIndex:1]intValue];
            if (first == second && index == 0) {
                count1++;
                if (count1 == 1) {
                    [playerCard1 addObject:playerHand[j]];
                    [playerCard1 addObject:playerHand[index]];
                    playerHasTwo1 = TRUE;
                    countp++;
                    break;
                }
            }
            if (first == second && index == 1) {
                count2++;
                if (count2 == 1) {
                    [playerCard2 addObject:playerHand[j]];
                    [playerCard2 addObject:playerHand[index]];
                    playerHasTwo2 = TRUE;
                    countp++;
                    break;
                }
            }
            
            if (first == second && index == 2) {
                count3++;
                if (count3 == 1) {
                    [playerCard3 addObject:playerHand[j]];
                    [playerCard3 addObject:playerHand[index]];
                    playerHasTwo3 = TRUE;
                    countp++;
                    break;
                }
            }
            if (first == second && index == 3) {
                count4++;
                if (count4 == 1) {
                    [playerCard4 addObject:playerHand[j]];
                    [playerCard4 addObject:playerHand[index]];
                    playerHasTwo4 = TRUE;
                    countp++;
                }
            }
            
        }
    }
    if (countp > 0) {
        self.playerHasTwo = TRUE;
    }
    
    if (self.playerHasTwo && countp == 1) {
        if (playerHasTwo1)
            [playerPair addObjectsFromArray:playerCard1];
        if (dealerCard2)
            [playerPair addObjectsFromArray:playerCard2];
        if (dealerCard3)
            [playerPair addObjectsFromArray:playerCard3];
        if (dealerCard4)
            [playerPair addObjectsFromArray:playerCard4];
    }
    
    if (count >= 2 && countp != 2) {
        if (dealerHasTwo1 && dealerHasTwo2) {
            dealerPair  = [self getThePair:dealerCard1 and:dealerCard2];
            smallerDealerPair = [self getSmallerPair:dealerCard1 and:dealerCard2];
            dealerTwoPairs = TRUE;
            int first = [[dealerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerDealerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 15;
            }
        }
        if (dealerHasTwo1 && dealerHasTwo3) {
            
            dealerPair = [self getThePair:dealerCard1 and:dealerCard3];
            smallerDealerPair = [self getSmallerPair:dealerCard1 and:dealerCard3];
            dealerTwoPairs = TRUE;
            int first = [[dealerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerDealerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 15;
            }
        }
        if (dealerHasTwo1 && dealerHasTwo4) {
            
            dealerPair = [self getThePair:dealerCard1 and:dealerCard4];
            smallerDealerPair = [self getSmallerPair:dealerCard1 and:dealerCard4];
            dealerTwoPairs = TRUE;
            int first = [[dealerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerDealerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 15;
            }
        }
        if (dealerHasTwo2 && dealerHasTwo3) {
            dealerPair = [self getThePair:dealerCard2 and:dealerCard3];
            smallerDealerPair = [self getSmallerPair:dealerCard2 and:dealerCard3];
            dealerTwoPairs = TRUE;
            int first = [[dealerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerDealerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 15;
            }
        }
        if (dealerHasTwo2 && dealerHasTwo4) {
            dealerPair = [self getThePair:dealerCard2 and:dealerCard4];
            smallerDealerPair = [self getSmallerPair:dealerCard2 and:dealerCard4];
            dealerTwoPairs = TRUE;
            int first = [[dealerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerDealerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 15;
            }
        }
        if (dealerHasTwo3 && dealerHasTwo4) {
            dealerPair = [self getThePair:dealerCard3 and:dealerCard4];
            smallerDealerPair = [self getSmallerPair:dealerCard3 and:dealerCard4];
            dealerTwoPairs = TRUE;
            int first = [[dealerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerDealerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 15;
            }
        }
        return 5;
    }
    
    if (count != 2 && countp >= 2) {
        
        if (playerHasTwo1 && playerHasTwo2) {
            [playerPair addObjectsFromArray:[self getThePair:playerCard1 and:playerCard2]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard1 and:playerCard2]];
            playerTwoPairs = TRUE;
            int first = [[playerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerPlayerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 16;
            }
        }
        if (playerHasTwo1 && playerHasTwo3) {
            
            [playerPair addObjectsFromArray:[self getThePair:playerCard1 and:playerCard3]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard1 and:playerCard3]];
            playerTwoPairs = TRUE;
            int first = [[playerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerPlayerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 16;
            }
        }
        if (playerHasTwo1 && playerHasTwo4) {
            
            [playerPair addObjectsFromArray: [self getThePair:playerCard1 and:playerCard4]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard1 and:playerCard4]];
            playerTwoPairs = TRUE;
            int first = [[playerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerPlayerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 16;
            }
        }
        if (playerHasTwo2 && playerHasTwo3) {
            [playerPair addObjectsFromArray:[self getThePair:playerCard2 and:playerCard3]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard2 and:playerCard3]];
            playerTwoPairs = TRUE;
            int first = [[playerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerPlayerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 16;
            }
        }
        if (playerHasTwo2 && playerHasTwo4) {
            [playerPair addObjectsFromArray: [self getThePair:playerCard2 and:playerCard4]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard2 and:playerCard4]];
            playerTwoPairs = TRUE;
            int first = [[playerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerPlayerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 16;
            }
        }
        if (playerHasTwo3 && playerHasTwo4) {
            [playerPair addObjectsFromArray: [self getThePair:playerCard3 and:playerCard4]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard3 and:playerCard4]];
            playerTwoPairs = TRUE;
            int first = [[playerPair[0] substringFromIndex:1]intValue];
            int second = [[smallerPlayerPair[0] substringFromIndex:1]intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first == second) {
                return 16;
            }
        }

        
        return 6;
    }
    
    if (self.dealerHasTwo && count == 2) {
        if (dealerHasTwo1 && dealerHasTwo2) {
            dealerPair  = [self getThePair:dealerCard1 and:dealerCard2];
            smallerDealerPair = [self getSmallerPair:dealerCard1 and:dealerCard2];
            dealerTwoPairs = TRUE;
        }
        if (dealerHasTwo1 && dealerHasTwo3) {
            
            dealerPair = [self getThePair:dealerCard1 and:dealerCard3];
            smallerDealerPair = [self getSmallerPair:dealerCard1 and:dealerCard3];
            dealerTwoPairs = TRUE;
        }
        if (dealerHasTwo1 && dealerHasTwo4) {
            
            dealerPair = [self getThePair:dealerCard1 and:dealerCard4];
            smallerDealerPair = [self getSmallerPair:dealerCard1 and:dealerCard4];
            dealerTwoPairs = TRUE;
        }
        if (dealerHasTwo2 && dealerHasTwo3) {
            dealerPair = [self getThePair:dealerCard2 and:dealerCard3];
            smallerDealerPair = [self getSmallerPair:dealerCard2 and:dealerCard3];
            dealerTwoPairs = TRUE;
        }
        if (dealerHasTwo2 && dealerHasTwo4) {
            dealerPair = [self getThePair:dealerCard2 and:dealerCard4];
            smallerDealerPair = [self getSmallerPair:dealerCard2 and:dealerCard4];
            dealerTwoPairs = TRUE;
        }
        if (dealerHasTwo3 && dealerHasTwo4) {
            dealerPair = [self getThePair:dealerCard3 and:dealerCard4];
            smallerDealerPair = [self getSmallerPair:dealerCard3 and:dealerCard4];
            dealerTwoPairs = TRUE;
        }
    }
    
    if (self.playerHasTwo && countp == 2) {
        if (playerHasTwo1 && playerHasTwo2) {
            [playerPair addObjectsFromArray:[self getThePair:playerCard1 and:playerCard2]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard1 and:playerCard2]];
            playerTwoPairs = TRUE;
        }
        if (playerHasTwo1 && playerHasTwo3) {
            
            [playerPair addObjectsFromArray:[self getThePair:playerCard1 and:playerCard3]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard1 and:playerCard3]];
            playerTwoPairs = TRUE;
        }
        if (playerHasTwo1 && playerHasTwo4) {
            
            [playerPair addObjectsFromArray: [self getThePair:playerCard1 and:playerCard4]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard1 and:playerCard4]];
            playerTwoPairs = TRUE;
        }
        if (playerHasTwo2 && playerHasTwo3) {
            [playerPair addObjectsFromArray:[self getThePair:playerCard2 and:playerCard3]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard2 and:playerCard3]];
            playerTwoPairs = TRUE;
        }
        if (playerHasTwo2 && playerHasTwo4) {
            [playerPair addObjectsFromArray: [self getThePair:playerCard2 and:playerCard4]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard2 and:playerCard4]];
            playerTwoPairs = TRUE;
        }
        if (playerHasTwo3 && playerHasTwo4) {
            [playerPair addObjectsFromArray: [self getThePair:playerCard3 and:playerCard4]];
            [smallerPlayerPair addObjectsFromArray:[self getSmallerPair:playerCard3 and:playerCard4]];
            playerTwoPairs = TRUE;
        }
    }
    
    
    
    
    
    if (self.playerHasTwo && self.dealerHasTwo) {
        int first = [[playerPair[0] substringFromIndex:1]intValue];
        int second = [[dealerPair[0] substringFromIndex:1]intValue];
        if (first == 1) {
            first = 14;
        }
        if (second == 1) {
            second = 14;
        }
        if (first > second) {
            return 1;
        }
        if (second > first){
            return  2;
        }
        if (first == second) {
            if (dealerTwoPairs && playerTwoPairs) {
                int first = [[smallerPlayerPair[0] substringFromIndex:1]intValue];
                int second = [[smallerDealerPair[0] substringFromIndex:1]intValue];
                if (first > second) {
                    return 7;
                }
                if (first < second) {
                    return 8;
                }
                if (first == second){
                    NSString *playerPairCard1 = [playerPair[0] substringToIndex:1];
                    NSString *playerPairCard2 = [playerPair[1] substringToIndex:1];
                    NSString *dealerPairCard1 = [dealerPair[0] substringToIndex:1];
                    NSString *dealerPairCard2 = [dealerPair[1] substringToIndex:1];
                    int playerRank = [self rankSuits:playerPairCard1] + [self rankSuits:playerPairCard2];
                    int dealerRank = [self rankSuits:dealerPairCard1] + [self rankSuits:dealerPairCard2];
                    if (playerRank > dealerRank) {
                        return 11;
                    }
                    else if (dealerRank > playerRank){
                        return 12;
                    }
                    else{
                        NSString *playerPairCard1 = [smallerPlayerPair[0] substringToIndex:1];
                        NSString *playerPairCard2 = [smallerPlayerPair[1] substringToIndex:1];
                        NSString *dealerPairCard1 = [smallerDealerPair[0] substringToIndex:1];
                        NSString *dealerPairCard2 = [smallerDealerPair[1] substringToIndex:1];
                        int playerRank = [self rankSuits:playerPairCard1] + [self rankSuits:playerPairCard2];
                        int dealerRank = [self rankSuits:dealerPairCard1] + [self rankSuits:dealerPairCard2];
                        if (playerRank > dealerRank) {
                            return 9;
                        }
                        else if (dealerRank > playerRank){
                            return 10;
                        }
                        else
                            return 4;
                    }
                }
            }
            NSString *playerPairCard1 = [playerPair[0] substringToIndex:1];
            NSString *playerPairCard2 = [playerPair[1] substringToIndex:1];
            NSString *dealerPairCard1 = [dealerPair[0] substringToIndex:1];
            NSString *dealerPairCard2 = [dealerPair[1] substringToIndex:1];
            int playerRank = [self rankSuits:playerPairCard1] + [self rankSuits:playerPairCard2];
            int dealerRank = [self rankSuits:dealerPairCard1] + [self rankSuits:dealerPairCard2];
            if (playerRank > dealerRank) {
                return 1;
            }
            else if (dealerRank > playerRank){
                return 2;
            }
            else
                return 4;
        }
    }
    
    if (self.playerHasTwo && !self.dealerHasTwo){
        return 1;
    }
    
    if (!self.playerHasTwo && self.dealerHasTwo) {
        return 2;
    }
    
    return 3;
    
}


-(int) noCommonCards : (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand{
    NSString *dealerCard;
    NSString *playerCard;
    int pos_min;
    NSString *tmp;
    for (int i = 0; i< 4; i++) {
        pos_min = i;
        for (int j = i+1; j < 5; j++) {
            int first = [[dealerHand[j] substringFromIndex:1]intValue];
            int second = [[dealerHand[pos_min] substringFromIndex:1] intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first < second) {
                pos_min = j;
            }
        }
        if (pos_min!=i) {
            tmp = dealerHand[i];
            dealerHand[i] = dealerHand[pos_min];
            dealerHand[pos_min] = tmp;
        }
    }
    
    dealerCard = dealerHand[4];
    
    for (int i = 0; i< 4; i++) {
        pos_min = i;
        for (int j = i+1; j < 5; j++) {
            int first = [[playerHand[j] substringFromIndex:1]intValue];
            int second = [[playerHand[pos_min] substringFromIndex:1] intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first < second) {
                pos_min = j;
            }
        }
        if (pos_min!=i) {
            tmp = playerHand[i];
            playerHand[i] = playerHand[pos_min];
            playerHand[pos_min] = tmp;
        }
    }
    
    playerCard = playerHand[4];
    
    int first = [[playerCard substringFromIndex:1] intValue];
    int second = [[dealerCard substringFromIndex:1] intValue];
    if (first == 1) {
        first = 14;
    }
    if (second == 1) {
        second = 14;
    }

    if (first > second) {
        return 1;
    }
    if (first < second) {
        return 2;
    }
    
    NSString *playerCardSuit = [playerCard substringToIndex:1];
    NSString *dealerCardSuit = [dealerCard substringToIndex:1];
    int playerRank = [self rankSuits:playerCardSuit] ;
    int dealerRank = [self rankSuits:dealerCardSuit] ;
    if (playerRank > dealerRank) {
        return 3;
    }
    
    return 4;
    
}

-(int) straightCards: (NSMutableArray*) dealerHand or: (NSMutableArray*) playerHand{
    int pos_min;
    NSString *tmp;
    self.dealerHasStraight = FALSE;
    self.playerHasStraight = FALSE;
    for (int i = 0; i< 4; i++) {
        pos_min = i;
        for (int j = i+1; j < 5; j++) {
            int first = [[dealerHand[j] substringFromIndex:1]intValue];
            int second = [[dealerHand[pos_min] substringFromIndex:1] intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first < second) {
                pos_min = j;
            }
        }
        if (pos_min!=i) {
            tmp = dealerHand[i];
            dealerHand[i] = dealerHand[pos_min];
            dealerHand[pos_min] = tmp;
        }
    }
    for (int i = 0; i< 4; i++) {
        pos_min = i;
        for (int j = i+1; j < 5; j++) {
            int first = [[playerHand[j] substringFromIndex:1]intValue];
            int second = [[playerHand[pos_min] substringFromIndex:1] intValue];
            if (first == 1) {
                first = 14;
            }
            if (second == 1) {
                second = 14;
            }
            if (first < second) {
                pos_min = j;
            }
        }
        if (pos_min!=i) {
            tmp = playerHand[i];
            playerHand[i] = playerHand[pos_min];
            playerHand[pos_min] = tmp;
        }
    }
    NSMutableArray *dealerNumbers = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        int first = [[dealerHand[i] substringFromIndex:1]intValue];
        dealerNumbers[i] = [NSNumber numberWithInt:first];
    }
    
    if (([dealerNumbers[1] integerValue] - [dealerNumbers[0] integerValue] == 1) && ([dealerNumbers[2] integerValue] - [dealerNumbers[1] integerValue] == 1) && ([dealerNumbers[3] integerValue] - [dealerNumbers[2] integerValue] == 1) && ([dealerNumbers[4] integerValue] - [dealerNumbers[3] integerValue] == 1)) {
        self.dealerHasStraight = TRUE;
    }
    
    
    NSMutableArray *playerNumbers = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        int first = [[playerHand[i] substringFromIndex:1]intValue];
        playerNumbers[i] = [NSNumber numberWithInt:first];
    }
    
    if (([playerNumbers[1] integerValue] - [playerNumbers[0] integerValue] == 1) && ([playerNumbers[2] integerValue] - [playerNumbers[1] integerValue] == 1) && ([playerNumbers[3] integerValue] - [playerNumbers[2] integerValue] == 1) && ([playerNumbers[4] integerValue] - [playerNumbers[3] integerValue] == 1)) {
        self.playerHasStraight = TRUE;
    }
    
    if (self.playerHasStraight && !self.dealerHasStraight) {
        return 1;
    }
    
    if (self.dealerHasStraight && !self.playerHasStraight) {
        return 2;
    }
    
    if (self.dealerHasStraight && self.playerHasStraight) {
        int first = [[playerHand[0] substringFromIndex:1]intValue];
        int second = [[dealerHand[0] substringFromIndex:1]intValue];
        if (first == 1) {
            first = 14;
        }
        if (second == 1) {
            second = 14;
        }
        if (first > second) {
            return 3;
        }
        if (first < second) {
            return 4;
        }
        if (first == second) {
            return 5;
        }
    }
    
    return 6;
    
}

@end
