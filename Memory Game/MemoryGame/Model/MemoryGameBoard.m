//
//  MemoryGameBoard.m
//  MemoryGame
//
//  Created by safadmoh on 21/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import "MemoryGameBoard.h"
#import "MemoryGameBoardCell.h"
#import "MemoryGameConstants.h"



@interface MemoryGameBoard()

@end


@implementation MemoryGameBoard


-(id)init
{
    self=[super init];
    if(self)
    {
        self.memoryGameBoardCells = [[NSMutableArray alloc] initWithCapacity:NUMBER_OF_MEMORY_GAME_CELLS ];
        for(NSUInteger i=0;i<NUMBER_OF_MEMORY_GAME_CELLS;i++)
        {
            [self.memoryGameBoardCells addObject:[[NSNull alloc]init]];
        }
        
    }
    return self;
}




@end
