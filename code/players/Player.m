//
//  Player.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//


#import "Player.h"
#import "Banter.h"


@implementation Player


- (id)init {
    self = [super init];
    if (self) {
        _hand = [[Hand alloc] init];
    }
    return self;
}


#pragma mark -
#pragma mark hands


- (Hand *)hand {
    return _hand;
}


#pragma mark -
#pragma mark crib


- (void)startDiscardToCrib {
    
}

- (BOOL)gaveCardsToCrib:(Hand *)crib {
    if (_gaveCardsToCrib) {
        return YES;
    }
    if (_cardForCrib0 && _cardForCrib1) {
        [_hand giveCard:_cardForCrib0 toHolder:crib];
        [_hand giveCard:_cardForCrib1 toHolder:crib];
        _cardForCrib0 = nil;
        _cardForCrib1 = nil;
        _gaveCardsToCrib = YES;
        return YES;
    }
    return NO;
}


#pragma mark -
#pragma mark cards


- (void)receiveCard:(Card *)card {
    [_hand receiveCard:card];
}

- (void)giveCard:(Card *)card toHolder:(NSObject<CardHolder> *)holder {
    
}


#pragma mark -
#pragma mark banter


- (void)resetBanter {
    _didPassBanter = NO;
    _cardForBanter = nil;
}

- (BOOL)canPlayBanter:(Banter *)banter {
    return YES;
}

- (BOOL)didPlayBanter:(Banter *)banter {
    if (_cardForBanter) {
        [banter playCard:_cardForBanter fromPlayer:self];
        _cardForBanter = nil;
        return YES;
    }
    return NO;
}

- (BOOL)didPassBanter {
    return _didPassBanter;
}


@end
