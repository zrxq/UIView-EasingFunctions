AHEasing
========
A supplemental library of easing functions for C, C++, and Objective-C
--------

The useful portion of this project consists of two parts:

1. A stand-alone easing function library, implemented in C (easing.h/easing.c)
2. CAAnimation category methods to more easily use easing in your Core Animation projects

Supported functions
--------

The following types of easing functions are planned to be supported:

* Linear
* Quadratic
* Cubic
* Quartic
* Quintic
* Sine
* Circular
* Elastic
* Bounce
* Back

Each of these has corresponding ease-in, ease-out, and ease-in-out variants. The core easing functions are implemented as C functions that take a time parameter and return a progress parameter, which can subsequently be used to interpolate any quantity.

Goals
--------
	
The design goals of AHEasing are:

* To be as fast as conceivably possible while maintaining human readability
* To be portable to any system with a C runtime
* To elucidate the mathematical underpinnings of common easing functions

Inspiration
--------

This work is a spiritual descendent (not to say derivative work) of works done by the following individuals:

* Robert Penner (http://www.robertpenner.com/easing/)
* George McGinley Smith (http://gsgd.co.uk/sandbox/jquery/easing/)
* James Padolsey (http://james.padolsey.com/demos/jquery/easing/)
* Authors of jQuery (http://plugins.jquery.com/project/Easing)
* Matt Gallagher (http://cocoawithlove.com/2008/09/parametric-acceleration-curves-in-core.html)
* Jesse Crossen (http://stackoverflow.com/questions/5161465/how-to-create-custom-easing-function-with-core-animation)