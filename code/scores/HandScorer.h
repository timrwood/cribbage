//
//  HandScorer.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Hand.h"


typedef struct {
    int fifteens;
    int flush;
    int runs;
    int pairs;
    int nobs;
} HandScore;


@interface HandScorer : NSObject


#pragma mark -
#pragma mark score hand


- (HandScore)scoreHand:(Hand *)hand withFlipCard:(Card *)card;
- (HandScore)scoreHandWithA:(Card *)a andB:(Card *)b andC:(Card *)c andD:(Card *)d andE:(Card *)e;


#pragma mark -
#pragma mark fifteens


- (int)scoreFifteensWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e;


#pragma mark -
#pragma mark flushes


- (int)scoreFlushWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e;


#pragma mark -
#pragma mark pairs


- (int)scorePairsWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e;


#pragma mark -
#pragma mark runs


- (int)scoreRunsWithA:(int)a andB:(int)b andC:(int)c andD:(int)d andE:(int)e;


#pragma mark -
#pragma mark nobs


- (int)scoreNobsWithA:(Card *)a andB:(Card *)b andC:(Card *)c andD:(Card *)d andE:(Card *)e;

@end
