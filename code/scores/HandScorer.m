//
//  HandScorer.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "HandScorer.h"


static HandScorer *_singleton = nil;


@implementation HandScorer


#pragma mark -
#pragma mark singleton


+ (HandScorer *)singleton {
	if (!_singleton) {
        _singleton = [[self alloc] init];
	}
    
	return _singleton;
}


#pragma mark -
#pragma mark score hand


- (HandScore)scoreHand:(Hand *)hand withFlipCard:(Card *)card {
    return [self scoreHandWithA:[hand cardAtIndex:0]
                           andB:[hand cardAtIndex:1]
                           andC:[hand cardAtIndex:2]
                           andD:[hand cardAtIndex:3]
                           andE:card];
}

- (HandScore)scoreHandWithA:(Card *)a andB:(Card *)b andC:(Card *)c andD:(Card *)d andE:(Card *)e {
    HandScore score;
    
    score.fifteens = [self scoreFifteensWithA:[a rank10]
                                         andB:[b rank10]
                                         andC:[c rank10]
                                         andD:[d rank10]
                                         andE:[e rank10]];
    score.flush = [self scoreFlushWithA:[a suit]
                                   andB:[b suit]
                                   andC:[c suit]
                                   andD:[d suit]
                                   andE:[e suit]];
    score.pairs = [self scorePairsWithA:[a rank]
                                   andB:[b rank]
                                   andC:[c rank]
                                   andD:[d rank]
                                   andE:[e rank]];
    score.runs = [self scoreRunsWithA:[a rank]
                                 andB:[b rank]
                                 andC:[c rank]
                                 andD:[d rank]
                                 andE:[e rank]];
    score.nobs = [self scoreNobsWithA:a
                                 andB:b
                                 andC:c
                                 andD:d
                                 andE:e];
    return score;
}


#pragma mark -
#pragma mark fifteens


- (int)scoreFifteensWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e {
    int output = 0;
    
    int ranks[5] = {a, b, c, d, e};
    
    if (a + b + c + d + e == 15) {
        return 2;
    }
    
    for (int i = 0; i < 5; i++) {
        for (int j = i + 1; j < 5; j++) {
            if (ranks[i] + ranks[j] == 15) {
                output += 2;
            }
            for (int k = j + 1; k < 5; k++) {
                if (ranks[i] + ranks[j] + ranks[k] == 15) {
                    output += 2;
                }
                for (int l = k + 1; l < 5; l++) {
                    if (ranks[i] + ranks[j] + ranks[k] + ranks[l] == 15) {
                        output += 2;
                    }
                }
            }
        }
    }
    return output;
}


#pragma mark -
#pragma mark flushes


- (int)scoreFlushWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e {
    if (a == b && b == c && c == d) {
        if (d == e) {
            return 5;
        }
        return 4;
    }
    return 0;
}


#pragma mark -
#pragma mark pairs


- (int)scorePairsWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e {
    int counts[13] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    
    counts[a - 1]++;
    counts[b - 1]++;
    counts[c - 1]++;
    counts[d - 1]++;
    counts[e - 1]++;

    int output = 0;
    for (int i = 0; i < 13; i++) {
        if (counts[i] == 4) {
            return 12;
        } else if (counts[i] == 3) {
            output += 6;
        } else if (counts[i] == 2) {
            output += 2;
        }
    }
    
    return output;
}


#pragma mark -
#pragma mark runs


- (int)scoreRunsWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e {
    int counts[13] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    
    counts[a - 1]++;
    counts[b - 1]++;
    counts[c - 1]++;
    counts[d - 1]++;
    counts[e - 1]++;
    
    int last0 = 0;
    int last1 = 0;
    int last2 = 0;
    int last3 = 0;
    int last4 = 0;
    
    for (int i = 0; i < 13; i++) {
        last4 = last3;
        last3 = last2;
        last2 = last1;
        last1 = last0;
        last0 = counts[i];
        
        if (last0 && last1 && last2 && last3 && last4) {
            return 5;
        } else if (last1 && last2 && last3 && last4) {
            return 4 * last1 * last2 + last3 * last4;
        } else if (last2 && last3 && last4) {
            return 3 * last2 + last3 * last4;
        }
    }
    
    return 0;
}


#pragma mark -
#pragma mark nobs


- (int)scoreNobsWithA:(Card *)a andB:(Card *)b andC:(Card *)c andD:(Card *)d andE:(Card *)e {
    if ([a rank] == 11 && [a suit] == [e suit]) {
        return 1;
    }
    if ([b rank] == 11 && [b suit] == [e suit]) {
        return 1;
    }
    if ([c rank] == 11 && [c suit] == [e suit]) {
        return 1;
    }
    if ([d rank] == 11 && [d suit] == [e suit]) {
        return 1;
    }
    return 0;
}


@end
