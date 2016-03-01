//
//  Card.h
//  Matchismo
//
//  Created by Melissa  Garrett on 2/29/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

// a generic class for any type of Card

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents; //to display on cards that are face up
@property (nonatomic, getter=isChosen) BOOL chosen; // the card is face up
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
