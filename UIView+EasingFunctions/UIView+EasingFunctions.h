//
//  UIView+EasingFunctions.h
//  Easing
//
//  Created by Zoreslav Khimich on 30/04/2013.
//  Copyright (c) 2013 Zoreslav Khimich. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef CGFloat (*ViewEasingFunctionPointerType)(CGFloat);

@interface UIView (Easing)

- (void)setEasingFunction:(ViewEasingFunctionPointerType)function forKeyPath:(NSString *)keyPath;

- (void)removeEasingFunctionForKeyPath:(NSString *)keyPath;

@end
