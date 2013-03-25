//
//  Match.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Player.h"
#import "AIPlayer.h"
#import "MatchState.h"
#import "Scoreboard.h"
#import "HandScorer.h"
#import "Hand.h"
#import "Street.h"
#import "Banter.h"

@interface Match : NSObject <MatchStateDelegate> {
@private;
    Deck *_deck;
    Hand *_crib;
    Street *_street;
    
    MatchState *_matchState;
    
    Scoreboard *_scoreboard;
    
    Banter *_banter;
}

@property (nonatomic) Player *player0;
@property (nonatomic) Player *player1;

- (void)start;
- (void)update;

@end
