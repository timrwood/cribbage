//
//  Hand.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "CardHolder.h"

@interface Hand : NSObject <CardHolder> {
@private;
    NSMutableArray *_cards;
}

@end
