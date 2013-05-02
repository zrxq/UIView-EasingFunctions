UIView+EasingFunctions
======================

This is a category on `UIView` that allows to attach custom easing functions to animatable `UIView` properties.

`UIView+EasingFunctions` works great with [AHEasing](https://github.com/warrenm/AHEasing), a library of easing functions. The library contains almost every easing function you might ever need.

Of course you can write your own easing functions as well.

Easing functions?
-----------------

> **Easing functions** specify the rate of change of a parameter over time.
> Objects in real life don’t just start and stop instantly, and almost never move at a constant speed. When we open a drawer, we first move it quickly, and slow it down as it comes out. Drop something on the floor, and it will first accelerate downwards, and then bounce back up after hitting the floor.

*from [easings.net](http://easings.net)* (you should probably check the site, it does a great job explaining and illustrating various easing functions)


Usage
-----

Let's say you want to make a view's `frame` animation bouncy:

```objc
#import <UIView+EasingFunctions.h>

#import <AHEasing/easing.h>

/* ... */

[view setEasingFunction:BounceEaseOut forKeyPath:@"frame"];
```

That's it. Now *any* `frame` animation of this view will use `BounceEaseOut` easing function (defined in [AHEasing](https://github.com/warrenm/AHEasing)):

```objc
[UIView animateWithDuration:.5 animations:^{
    
    view.frame = CGRectMake(10, 110, 100, 32);
    
}];
```

What if you only want one specific `frame` animation to be bouncy? Use the completion block to remove the easing function:

```objc
[UIView animateWithDuration:.6 animations:^{
    
    [view setEasingFunction:ElasticEaseOut forKeyPath:@"center"];
    
    view.center = CGPointMake(160, 415);
    
} completion:^(BOOL finished) {
    
    [self.dialogView removeEasingFunctionForKeyPath:@"center"];
    
}];
```

Check out the [sample app](https://github.com/zrxq/UIView-EasingFunctions/tree/master/EasingSampleApp) to see how it works (make sure to open `.xcworkspace` file, not the `.xcodeproj`).

What properties are supported?
------------------------------

Everything animatable should work just fine, except for `contentStretch`. It was recently deprecated anyway.

Gotchas
-------

Animating `backgroundColor` between two colors in different color spaces (including pattern images) won't do any good. 

How it works 
------------

It swizzles `addAnimation:forKey:` of the view's backing `CALayer`.

Acknowledgement
---------------

The entire idea of hijacking the backing layer's `addAnimation:forKey:` comes from [this blog post](http://blog.radi.ws/post/26493755964/using-custom-timing-functions-and-animation-objects) by [Evadne Wu](http://radi.ws).

License
-------

[Do whatever you want](http://www.wtfpl.net).
