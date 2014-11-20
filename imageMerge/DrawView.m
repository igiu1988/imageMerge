//
//  DrawView.m
//  imageMerge
//
//  Created by wangyang on 11/19/14.
//  Copyright (c) 2014 WY. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView
- (void)drawRect:(CGRect)rect {
    UIImage *image1 = [UIImage imageNamed:@"3"];
    UIImage *image2 = [UIImage imageNamed:@"2"];
    
    CGSize size = image1.size;

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextDrawImage(context,
                       CGRectMake(0, 0, size.width, size.height),
                       image1.CGImage);

    
    UIGraphicsEndImageContext();
}


@end
