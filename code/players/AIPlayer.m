//
//  AIPlayer.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "AIPlayer.h"
#import "HandScorer.h"

// based on Schell's discard tables
// http://www.cribbageforum.com/SchellDiscard.htm
//
// Each score was multiplied by 46, (the number of unknown cards remaining in the deck).

int dealerCribScores[13][13] = {
    {247, 195, 208, 250, 251, 177, 177, 175, 156, 157, 168, 157, 157},
    {195, 263, 322, 208, 251, 181, 175, 168, 171, 163, 177, 165, 162},
    {208, 322, 273, 226, 275, 175, 165, 180, 174, 164, 179, 165, 169},
    {250, 208, 226, 259, 298, 177, 171, 176, 171, 165, 178, 165, 166},
    {251, 251, 275, 298, 404, 305, 276, 252, 250, 306, 322, 305, 306},
    {177, 181, 175, 177, 305, 265, 229, 213, 236, 146, 157, 149, 144},
    {177, 175, 165, 171, 276, 229, 272, 300, 186, 149, 162, 149, 150},
    {175, 168, 180, 176, 252, 213, 300, 251, 217, 175, 162, 147, 145},
    {156, 171, 174, 171, 250, 236, 186, 217, 237, 197, 183, 138, 141},
    {157, 163, 164, 165, 306, 146, 149, 175, 197, 219, 212, 152, 131},
    {168, 177, 179, 178, 322, 157, 162, 162, 183, 212, 245, 221, 182},
    {157, 165, 165, 165, 305, 149, 149, 147, 138, 152, 221, 220, 159},
    {157, 162, 169, 166, 306, 144, 150, 145, 141, 131, 182, 159, 211}
};

int poneCribScores[13][13] = {
    {277, 233, 233, 263, 276, 226, 225, 223, 209, 206, 215, 199, 198},
    {233, 293, 337, 245, 281, 229, 229, 227, 216, 211, 221, 210, 205},
    {233, 337, 307, 274, 312, 224, 230, 232, 224, 213, 224, 211, 206},
    {263, 245, 274, 300, 334, 246, 224, 227, 215, 208, 223, 205, 201},
    {276, 281, 312, 334, 431, 344, 322, 290, 283, 341, 357, 338, 334},
    {226, 229, 224, 246, 344, 326, 295, 270, 288, 198, 210, 194, 190},
    {225, 229, 230, 224, 322, 295, 328, 351, 242, 198, 215, 199, 196},
    {223, 227, 232, 227, 290, 270, 351, 314, 268, 235, 211, 198, 193},
    {209, 216, 224, 215, 283, 288, 242, 268, 294, 250, 228, 189, 185},
    {206, 211, 213, 208, 341, 198, 198, 235, 250, 280, 259, 212, 178},
    {215, 221, 224, 223, 357, 210, 215, 211, 228, 259, 295, 251, 219},
    {199, 210, 211, 205, 338, 194, 199, 198, 189, 212, 251, 266, 207},
    {198, 205, 206, 201, 334, 190, 196, 193, 185, 178, 219, 207, 260}
};

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
    [self updateKnown];
    [self discardBestCardsForCrib];
}

- (void)updateKnown {
    for (int k = 0; k < 6; k++) {
        known[k] = [[_hand cardAtIndex:k] index];
    }
    
    for (int i = 0, j = 0; i < 52; i++) {
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
    int kept[4];
    int discarded[2];
    int discardedIndexA;
    int discardedIndexB;
    
    for (int a = 0; a < 6; a++) {
        for (int b = a + 1; b < 6; b++) {
            discarded[0] = known[a];
            discarded[1] = known[b];
            
            for (int i = 0, j = 0; i < 6; i++) {
                if (i != a && i != b) {
                    kept[j] = known[i];
                    j++;
                }
            }
            
            int score = [self scoreForHandWithKept:kept andDiscarded:discarded];
            
            if (score > bestScore) {
                bestScore = score;
                discardedIndexA = a;
                discardedIndexB = b;
            }
        }
    }
    
    [self performSelector:@selector(actuallyDiscardToCrib:)
               withObject:[_hand cardAtIndex:discardedIndexA]
               afterDelay:10];
    [self performSelector:@selector(actuallyDiscardToCrib:)
               withObject:[_hand cardAtIndex:discardedIndexB]
               afterDelay:10];
}


- (int)scoreForHandWithKept:(int *)kept andDiscarded:(int *)discarded {
    NSLog(@"kept %i %i %i %i", kept[0], kept[1], kept[2], kept[3]);
    NSLog(@"discarded  %i %i", discarded[0], discarded[1]);
    
    int score = 0;
    
    // crib
    [helperA setIndex:discarded[0]];
    [helperB setIndex:discarded[1]];
    score += dealerCribScores[[helperA rank] - 1][[helperB rank] - 1];
    
    // average hands
    [helperA setIndex:kept[0]];
    [helperB setIndex:kept[1]];
    [helperC setIndex:kept[2]];
    [helperD setIndex:kept[3]];
    
    for (int i = 0; i < 46; i++) {
        [helperE setIndex:unknown[i]];
        HandScore handScore = [[HandScorer singleton] scoreHandWithA:helperA
                                                                andB:helperB
                                                                andC:helperC
                                                                andD:helperD
                                                                andE:helperE];
        score += handScore.fifteens + handScore.flush + handScore.nobs + handScore.pairs + handScore.runs;
    }
    
    return score;
}

- (void)actuallyDiscardToCrib:(Card *)card {
    if (_cardForCrib0) {
        _cardForCrib1 = card;
    } else {
        _cardForCrib0 = card;
    }
}


@end
