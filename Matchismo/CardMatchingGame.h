//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Melissa  Garrett on 2/29/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// delare readonly because .h is publicly accessible
@property(nonatomic, readonly) NSInteger score;

// the designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
