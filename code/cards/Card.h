//
//  Card.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject {
@private;
    int _index;
}

- (id)initWithIndex:(int)index;

- (int)rank;
- (int)suit;
- (int)rank10;

@end
