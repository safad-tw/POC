//
//  Player.m
//  MemoryGame
//
//  Created by safadmoh on 21/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import "Player.h"

@implementation Player

#pragma mark -Init method.
-(id)init
{
    self=[super init];
    if(self)
    {
        self.numberOfBoardCellHits=0;
        self.numberOfBoardCellhitsSuccess=0;
        
    }
    return self;
}


@end
