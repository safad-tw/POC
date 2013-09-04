//
//  Bag.h
//  BallProblem
//
//  Created by safadmoh on 06/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    eYellowBalls,
    eRedBalls
}E_TypeOfThirdBallChoosen;


@interface Bag : NSObject

//Instance variables.
@property(nonatomic) NSUInteger blueBalls;//Used to store blue balls count.
@property(nonatomic) NSUInteger greenBalls;//Used to store green balls count.
@property(nonatomic) NSUInteger yellowOrRedBalls;//Used to store either yellow or red balls count.
@property(nonatomic) E_TypeOfThirdBallChoosen typeOfThirdBall;

//Mehods to set balls.
- (BOOL) setBlueBall:(NSUInteger)blueBalls;
- (BOOL) setYellowOrRedBall:(NSUInteger)thirdBall;
- (BOOL) setGreenBall:(NSUInteger)greenBall;

//Method to get bag summary
- (void) getBagSummary;


@end
