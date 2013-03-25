//
//  Banter.h
//  cribbage
//
//  Created by Tim Wood on 3/24/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface Banter : NSObject {
@private;
    Player *_activePlayer;
    Player *_otherPlayer;
    Player *_lastToPlay;
}


@property (nonatomic) Player *player0;
@property (nonatomic) Player *player1;


#pragma mark -
#pragma mark start


- (void)start;


#pragma mark -
#pragma mark update


- (void)update;
- (BOOL)isFinished;


@end
