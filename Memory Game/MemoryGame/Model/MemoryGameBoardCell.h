//
//  MemoryGameBoardCell.h
//  MemoryGame
//
//  Created by safadmoh on 21/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemoryGameBoardCell : NSObject

//Properties.
@property (nonatomic) NSUInteger cellNumber;
@property (nonatomic,strong) NSString *cellImageName;
@property (nonatomic)BOOL isCellOpen;


@end
