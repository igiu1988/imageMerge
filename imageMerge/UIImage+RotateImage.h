//
//  UIImage+RotateImage.h
//  imageMerge
//
//  Created by wangyang on 11/20/14.
//  Copyright (c) 2014 WY. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, SvCropMode) {
    enSvCropClip,               // the image size will be equal to orignal image, some part of image may be cliped
    enSvCropExpand,             // the image size will expand to contain the whole image, remain area will be transparent
};
@interface UIImage (RotateImage)


/**
 *  用来返回一个已经旋转好的图片
 *  参考：http://www.cnblogs.com/smileEvday/archive/2013/05/25/IOSImageEdit.html
 *  参考：http://www.360doc.com/content/14/0313/18/16235376_360322089.shtml
 *
 *  @param radian   弧度
 *  @param cropMode 旋转模式
 *
 *  @return 旋转好的图片
 */
- (UIImage*)rotateImageWithRadian:(CGFloat)radian cropMode:(SvCropMode)cropMode;
@end
