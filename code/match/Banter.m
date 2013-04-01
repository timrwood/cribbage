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
    [_activePlayer resetBanter];
    [_otherPlayer resetBanter];
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
            if (![_otherPlayer didPassBanter]) {
                [self swapPlayers];
            }
        }
    } else if ([_activePlayer didPassBanter]) {
        if ([_otherPlayer didPassBanter]) {
            [self restart];
        } else {
            [self swapPlayers];
        }
    }
}

- (BOOL)isFinished {
    return YES;
}


#pragma mark -
#pragma mark playing cards


- (void)playCard:(Card *)card fromPlayer:(Player *)player {
    
}


@end
