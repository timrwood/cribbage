//
//  Card.m
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)init {
    return [self initWithIndex:0];
}

- (id)initWithIndex:(int)index {
    self = [super init];
    if (self) {
        _index = index;
    }
    return self;
}

- (int)rank {
    return (_index % 13) + 1;
}

- (int)suit {
    return _index / 13;
}

- (int)rank10 {
    return MIN([self rank], 10);
}

@end
