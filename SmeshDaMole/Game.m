//
//  Game.m
//  SmeshDaMole
//
//  Created by Khalil Ciret on 20/10/2015.
//  Copyright © 2015 Kay-prod. All rights reserved.
//

#import "Game.h"

@implementation Game

- (id) init {
    
    self = [super init];
    if (self)
    {
        self.score=0;
    }
    return self;
}

-(void) refreshScore:(BOOL)moleTouched
{
    if (moleTouched)
        self.score+=2;
    else
        self.score--;
}

@end
