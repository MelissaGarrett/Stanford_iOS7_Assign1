//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Melissa  Garrett on 2/29/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

// redeclare score to be readwrite privately so this class can update it
@property(nonatomic, readwrite) NSInteger score;
@property(nonatomic, strong) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init]; // super's designated initializer
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard]; // pick random cards to be used on the UI
            if (card) { // to not surpass the deck's total
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index]; // the just-chosen card
    
    if (!card.isMatched) {
        if (card.isChosen) { // was already face up, they tapped it again, so...
            card.chosen = NO; // put face down
        } else { // was face down, but they tapped it so now it's face up
            // see if match against another card
            for (Card *otherCard in self.cards) { // cycle through the collection
                if (otherCard.isChosen && !otherCard.isMatched) { // if face up and not already matched
                    int matchScore = [card match:@[otherCard]]; // check if there's a match
                    if (matchScore) {
                        self.score += matchScore + MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO; // put face down
                    }
                    break;
                }
                
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES; // mark property as face up
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
   
}

@end
