//
//  MemoryGame.h
//  MemoryGame
//
//  Created by safadmoh on 21/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;
@class MemoryGameBoard;

@interface MemoryGame : NSObject

//Instance variables.
@property(nonatomic,strong) Player *player;
@property(nonatomic,strong) MemoryGameBoard *memoryGameBoard;


//Instance methods.
- (NSString *) imageForCellNumber:(NSUInteger)cellNumber;
- (BOOL) compareCellImage:(NSUInteger)firstCellNumber with:(NSUInteger)secondCellNumber;
- (void) updatePlayerHits;
- (NSUInteger) playerBoardCellHits;
- (BOOL)isGameOver;
- (BOOL) checkIsBoardCellOpen:(NSUInteger)cellNumber;
- (void) setBoardCellOpen:(NSUInteger)cellNumber;


@end
