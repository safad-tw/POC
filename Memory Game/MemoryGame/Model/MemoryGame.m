//
//  MemoryGame.m
//  MemoryGame
//
//  Created by safadmoh on 21/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import "MemoryGame.h"
#import "Player.h"
#import "MemoryGameBoard.h"
#import "MemoryGameBoardCell.h"
#import "MemoryGameConstants.h"

@interface MemoryGame()
{
    NSMutableArray *memoryGameBoardCellImages;
}
@end

@implementation MemoryGame
#pragma mark-init method.
-(id)init
{
    self=[super init];
    if(self)
    {
        self.player=[[Player alloc]init];
        self.memoryGameBoard=[[MemoryGameBoard alloc]init];
        
    }
    memoryGameBoardCellImages = [[NSMutableArray alloc] initWithObjects:@"cat.jpg",@"dog.jpg",@"giraffe.jpg",@"horse.jpg",@"lion.jpg",@"reptile.jpg",@"snake.jpg",@"tiger.jpg",nil];
    [self generateMemoryGameBoardCells];
    return self;
}



#pragma mark - Returns image name for particular cell number.
-(NSString *)imageForCellNumber:(NSUInteger)cellNumber
{
    NSLog(@"%@",[[[self.memoryGameBoard memoryGameBoardCells] objectAtIndex:cellNumber] cellImageName]);
    return [[[self.memoryGameBoard memoryGameBoardCells] objectAtIndex:cellNumber] cellImageName];
    
}

#pragma mark- Used to generate
-(void) generateMemoryGameBoardCells
{
    NSUInteger randomNumberCount=0;
    
    while(randomNumberCount < (NUMBER_OF_MEMORY_GAME_CELLS/2))
    {
        NSUInteger imageNumber = randomNumberCount;
        randomNumberCount++;
        
        //Generate first random cell number.
        NSUInteger firstCellNumber=arc4random() % (NUMBER_OF_MEMORY_GAME_CELLS);
        while(![[self.memoryGameBoard.memoryGameBoardCells objectAtIndex:firstCellNumber] isKindOfClass:[NSNull class]])
        {
            firstCellNumber  = arc4random() % (NUMBER_OF_MEMORY_GAME_CELLS);
        }
        
        MemoryGameBoardCell *firstCell=[[MemoryGameBoardCell alloc]init];
        firstCell.cellNumber=firstCellNumber;
        firstCell.isCellOpen=FALSE;
        firstCell.cellImageName = [memoryGameBoardCellImages objectAtIndex:imageNumber];
        [self.memoryGameBoard.memoryGameBoardCells replaceObjectAtIndex:firstCellNumber withObject:firstCell];
        
        //Generate second random cell number.
        NSUInteger secondCellNumber=arc4random() % (NUMBER_OF_MEMORY_GAME_CELLS);
        while(![[self.memoryGameBoard.memoryGameBoardCells objectAtIndex:secondCellNumber] isKindOfClass:[NSNull class]])
        {
            secondCellNumber = arc4random() % NUMBER_OF_MEMORY_GAME_CELLS;
        }
        MemoryGameBoardCell *secondCell=[[MemoryGameBoardCell alloc]init];
        secondCell.cellNumber=secondCellNumber;
        secondCell.isCellOpen=FALSE;
        secondCell.cellImageName=firstCell.cellImageName;

        
        [self.memoryGameBoard.memoryGameBoardCells replaceObjectAtIndex:secondCellNumber withObject:secondCell];
        
    }
    NSLog(@"done");
}

#pragma mark -Method to compare two cell images

-(BOOL)compareCellImage:(NSUInteger)firstCellNumber with:(NSUInteger)secondCellNumber
{
    if([[[[self.memoryGameBoard memoryGameBoardCells] objectAtIndex:firstCellNumber] cellImageName] isEqualToString:[[[self.memoryGameBoard memoryGameBoardCells] objectAtIndex:secondCellNumber] cellImageName] ])
    {
        self.player.numberOfBoardCellhitsSuccess++;
        return TRUE;
        
    }
    else
        return FALSE;
    
}

#pragma mark -Update player hits.

-(void)updatePlayerHits
{
    self.player.numberOfBoardCellHits++;
}


#pragma mark - Method to check cell is open or not.
-(BOOL) checkIsBoardCellOpen:(NSUInteger)cellNumber
{
    if([[self.memoryGameBoard.memoryGameBoardCells objectAtIndex:cellNumber] isCellOpen])
        return TRUE;
    else
        return FALSE;
}

#pragma mark - Set cell state to open
-(void) setBoardCellOpen:(NSUInteger)cellNumber
{
    [[self.memoryGameBoard.memoryGameBoardCells objectAtIndex:cellNumber] setIsCellOpen:TRUE];
 }

#pragma mark - Returns player hits.
-(NSUInteger)playerBoardCellHits
{
    return self.player.numberOfBoardCellHits;
}



#pragma mark- check whether game is over or not.
-(BOOL)isGameOver
{
   if(self.player.numberOfBoardCellhitsSuccess==(NUMBER_OF_MEMORY_GAME_CELLS/2))
       return TRUE;
    else
        return FALSE;
}

@end
