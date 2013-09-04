//
//  ViewController.m
//  MemoryGame
//
//  Created by safadmoh on 21/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import "ViewController.h"
#import "BoardCell.h"
#import "MemoryGameConstants.h"
#import "MemoryGame.h"

@interface ViewController ()
{
    BOOL isReloaded;
    MemoryGame *memoryGame; //Game Instance
    NSIndexPath *firstCellIndexPath;//Used to store cell number.
    NSIndexPath *secondCellIndexPath;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Initialize
    isReloaded=NO;
    firstCellIndexPath=nil;
    secondCellIndexPath=nil;
    
    //Instance variables
    memoryGame=[[MemoryGame alloc]init];
    
    //Collection view
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)[[self memoryGameBoard] collectionViewLayout];
    self.memoryGameBoard.contentInset=UIEdgeInsetsMake(1, 0, 0, 0);
    [flowLayout setMinimumLineSpacing:5.0];
    [flowLayout setMinimumInteritemSpacing:5.0];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    double delayInSeconds = 5.0;
    self.memoryGameBoard.userInteractionEnabled=NO;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                   {
                       //code to be executed on the main queue after delay
                       [self reloadGameBoard];
                   });
}





#pragma mark -- UICollection view data source methods.

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return NUMBER_OF_MEMORY_GAME_CELLS;
}


- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"memoryGameCollectionViewCell";
    BoardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if(isReloaded==YES)
    {
        [UIView transitionWithView:cell.boardCellImageView duration:2
                           options:UIViewAnimationOptionTransitionFlipFromTop animations:
         ^{
             cell.boardCellImageView.image=[UIImage imageNamed:@"yellow.jpg"];
         } completion:^(BOOL finished)
         {
         }
         ];
    }
    else
    {
        cell.boardCellImageView.image=[UIImage imageNamed:[memoryGame imageForCellNumber:indexPath.row]];
        
    }
    
    return cell;
}



#pragma mark -UICollection view delegate method.
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [memoryGame updatePlayerHits];
    
    if(![memoryGame checkIsBoardCellOpen:indexPath.row])
    {
        self.clickCountLabel.text=[NSString stringWithFormat:@"%d",[memoryGame playerBoardCellHits]];
        BoardCell *cell=(BoardCell *)[self.memoryGameBoard cellForItemAtIndexPath:indexPath];
        
        [UIView transitionWithView:cell.boardCellImageView duration:2
                           options:UIViewAnimationOptionTransitionFlipFromTop animations:
         ^{
             cell.boardCellImageView.image = [UIImage imageNamed:[memoryGame imageForCellNumber:indexPath.item]];
         } completion:^(BOOL finished)
         {
         }
         ];
        
        
        if(firstCellIndexPath==nil)
        {
            firstCellIndexPath=indexPath;
        }
        else
        {
            secondCellIndexPath=indexPath;
            if([memoryGame compareCellImage:firstCellIndexPath.item with:secondCellIndexPath.item])
            {
                
                [memoryGame setBoardCellOpen:firstCellIndexPath.item];
                [memoryGame setBoardCellOpen:secondCellIndexPath.item];
                firstCellIndexPath=nil;
                secondCellIndexPath=nil;
                if([memoryGame isGameOver])
                    self.gameResultLabel.text=@"Game Over !!!! ";
                
            }
            else
            {
                double delayInSeconds = 3.0;
                self.memoryGameBoard.userInteractionEnabled=NO;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    //code to be executed on the main queue after delay
                    [self reloadSelectedCells];
                });
                
            }
        }
        
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70,70);
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(13,5,5,5);
}




#pragma mark- Method to reload cells to set image to yellow.
-(void)reloadSelectedCells
{
    
    BoardCell *firstCell=(BoardCell *)[self.memoryGameBoard cellForItemAtIndexPath:firstCellIndexPath];
    
    BoardCell *secondCell=(BoardCell *)[self.memoryGameBoard cellForItemAtIndexPath:secondCellIndexPath];
    [secondCell.boardCellImageView setImage:[UIImage imageNamed:@"yellow.jpg"]];
    firstCellIndexPath=nil;
    secondCellIndexPath=nil;
    [UIView transitionWithView:firstCell.boardCellImageView duration:1
                       options:UIViewAnimationOptionTransitionFlipFromTop animations:
     ^{
         
         [firstCell.boardCellImageView setImage:[UIImage imageNamed:@"yellow.jpg"]];
         
     } completion:^(BOOL finished){
         firstCellIndexPath=nil;
     }];
    [UIView transitionWithView:secondCell.boardCellImageView duration:1
                       options:UIViewAnimationOptionTransitionFlipFromTop animations:
     ^{
         
         [secondCell.boardCellImageView setImage:[UIImage imageNamed:@"yellow.jpg"]];
         
     } completion:^(BOOL finished){
         secondCellIndexPath=nil;
         self.memoryGameBoard.userInteractionEnabled=YES;
     }];
    
    
    
}


#pragma mark- Metod to reload game board.

-(void)reloadGameBoard
{
    isReloaded=YES;
    self.memoryGameBoard.userInteractionEnabled=YES;
    [self.memoryGameBoard reloadData];
}


@end
