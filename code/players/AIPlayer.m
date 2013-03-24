//
//  AIPlayer.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "AIPlayer.h"

@implementation AIPlayer


#pragma mark -
#pragma mark crib


- (void)startDiscardToCrib {
    [self performSelector:@selector(actuallyDiscardToCrib:)
               withObject:[_hand cardAtIndex:0]
               afterDelay:0.5];
    [self performSelector:@selector(actuallyDiscardToCrib:)
               withObject:[_hand cardAtIndex:3]
               afterDelay:0.25];
}

- (void)actuallyDiscardToCrib:(Card *)card {
    if (_cardForCrib0) {
        _cardForCrib1 = card;
    } else {
        _cardForCrib0 = card;
    }
}


@end
