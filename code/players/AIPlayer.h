//
//  AIPlayer.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//


#import "Player.h"


@interface AIPlayer : Player {
@private;
    int *known;
    int *unknown;
    
    Card *helperA;
    Card *helperB;
    Card *helperC;
    Card *helperD;
    Card *helperE;
}

@end
