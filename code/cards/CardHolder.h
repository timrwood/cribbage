//
//  CardHolder.h
//  cribbage
//
//  Created by Tim Wood on 3/23/13.
//  Copyright (c) 2013 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@protocol CardHolder <NSObject>

- (void)receiveCard:(Card *)card;
- (void)giveCard:(Card *)card toHolder:(NSObject <CardHolder> *)holder;

@end
