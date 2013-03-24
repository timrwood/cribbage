//
//  Hand.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "Hand.h"

@implementation Hand

- (id)init {
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)receiveCard:(Card *)card {
    if (![_cards containsObject:card]) {
        [_cards addObject:card];
    }
}

- (void)giveCard:(Card *)card toHolder:(NSObject <CardHolder> *)holder {
    [_cards removeObject:card];
    [holder receiveCard:card];
}


#pragma mark -
#pragma mark accessing cards


- (Card *)cardAtIndex:(int)index {
    assert(index > -1);
    assert(index < [_cards count]);
    return [_cards objectAtIndex:index];
}

@end
