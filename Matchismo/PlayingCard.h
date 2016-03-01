//
//  PlayingCard.h
//  Matchismo
//
//  Created by Melissa  Garrett on 2/29/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

// a specific type of Card, a PlayingCard

#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank; // Ace - King

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
