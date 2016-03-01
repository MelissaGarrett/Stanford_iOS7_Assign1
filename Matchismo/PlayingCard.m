//
//  PlayingCard.m
//  Matchismo
//
//  Created by Melissa  Garrett on 2/29/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// override from superclass because we want to match on rank or suit and give different score values
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) { // can only match to one other card
        PlayingCard *otherCard = [otherCards firstObject]; // an array passed in, but only has one object
        
        if ([self.suit isEqualToString:otherCard.suit]) {
            score = 1;
        } else if (self.rank == otherCard.rank) {
            score = 4;
        }
    }
    
    return score;
}


- (NSString *)contents  // overriding the superclass' getter
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

// *** 'suit' section ***

@synthesize suit = _suit; //because we overrode both getter and setter

+ (NSArray *)validSuits
{
    return @[@"♥︎", @"♦︎", @"♠︎", @"♣︎"];
}

- (void)setSuit:(NSString *)suit  // overriding the setter for suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
        _suit = suit;
}

- (NSString *)suit // overriding the getter for suit
{
    return _suit ? _suit : @"?";
}

// *** 'rank' section' ***

+ (NSArray *)rankStrings // validRanks
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
      @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
        _rank = rank;
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}

@end
