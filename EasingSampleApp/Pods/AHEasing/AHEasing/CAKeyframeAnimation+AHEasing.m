//
//  CAKeyframeAnimation+AHEasing.m
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import "CAKeyframeAnimation+AHEasing.h"

#if !defined(AHEasingDefaultKeyframeCount)

// The larger this number, the smoother the animation
#define AHEasingDefaultKeyframeCount 60

#endif

@implementation CAKeyframeAnimation (AHEasing)

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue keyframeCount:(size_t)keyframeCount
{
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:keyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (keyframeCount - 1);
	for(size_t frame = 0; frame < keyframeCount; ++frame, t += dt)
	{
		CGFloat value = fromValue + function(t) * (toValue - fromValue);
		[values addObject:[NSNumber numberWithFloat:(float)value]];
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
	[animation setValues:values];
	return animation;
}

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue
{
    return [self animationWithKeyPath:path function:function fromValue:fromValue toValue:toValue keyframeCount:AHEasingDefaultKeyframeCount];
}

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint keyframeCount:(size_t)keyframeCount
{
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:keyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (keyframeCount - 1);
	for(size_t frame = 0; frame < keyframeCount; ++frame, t += dt)
	{
		CGFloat x = fromPoint.x + function(t) * (toPoint.x - fromPoint.x);
		CGFloat y = fromPoint.y + function(t) * (toPoint.y - fromPoint.y);
#if TARGET_OS_IPHONE
		[values addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
#else
		[values addObject:[NSValue valueWithPoint:NSMakePoint(x, y)]];
#endif
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
	[animation setValues:values];
	return animation;
}

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
    return [self animationWithKeyPath:path function:function fromPoint:fromPoint toPoint:toPoint keyframeCount:AHEasingDefaultKeyframeCount];
}

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromSize:(CGSize)fromSize toSize:(CGSize)toSize keyframeCount:(size_t)keyframeCount
{
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:keyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (keyframeCount - 1);
	for(size_t frame = 0; frame < keyframeCount; ++frame, t += dt)
	{
		CGFloat w = fromSize.width + function(t) * (toSize.width - fromSize.width);
		CGFloat h = fromSize.height + function(t) * (toSize.height - fromSize.height);
#if TARGET_OS_IPHONE
		[values addObject:[NSValue valueWithCGSize:CGSizeMake(w, h)]];
#else
		[values addObject:[NSValue valueWithSize:NSMakeSize(w, h)]];
#endif
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
	[animation setValues:values];
	return animation;
}

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromSize:(CGSize)fromSize toSize:(CGSize)toSize
{
    return [self animationWithKeyPath:path function:function fromSize:fromSize toSize:toSize keyframeCount:AHEasingDefaultKeyframeCount];
}

@end
