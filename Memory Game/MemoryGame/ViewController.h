//
//  ViewController.h
//  MemoryGame
//
//  Created by safadmoh on 21/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource ,UICollectionViewDelegate>

//Outlets 
@property (weak, nonatomic) IBOutlet UICollectionView *memoryGameBoard;
@property (weak, nonatomic) IBOutlet UILabel *clickCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameResultLabel;

@end
