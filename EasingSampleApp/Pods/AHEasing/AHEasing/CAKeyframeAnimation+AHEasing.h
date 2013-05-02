//
//  CAKeyframeAnimation+AHEasing.h
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import <QuartzCore/QuartzCore.h>
#include "easing.h"

@interface CAKeyframeAnimation (AHEasing)

// Factory method to create a keyframe animation for animating a scalar value
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue keyframeCount:(size_t)keyframeCount;

// Factory method to create a keyframe animation for animating a scalar value, with keyFrameCount set to AHEasingDefaultKeyframeCount
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue;

// Factory method to create a keyframe animation for animating between two points
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint keyframeCount:(size_t)keyframeCount;

// Factory method to create a keyframe animation for animating between two points, with keyFrameCount set to AHEasingDefaultKeyframeCount
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromPoint:(CGPoint)fromValue toPoint:(CGPoint)toValue;

// Factory method to create a keyframe animation for animating between two sizes
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromSize:(CGSize)fromSize toSize:(CGSize)toSize keyframeCount:(size_t)keyframeCount;

// Factory method to create a keyframe animation for animating between two sizes, with keyFrameCount set to AHEasingDefaultKeyframeCount
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromSize:(CGSize)fromValue toSize:(CGSize)toValue;

@end
