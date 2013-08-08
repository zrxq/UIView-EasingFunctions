//
//  UIView+EasingFunctions.h
//  Easing
//
//  Created by Zoreslav Khimich on 30/04/2013.
//  Copyright (c) 2013 Zoreslav Khimich. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef CGFloat (*ViewEasingFunctionPointerType)(CGFloat);

/**
 Allows to assign custom [easing functions](http://easings.net/) to the animatable `UIView` properties.
 
 When a property, to which an easing function is assigned, is animated using [the block-based methods](http://developer.apple.com/library/ios/#documentation/windowsviews/conceptual/viewpg_iphoneos/animatingviews/animatingviews.html), the pacing of the animation is affected (or rather,  defined) by the assigned function.
 
 */
@interface UIView (Easing)

/** 
 Assigns an easing function to an animatable `UIView` property.
 
 The function remains assigned and in effect until removed using `removeEasingFunctionForKeyPath:`.
 
 [AHEasing library](http://github.com/warrenm/AHEasing) provides a handy collection of easing functions that can be used with this method.
 
 @param function Pointer to a function that defines the pacing of an animation by mapping an input time normalized to the range [0,1] to an output time.
 
 @param keyPath The key-path of the property to assign the easing function to.
 
 @see -removeEasingFunctionForKeyPath:
 
 */
- (void)setEasingFunction:(ViewEasingFunctionPointerType)function forKeyPath:(NSString *)keyPath;

/** 
 Disassociates a previously assigned easing function from a `UIView` property.
 
 @param keyPath The key-path of the property to remove a previously assigned easing function from.
 
 @see -setEasingFunction:forKeyPath:

 */
- (void)removeEasingFunctionForKeyPath:(NSString *)keyPath;

@end
