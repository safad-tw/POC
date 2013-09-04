//
//  main.m
//  BallProblem
//
//  Created by safadmoh on 06/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bag.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool
    {
        Bag *bag=[[Bag alloc]init];
        BOOL status;
        NSUInteger blueBalls,greenBalls,thirdBalls,keyInput;
        NSLog(@" Welcome to ball problem");
        
        //Enter green balls.
        do
        {
            NSLog(@"Enter number of green balls");
            scanf("%ld",&greenBalls);
            status=[bag setGreenBall:greenBalls];
        } while (!status);
        
        
        
        //Enter Yellow or Red balls
        do
        {
            NSLog(@"Enter type of third ball:Yellow(Press 0)/Red (Press 1)");
            scanf("%ld",&keyInput);
            if(!keyInput)
                bag.typeOfThirdBall=eYellowBalls;
            else
                bag.typeOfThirdBall=eRedBalls;
            if(bag.typeOfThirdBall==eYellowBalls)
            {
                NSLog(@"Enter number of yellow balls");
                scanf("%ld",&thirdBalls);
                status=[bag setYellowOrRedBall:thirdBalls];
            }
            else
            {
                NSLog(@"Enter number of Red balls");
                scanf("%ld",&thirdBalls);
                status=[bag setYellowOrRedBall:thirdBalls];
                
            }
            
        } while (!status);
        
        //Enter blue balls
        do
        {
            NSLog(@"Enter nuber of Blue balls");
            scanf("%ld",&blueBalls);
            status=[bag setBlueBall:blueBalls];
        } while (!status);
        
        [bag getBagSummary];
        
    }
    return 0;
}

