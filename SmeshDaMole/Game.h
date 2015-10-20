//
//  Game.h
//  SmeshDaMole
//
//  Created by Khalil Ciret on 20/10/2015.
//  Copyright © 2015 Kay-prod. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic) int score;

- (id) init;
- (void) refreshScore: (BOOL)moleTouched;



@end
