//
//  AIPlayer.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "AIPlayer.h"

@implementation AIPlayer


- (id)init {
    self = [super init];
    if (self) {
        known = malloc(sizeof(int) * 6);
        unknown = malloc(sizeof(int) * 46);
        
        helperA = [[Card alloc] init];
        helperB = [[Card alloc] init];
        helperC = [[Card alloc] init];
        helperD = [[Card alloc] init];
        helperE = [[Card alloc] init];
    }
    return self;
}


#pragma mark -
#pragma mark crib


- (void)startDiscardToCrib {
    [self performSelector:@selector(actuallyDiscardToCrib:)
               withObject:[_hand cardAtIndex:0]
               afterDelay:0.5];
    [self performSelector:@selector(actuallyDiscardToCrib:)
               withObject:[_hand cardAtIndex:3]
               afterDelay:0.25];
    [self updateKnown];
    [self discardBestCardsForCrib];
}

- (void)updateKnown {
    for (int k = 0; k < 6; k++) {
        known[k] = [[_hand cardAtIndex:k] index];
    }
    
    for (int i = 0, j = 0; i < 52; j++) {
        BOOL isKnown = NO;
        for (int k = 0; k < 6; k++) {
            if (i == known[k]) {
                isKnown = YES;
            }
        }
        if (!isKnown) {
            unknown[j] = i;
            j++;
        }
    }
}

- (void)discardBestCardsForCrib {
    int bestScore = -1000;
    int bestKept[4];
    int bestDiscarded[2];
    
    for (int a = 0; a < 6; a++) {
        for (int b = a + 1; b < 6; b++) {
            int kept[4];
            int discarded[2] = {a, b};
            
            for (int i = 0, j = 0; i < 6; i++) {
                if (i != a && i != b) {
                    kept[j] = i;
                    j++;
                }
            }
            
            int score = [self scoreForHandWithKept:kept andDiscarded:discarded];
            if (score > bestScore) {
                bestScore = score;
                for (int i = 0; i < 4; i++) {
                    bestKept[i] = kept[i];
                }
                for (int i = 0; i < 2; i++) {
                    bestDiscarded[i] = discarded[i];
                }
            }
        }
    }
}

- (int)scoreForHandWithKept:(int *)kept andDiscarded:(int *)discarded {
    return 0;
}

- (void)actuallyDiscardToCrib:(Card *)card {
    if (_cardForCrib0) {
        _cardForCrib1 = card;
    } else {
        _cardForCrib0 = card;
    }
}


@end
