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
    NSLog(@"start");
    [_matchState changeStateTo:STATE_DEAL];
}

- (void)update {
    [self updateState];
}


#pragma mark -
#pragma mark game not started


- (void)startGameNotStarted {
    NSLog(@"startGameNotStarted");
    
}

- (void)updateGameNotStarted {
    NSLog(@"updateGameNotStarted");
    [_matchState changeStateTo:STATE_DEAL];
}


#pragma mark -
#pragma mark deal


- (void)startDeal {
    NSLog(@"startDeal");
    [_deck shuffle];
    [_deck deal:6 toHolder:_player0];
    [_deck deal:6 toHolder:_player1];
}

- (void)updateDeal {
    NSLog(@"updateDeal");
    [_matchState changeStateTo:STATE_DISCARD];
}


#pragma mark -
#pragma mark discard to crib


- (void)startDiscard {
    NSLog(@"startDiscard");
    [_player0 startDiscardToCrib];
    [_player1 startDiscardToCrib];
    
}

- (void)updateDiscard {
//    NSLog(@"updateDiscard");
    if ([_player0 gaveCardsToCrib:_crib] && [_player1 gaveCardsToCrib:_crib]) {
        [_matchState changeStateTo:STATE_BANTER];
    }
}


#pragma mark -
#pragma mark banter


- (void)startBanter {
    NSLog(@"startBanter");
    
}

- (void)updateBanter {
    NSLog(@"updateBanter");
    
}


#pragma mark -
#pragma mark restore hands


- (void)startRestoreHands {
    NSLog(@"startRestoreHands");
    
}

- (void)updateRestoreHands {
    NSLog(@"updateRestoreHands");
    
}


#pragma mark -
#pragma mark score pone


- (void)startScorePone {
    NSLog(@"startScorePone");
    
}

- (void)updateScorePone {
    NSLog(@"updateScorePone");
    
}


#pragma mark -
#pragma mark score dealer


- (void)startScoreDealer {
    NSLog(@"startScoreDealer");
    
}

- (void)updateScoreDealer {
    NSLog(@"updateScoreDealer");
    
}


#pragma mark -
#pragma mark score crib


- (void)startScoreCrib {
    NSLog(@"startScoreCrib");
    
}

- (void)updateScoreCrib {
    NSLog(@"updateScoreCrib");
    
}


#pragma mark -
#pragma mark discard to crib


- (void)startRestoreDeck {
    NSLog(@"startRestoreDeck");
    
}

- (void)updateRestoreDeck {
    NSLog(@"updateRestoreDeck");
    
}


#pragma mark -
#pragma mark discard to crib


- (void)startShuffle {
    NSLog(@"startShuffle");
    
}

- (void)updateShuffle {
    NSLog(@"updateShuffle");
    
}


#pragma mark -
#pragma mark game not started


- (void)startGameEnded {
    NSLog(@"startGameEnded");
    
}

- (void)updateGameEnded {
    NSLog(@"updateGameEnded");
    
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
