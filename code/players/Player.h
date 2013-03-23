//
//  Player.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scoreboard.h"

@interface Player : NSObject {

}

@property (nonatomic) int playerId; // 0 or 1
@property (nonatomic) Scoreboard *scoreboard;

@end
