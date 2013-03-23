//
//  MatchState.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    STATE_GAME_NOT_STARTED,
    STATE_DEAL,
    STATE_DISCARD,
    STATE_BANTER,
    STATE_RESTORE_HANDS,
    STATE_SCORE_PONE,
    STATE_SCORE_DEALER,
    STATE_SCORE_CRIB,
    STATE_RESTORE_DECK,
    STATE_SHUFFLE,
    STATE_GAME_ENDED
} MatchStateType;


@protocol MatchStateDelegate <NSObject>

- (void)stateChangedTo:(MatchStateType)state;

@end


@interface MatchState : NSObject {
@private;
    MatchStateType _state;
}


@property (nonatomic) NSObject <MatchStateDelegate> *delegate;


- (void)changeStateTo:(MatchStateType)state;
- (BOOL)isState:(MatchStateType)state;
- (MatchStateType)state;

@end
