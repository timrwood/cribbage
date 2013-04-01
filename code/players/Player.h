//
//  Player.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Scoreboard.h"
#import "CardHolder.h"
#import "Hand.h"


@class Banter;


@interface Player : NSObject <CardHolder> {
@private;
    BOOL _gaveCardsToCrib;
@protected;
    Hand *_hand;
    
    Card *_cardForCrib0;
    Card *_cardForCrib1;
    
    Card *_cardForBanter;
    BOOL _didPassBanter;
}


@property (nonatomic) int playerId; // 0 or 1
@property (nonatomic) Scoreboard *scoreboard;


#pragma mark -
#pragma mark hands


- (Hand *)hand;


#pragma mark -
#pragma mark crib


- (void)startDiscardToCrib;
- (BOOL)gaveCardsToCrib:(Hand *)crib;


#pragma mark -
#pragma mark banter


- (void)resetBanter;
- (BOOL)canPlayBanter:(Banter *)banter;
- (BOOL)didPlayBanter:(Banter *)banter;
- (BOOL)didPassBanter;


@end
