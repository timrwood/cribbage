//
//  Banter.m
//  cribbage
//
//  Created by Tim Wood on 3/24/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "Banter.h"

@implementation Banter


#pragma mark -
#pragma mark start


- (void)start {
    _activePlayer = _player0;
    _otherPlayer = _player1;
    [self restart];
}

- (void)restart {
    
}

- (void)swapPlayers {
    Player *temp = _activePlayer;
    _activePlayer = _otherPlayer;
    _otherPlayer = temp;
}


#pragma mark -
#pragma mark update


- (void)update {
    if ([_activePlayer canPlayBanter:self]) {
        if ([_activePlayer didPlayBanter:self]) {
            [self swapPlayers];
        }
    } else if ([_otherPlayer canPlayBanter:self]) {
        if ([_activePlayer didPassBanter]) {
            [self swapPlayers];
        }
    } else if ([_activePlayer didPassBanter] && [_otherPlayer didPassBanter]) {
        [self restart];
    }
}

- (BOOL)isFinished {
    return YES;
}


@end
