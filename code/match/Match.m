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
        
        _handScorer = [[HandScorer alloc] init];
        _scoreboard = [[Scoreboard alloc] init];
        
        _matchState = [[MatchState alloc] init];
        [_matchState setDelegate:self];
        
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
    [_matchState changeStateTo:STATE_DEAL];
}

- (void)update {
    [self updateState];
}


#pragma mark -
#pragma mark game not started


- (void)startGameNotStarted {
    
}

- (void)updateGameNotStarted {
    
}


#pragma mark -
#pragma mark deal


- (void)startDeal {
    
}

- (void)updateDeal {
    
}


#pragma mark -
#pragma mark discard to crib


- (void)startDiscard {
    
}

- (void)updateDiscard {
    
}


#pragma mark -
#pragma mark banter


- (void)startBanter {
    
}

- (void)updateBanter {
    
}


#pragma mark -
#pragma mark restore hands


- (void)startRestoreHands {
    
}

- (void)updateRestoreHands {
    
}


#pragma mark -
#pragma mark score pone


- (void)startScorePone {
    
}

- (void)updateScorePone {
    
}


#pragma mark -
#pragma mark score dealer


- (void)startScoreDealer {
    
}

- (void)updateScoreDealer {
    
}


#pragma mark -
#pragma mark score crib


- (void)startScoreCrib {
    
}

- (void)updateScoreCrib {
    
}


#pragma mark -
#pragma mark discard to crib


- (void)startRestoreDeck {
    
}

- (void)updateRestoreDeck {
    
}


#pragma mark -
#pragma mark discard to crib


- (void)startShuffle {
    
}

- (void)updateShuffle {
    
}


#pragma mark -
#pragma mark game not started


- (void)startGameEnded {
    
}

- (void)updateGameEnded {
    
}


#pragma mark -
#pragma mark state


- (void)stateChangedTo:(MatchStateType)state {
    switch (state) {
        case STATE_GAME_NOT_STARTED:
            [self startGameNotStarted];
            break;
        case STATE_DEAL:
            [self startDeal];
            break;
        case STATE_DISCARD:
            [self startDiscard];
            break;
        case STATE_BANTER:
            [self startBanter];
            break;
        case STATE_RESTORE_HANDS:
            [self startRestoreHands];
            break;
        case STATE_SCORE_PONE:
            [self startScorePone];
            break;
        case STATE_SCORE_DEALER:
            [self startScoreDealer];
            break;
        case STATE_SCORE_CRIB:
            [self startScoreCrib];
            break;
        case STATE_RESTORE_DECK:
            [self startRestoreDeck];
            break;
        case STATE_SHUFFLE:
            [self startShuffle];
            break;
        case STATE_GAME_ENDED:
            [self startGameEnded];
            break;
    }
}

- (void)updateState {
    switch ([_matchState state]) {
        case STATE_GAME_NOT_STARTED:
            [self updateGameNotStarted];
            break;
        case STATE_DEAL:
            [self updateDeal];
            break;
        case STATE_DISCARD:
            [self updateDiscard];
            break;
        case STATE_BANTER:
            [self updateBanter];
            break;
        case STATE_RESTORE_HANDS:
            [self updateRestoreHands];
            break;
        case STATE_SCORE_PONE:
            [self updateScorePone];
            break;
        case STATE_SCORE_DEALER:
            [self updateScoreDealer];
            break;
        case STATE_SCORE_CRIB:
            [self updateScoreCrib];
            break;
        case STATE_RESTORE_DECK:
            [self updateRestoreDeck];
            break;
        case STATE_SHUFFLE:
            [self updateShuffle];
            break;
        case STATE_GAME_ENDED:
            [self updateGameEnded];
            break;
    }
}


@end
