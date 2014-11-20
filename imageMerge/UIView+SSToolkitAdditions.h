//
//  UIView+SSToolkitAdditions.h
//  SSToolkit
//
//  Created by Sam Soffes on 2/15/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//

/**
 Provides extensions to `UIView` for various common tasks.
 */

#import <UIKit/UIKit.h>
@interface UIView (SSToolkitAdditions)

///-------------------------
/// @name Taking Screenshots
///-------------------------

/**
 Takes a screenshot of the underlying `CALayer` of the receiver and returns a `UIImage` object representation.

 @return An image representing the receiver
 */
- (UIImage *)imageRepresentation;


@end
