//
//  UIView+EasingFunctions.m
//  Easing
//
//  Created by Zoreslav Khimich on 30/04/2013.
//  Copyright (c) 2013 Zoreslav Khimich. All rights reserved.
//

#import "UIView+EasingFunctions.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

#pragma mark - CAKeyFrameAnimation factories

static const NSUInteger KeyframeCount = 60;

CAKeyframeAnimation *AnimationWithCGFloat(NSString *keyPath, ViewEasingFunctionPointerType function, CGFloat fromValue, CGFloat toValue) {
    
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:KeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (KeyframeCount - 1);
    
	for(size_t frame = 0; frame < KeyframeCount; ++frame, t += dt) {
        
		CGFloat value = fromValue + function(t) * (toValue - fromValue);
		[values addObject:[NSNumber numberWithFloat:value]];
        
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
	[animation setValues:values];
    
	return animation;
    
}


CAKeyframeAnimation *AnimationWithCGPoint(NSString *keyPath, ViewEasingFunctionPointerType function, CGPoint fromPoint, CGPoint toPoint) {
    
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:KeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (KeyframeCount - 1);
    
	for(size_t frame = 0; frame < KeyframeCount; ++frame, t += dt) {
        
		CGFloat x = fromPoint.x + function(t) * (toPoint.x - fromPoint.x);
		CGFloat y = fromPoint.y + function(t) * (toPoint.y - fromPoint.y);
        
		[values addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
        
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
	[animation setValues:values];
    
	return animation;
    
}

CAKeyframeAnimation *AnimationWithCGRect(NSString *keyPath, ViewEasingFunctionPointerType function, CGRect fromRect, CGRect toRect) {
    
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:KeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (KeyframeCount - 1);
    
	for(size_t frame = 0; frame < KeyframeCount; ++frame, t += dt) {
        
		CGFloat x = fromRect.origin.x + function(t) * (toRect.origin.x - fromRect.origin.x);
		CGFloat y = fromRect.origin.y + function(t) * (toRect.origin.y - fromRect.origin.y);
        
        CGFloat width = fromRect.size.width + function(t) * (toRect.size.width - fromRect.size.width);
        CGFloat height = fromRect.size.height + function(t) * (toRect.size.height - fromRect.size.height);
        
		[values addObject:[NSValue valueWithCGRect:CGRectMake(x, y, width, height)]];
        
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
	[animation setValues:values];
    
	return animation;
    
}

CAKeyframeAnimation *AnimationWithCATransform3D(NSString *keyPath, ViewEasingFunctionPointerType function, CATransform3D fromMatrix, CATransform3D toMatrix) {
    
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:KeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (KeyframeCount - 1);
    
	for(size_t frame = 0; frame < KeyframeCount; ++frame, t += dt) {
        
        CATransform3D value;
        
        value.m11 = fromMatrix.m11 + function(t) * (toMatrix.m11 - fromMatrix.m11);
        value.m12 = fromMatrix.m12 + function(t) * (toMatrix.m12 - fromMatrix.m12);
        value.m13 = fromMatrix.m13 + function(t) * (toMatrix.m13 - fromMatrix.m13);
        value.m14 = fromMatrix.m14 + function(t) * (toMatrix.m14 - fromMatrix.m14);

        value.m21 = fromMatrix.m21 + function(t) * (toMatrix.m21 - fromMatrix.m21);
        value.m22 = fromMatrix.m22 + function(t) * (toMatrix.m22 - fromMatrix.m22);
        value.m23 = fromMatrix.m23 + function(t) * (toMatrix.m23 - fromMatrix.m23);
        value.m24 = fromMatrix.m24 + function(t) * (toMatrix.m24 - fromMatrix.m24);

        value.m31 = fromMatrix.m31 + function(t) * (toMatrix.m31 - fromMatrix.m31);
        value.m32 = fromMatrix.m32 + function(t) * (toMatrix.m32 - fromMatrix.m32);
        value.m33 = fromMatrix.m33 + function(t) * (toMatrix.m33 - fromMatrix.m33);
        value.m34 = fromMatrix.m34 + function(t) * (toMatrix.m34 - fromMatrix.m34);

        value.m41 = fromMatrix.m41 + function(t) * (toMatrix.m41 - fromMatrix.m41);
        value.m42 = fromMatrix.m42 + function(t) * (toMatrix.m42 - fromMatrix.m42);
        value.m43 = fromMatrix.m43 + function(t) * (toMatrix.m43 - fromMatrix.m43);
        value.m44 = fromMatrix.m44 + function(t) * (toMatrix.m44 - fromMatrix.m44);
    
		[values addObject:[NSValue valueWithCATransform3D:value]];
        
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
	[animation setValues:values];
    
	return animation;
    
}

CAKeyframeAnimation *AnimationWithCGColor(NSString *keyPath, ViewEasingFunctionPointerType function, CGColorRef fromColor, CGColorRef toColor) {
    
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:KeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (KeyframeCount - 1);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace(toColor);
    
    size_t numberOfComponents = CGColorGetNumberOfComponents(toColor);
    const CGFloat *fromComponents = CGColorGetComponents(fromColor);
    const CGFloat *toComponents = CGColorGetComponents(toColor);
    
    CGFloat components[numberOfComponents];
    
	for(size_t frame = 0; frame < KeyframeCount; ++frame, t += dt) {
        
        for (size_t c = 0; c < numberOfComponents; ++c)
            components[c] = fromComponents[c] + function(t) * (toComponents[c] - fromComponents[c]);
        
        CGColorRef value = CGColorCreate(colorSpace, components);
        
        [values addObject:CFBridgingRelease(value)];
        
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
	[animation setValues:values];
    
	return animation;
    
}

#pragma mark - CALayer

static NSString *const LayerEasingFunctionsKey = @"ui+ef_LayerEasingFunctionsKey";

@interface  CALayer (Easing)

- (void)easing_addAnimation:(CAAnimation *)anim forKey:(NSString *)key;

- (void)setEasingFunction:(ViewEasingFunctionPointerType)function forKeyPath:(NSString *)layerKeyPath;

- (void)removeEasingFunctionForKeyPath:(NSString *)layerKeyPath;

@end

@implementation CALayer (Easing)

static BOOL Swizzled = NO;

- (void)setEasingFunction:(ViewEasingFunctionPointerType)function forKeyPath:(NSString *)layerKeyPath {

    if (!Swizzled)
    {
        /* swizzle addAnimation:forKey: */

        Method original = class_getInstanceMethod(CALayer.class, @selector(addAnimation:forKey:));
        Method substitute = class_getInstanceMethod(CALayer.class, @selector(easing_addAnimation:forKey:));

        method_exchangeImplementations(original, substitute);

        Swizzled = YES;
    }

    NSMutableDictionary *easingFunctions = [self valueForKey:LayerEasingFunctionsKey];
    
    if (!easingFunctions) {
        
        easingFunctions = [NSMutableDictionary dictionary];
        [self setValue:easingFunctions forKey:LayerEasingFunctionsKey];
        
    }
    
    easingFunctions[layerKeyPath] = [NSValue valueWithPointer:function];

}

- (void)removeEasingFunctionForKeyPath:(NSString *)layerKeyPath {
    
    NSMutableDictionary *easingFunctions = [self valueForKey:LayerEasingFunctionsKey];
    
    if (!easingFunctions)
        return;
    
    [easingFunctions removeObjectForKey:layerKeyPath];

}

- (void)easing_addAnimation:(CAAnimation *)anim forKey:(NSString *)keyPath {
    
    NSDictionary *easingFunctions = [self valueForKey:LayerEasingFunctionsKey];
    ViewEasingFunctionPointerType function = [[easingFunctions valueForKey:keyPath] pointerValue];
    
    if (!function || ![anim isKindOfClass:[CABasicAnimation class]]) {
        
        /* nothing to do, use the original addAnimation:forKey: and return */
        [self easing_addAnimation:anim forKey:keyPath];
        
        return;
        
    }
    
    CAAnimation *override;
    
    CABasicAnimation *basicAnimation = (CABasicAnimation *)anim;
    
    NSValue *curentValue = [self valueForKey:keyPath];
    NSValue *fromValue = basicAnimation.fromValue ?: curentValue;
    NSValue *toValue = basicAnimation.toValue ?: curentValue;
    
    if (![fromValue isKindOfClass:[NSValue class]]) {
        
        /* Foundation objects */
        
        CFTypeRef ref = (__bridge CFTypeRef)(fromValue);
        
        /* CGColorRef */
        if (CFGetTypeID(ref) == CGColorGetTypeID()) {
            
            CGColorRef from = (CGColorRef)ref;
            CGColorRef to = (__bridge CGColorRef)toValue;
            
            override = AnimationWithCGColor(keyPath, function, from, to);
            
        }
        
    }
    
    else if (strcmp(@encode(CGFloat), [fromValue objCType]) == 0) {

        /* CGFloat */
        
#if CGFLOAT_IS_DOUBLE
        CGFloat from = [(NSNumber *)fromValue doubleValue];
        CGFloat to = [(NSNumber *)toValue doubleValue];
#else
        CGFloat from = [(NSNumber *)fromValue floatValue];
        CGFloat to = [(NSNumber *)toValue floatValue];
#endif
        
        override = AnimationWithCGFloat(keyPath, function, from, to);
        
    }
    
    else if (strcmp(@encode(CGPoint), [fromValue objCType]) == 0) {
        
        /* CGPoint */
        
        CGPoint from = [fromValue CGPointValue];
        CGPoint to = [toValue CGPointValue];
        
        override = AnimationWithCGPoint(keyPath, function, from, to);
        
    }
    
    else if (strcmp(@encode(CGRect), [fromValue objCType]) == 0) {
        
        /* CGRect */
        
        CGRect from = [fromValue CGRectValue];
        CGRect to = [toValue CGRectValue];
        
        override = AnimationWithCGRect(keyPath, function, from, to);
        
    }
    
    else if (strcmp(@encode(CATransform3D), [fromValue objCType]) == 0) {
        
        /* CATransform3D */
        
        CATransform3D from = [fromValue CATransform3DValue];
        CATransform3D to = [toValue CATransform3DValue];
        
        override = AnimationWithCATransform3D(keyPath, function, from, to);
        
    }
    
    if (override) {
        
        override.duration = anim.duration;
        
        override.beginTime = anim.beginTime + [self convertTime:CACurrentMediaTime() fromLayer:nil];
        
        override.speed = anim.speed;
        override.timeOffset = anim.timeOffset;
        override.repeatCount = anim.repeatCount;
        override.repeatDuration = anim.repeatDuration;
        override.autoreverses = anim.autoreverses;
        override.fillMode = anim.fillMode;
        override.delegate = anim.delegate;
        override.removedOnCompletion = anim.removedOnCompletion;
        
        [self easing_addAnimation:override forKey:keyPath];
        
    } else {
        
        /* unknown property type, use the original animation */
        [self easing_addAnimation:anim forKey:keyPath];
        
    }
    
}

@end

#pragma mark - UIView

@implementation UIView (Easing)

- (void)setEasingFunction:(ViewEasingFunctionPointerType)function forKeyPath:(NSString *)keyPath {
    
    if ([keyPath isEqualToString:@"alpha"])
        [self.layer setEasingFunction:function forKeyPath:@"opacity"];
    
    else if ([keyPath isEqualToString:@"center"])
        [self.layer setEasingFunction:function forKeyPath:@"position"];
    
    else if ([keyPath isEqualToString:@"frame"]) {
        
        [self.layer setEasingFunction:function forKeyPath:@"position"];
        [self.layer setEasingFunction:function forKeyPath:@"bounds"];
        
    }
    
    else
        [self.layer setEasingFunction:function forKeyPath:keyPath];

}

- (void)removeEasingFunctionForKeyPath:(NSString *)keyPath {
    
    if ([keyPath isEqualToString:@"alpha"])
        [self.layer removeEasingFunctionForKeyPath:@"opacity"];
    
    else if ([keyPath isEqualToString:@"center"])
        [self.layer removeEasingFunctionForKeyPath:@"position"];
    
    else if ([keyPath isEqualToString:@"frame"]) {
        
        [self.layer removeEasingFunctionForKeyPath:@"position"];
        [self.layer removeEasingFunctionForKeyPath:@"bounds"];
        
    }
    
    else
        [self.layer removeEasingFunctionForKeyPath:keyPath];
    
}


@end
