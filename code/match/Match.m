//
//  Match.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "Match.h"

@implementation Match

- (id)init {
    self = [super init];
    if (self) {
        _deck = [[Deck alloc] init];
        _crib = [[Hand alloc] init];
        _street = [[Street alloc] init];
        
        _matchState = [[MatchState alloc] init];
        _handScorer = [[HandScorer alloc] init];
        
        _scoreboard = [[Scoreboard alloc] init];
        
        [self setPlayer0:[[AIPlayer alloc] init]];
        [self setPlayer1:[[AIPlayer alloc] init]];
    }
    return self;
}

- (void)setPlayer0:(Player *)player {
    _player0 = player;
    [player setPlayerId:0];
    [player setScoreboard:_scoreboard];
}

- (void)setPlayer1:(Player *)player {
    _player1 = player;
    [player setPlayerId:1];
    [player setScoreboard:_scoreboard];
}

- (void)start {
    
}

- (void)update {
    
}

@end
