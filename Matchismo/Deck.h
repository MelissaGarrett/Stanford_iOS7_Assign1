//
//  Deck.h
//  Matchismo
//
//  Created by Melissa  Garrett on 2/29/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

// a generic deck of cards

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
