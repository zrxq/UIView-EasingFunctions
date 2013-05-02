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
    self.actionButton.center = CGPointMake(destinationCenter.x, -66);
    
    [UIView animateWithDuration:0.7 animations:^{
        
        // Set a custom easing function
        [self.actionButton setEasingFunction:BounceEaseOut forKeyPath:@"position"];
        
        // Make the button fall down
        self.actionButton.center = destinationCenter;
        
    } completion:^(BOOL finished) {
        
        // Restore the default easing function
        [self.actionButton removeEasingFunctionForKeyPath:@"position"];
        
    }];

    
}

- (IBAction)actionTime:(id)sender {
    
    [self.view insertSubview:self.dialogView belowSubview:self.actionButton];
    
    // Prepare for the animation (inital position & transform)
    self.dialogView.center = CGPointMake(0.f, CGRectGetMidY(self.view.bounds));
    self.dialogView.transform = CGAffineTransformMakeScale(1.3f, 1.f);
    
    // Animate!
    [UIView animateWithDuration:0.6f animations:^{
        
        [self.dialogView setEasingFunction:ElasticEaseOut forKeyPath:@"position"];
        [self.dialogView setEasingFunction:ElasticEaseOut forKeyPath:@"transform"];
        
        self.dialogView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.dialogView.alpha = 1.f;
        self.dialogView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [self.dialogView removeEasingFunctionForKeyPath:@"position"];
        [self.dialogView removeEasingFunctionForKeyPath:@"transform"];
        
    }];
    
}

- (IBAction)dismissDialog:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{

        [self.dialogView setEasingFunction:BackEaseIn forKeyPath:@"position"];
        [self.dialogView setEasingFunction:QuinticEaseOut forKeyPath:@"transform"];
        
        // Move the view down
        self.dialogView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame)+CGRectGetHeight(self.dialogView.frame));

        // ...and rotate it along the way
        CGAffineTransform t = CGAffineTransformMakeRotation(M_PI * 0.3);
        t = CGAffineTransformScale(t, 0.75, 0.75);
        
        self.dialogView.transform = t;
        
    } completion:^(BOOL finished) {
        
        [self.dialogView removeEasingFunctionForKeyPath:@"position"];
        [self.dialogView removeEasingFunctionForKeyPath:@"transform"];
        
        [self.dialogView removeFromSuperview];
        
    }];
    
}

@end
