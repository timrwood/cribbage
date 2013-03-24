//
//  MatchState.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "MatchState.h"

@implementation MatchState

- (void)changeStateTo:(MatchStateType)state {
    if (state != _state) {
        _state = state;
        [_delegate stateChangedTo:state];
    }
}

- (BOOL)isState:(MatchStateType)state {
    return _state == state;
}

- (MatchStateType)state {
    return _state;
}

@end
