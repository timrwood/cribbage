//
//  Deck.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "Deck.h"

@implementation Deck

- (id)init {
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 52; i++) {
            Card *card = [[Card alloc] initWithIndex:i];
            [_cards addObject:card];
            [_heldCards addObject:card];
        }
    }
    return self;
}

- (void)receiveCard:(Card *)card {
    if (![_heldCards containsObject:card]) {
        [_heldCards addObject:card];
    }
}

- (void)giveCard:(Card *)card toHolder:(NSObject <CardHolder> *)holder {
    [_heldCards removeObject:card];
    [holder receiveCard:card];
}

@end
