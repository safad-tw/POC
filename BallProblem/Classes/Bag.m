//
//  Bag.m
//  BallProblem
//
//  Created by safadmoh on 06/08/13.
//  Copyright (c) 2013 safadmoh. All rights reserved.
//

#import "Bag.h"

#define TOTALNUMBEROFBALLS 12

@implementation Bag

#pragma mark -Setter methods.


-(BOOL)setBlueBall:(NSUInteger)blueBalls
{
    if(blueBalls>(TOTALNUMBEROFBALLS-(self.blueBalls+self.yellowOrRedBalls)))
    {
        NSLog(@"Blue balls should be less than or equal to %ld",(TOTALNUMBEROFBALLS-(self.blueBalls+self.yellowOrRedBalls)));
        return FALSE;
    }
    else
    {
        self.blueBalls=blueBalls;
        return TRUE;
    }
}


-(BOOL)setGreenBall:(NSUInteger)greenBall
{
 if(greenBall>3)
 {
     NSLog(@"Green ball should be less less than or equal to 3");
     return  FALSE;
 }
 else
 {
     self.greenBalls=greenBall;
     return TRUE;
 }
}



-(BOOL)setYellowOrRedBall:(NSUInteger)thirdBall
{
    if(self.typeOfThirdBall==eYellowBalls)
    {
        if(thirdBall<(TOTALNUMBEROFBALLS*0.4))
        {
            self.yellowOrRedBalls=thirdBall;
            return TRUE;
        }
        else
        {
            NSLog(@"Yellow ball should be less than or equal to %lf",TOTALNUMBEROFBALLS*0.4);
            return FALSE;
        }
    }
    else
    {
        if(thirdBall<(2*self.greenBalls))
        {
            self.yellowOrRedBalls=thirdBall;
            return TRUE;
        }
        else
        {
            NSLog(@"Red ball should be less than or equal to %ld",2*self.greenBalls);
            return FALSE;
        }
    }
}


#pragma mark- Mehod to display bag summary.
-(void)getBagSummary
{
    NSLog(@"Bag Contains :\n Blue ball:%ld \n Green ball:%ld",self.blueBalls,self.greenBalls);
    if(self.typeOfThirdBall==eYellowBalls)
        NSLog(@"\n Yellow ball %ld",self.yellowOrRedBalls);
    else
        NSLog(@"\n Red ball %ld",self.yellowOrRedBalls);
    
}

@end
