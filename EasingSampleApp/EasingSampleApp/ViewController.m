//
//  ViewController.m
//  EasingSampleApp
//
//  Created by Zoreslav Khimich on 02/05/2013.
//  Copyright (c) 2013 Zoreslav Khimich. All rights reserved.
//

#import "ViewController.h"

#import <UIView+EasingFunctions.h>
#import <easing.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    
    CGPoint destinationCenter = self.actionButton.center;
    
    // Starting from above the screen
    self.actionButton.center = CGPointMake(destinationCenter.x, -66.);
    
    [UIView animateWithDuration:.7 animations:^{
        
        // Set a custom easing function
        [self.actionButton setEasingFunction:BounceEaseOut forKeyPath:@"center"];
        
        // Make the button fall down
        self.actionButton.center = destinationCenter;
        
    } completion:^(BOOL finished) {
        
        // Restore the default easing function
        [self.actionButton removeEasingFunctionForKeyPath:@"center"];
        
    }];

    
}

- (IBAction)actionTime:(id)sender {
    
    [self.view insertSubview:self.dialogView belowSubview:self.actionButton];
    
    // Prepare for the animation (inital position & transform)
    self.dialogView.center = CGPointMake(0., CGRectGetMidY(self.view.bounds));
    self.dialogView.transform = CGAffineTransformMakeScale(1., 1.);
    
    // Animate!
    [UIView animateWithDuration:.6 animations:^{
        
        [self.dialogView setEasingFunction:ElasticEaseOut forKeyPath:@"center"];
        [self.dialogView setEasingFunction:ElasticEaseOut forKeyPath:@"transform"];
        
        self.dialogView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.dialogView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [self.dialogView removeEasingFunctionForKeyPath:@"center"];
        [self.dialogView removeEasingFunctionForKeyPath:@"transform"];
        
    }];
    
}

- (IBAction)dismissDialog:(id)sender {
    
    [UIView animateWithDuration:.5 animations:^{

        [self.dialogView setEasingFunction:BackEaseIn forKeyPath:@"center"];
        [self.dialogView setEasingFunction:QuinticEaseOut forKeyPath:@"transform"];
        
        // Move the view down
        self.dialogView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)+CGRectGetHeight(self.dialogView.bounds));

        // ...and rotate it along the way
        CGAffineTransform t = CGAffineTransformMakeRotation(M_PI * .3);
        t = CGAffineTransformScale(t, .75, .75);
        
        self.dialogView.transform = t;
        
    } completion:^(BOOL finished) {
        
        [self.dialogView removeEasingFunctionForKeyPath:@"center"];
        [self.dialogView removeEasingFunctionForKeyPath:@"transform"];
        
        [self.dialogView removeFromSuperview];
        
    }];
    
}

@end
