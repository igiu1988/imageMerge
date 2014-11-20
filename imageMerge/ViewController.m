//
//  ViewController.m
//  imageMerge
//
//  Created by wangyang on 11/19/14.
//  Copyright (c) 2014 WY. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "UIImage+RotateImage.h"
#import "UIView+SSToolkitAdditions.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *resultImage = [_container imageRepresentation];
    
    // 导出
    NSData *data = UIImagePNGRepresentation(resultImage);
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingPathComponent:@"image1.png"];
    [data writeToFile:path atomically:YES];
    
//    DrawView *view = [[DrawView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    [self.view addSubview:view];
//    
//    UIImage *image = [[UIImage imageNamed:@"3"] rotateImageWithRadian:M_PI_4 cropMode:enSvCropExpand];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, image.size.width/2, image.size.height/2)];
//    imageView.image = image;
//    [self.view addSubview:imageView];
    
    
    // 合成一个图
//    UIImage *image1 = [UIImage imageNamed:@"1"];
//    UIImage *image2 = [[UIImage imageNamed:@"2"] rotateImageWithRadian:M_PI_2 cropMode:enSvCropExpand];
//    UIImage *image3 = [[UIImage imageNamed:@"3"] rotateImageWithRadian:M_PI_4 cropMode:enSvCropExpand];
//    
//    
//    CGSize outputSize = CGSizeMake(image1.size.width, image1.size.height);
//    UIGraphicsBeginImageContext(outputSize);
//    
//    [image1 drawInRect:CGRectMake(0, 0, image1.size.width/2, image1.size.height/2)];
//    [image2 drawInRect:CGRectMake(10, 10, image2.size.width/2, image2.size.height)];
//    [image3 drawInRect:CGRectMake(150, 150, image3.size.width, image3.size.height)];
//    
//    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    
//    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, resultImage.size.width/2, resultImage.size.height/2)];
//    imageView1.image = resultImage;
//    [self.view addSubview:imageView1];
//    
//    // 导出
//    NSData *data = UIImagePNGRepresentation(resultImage);
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    path = [path stringByAppendingPathComponent:@"image.png"];
//    [data writeToFile:path atomically:YES];
    
    NSDictionary *info = @{@"image": [UIImage imageNamed:@"2"],
                           @"angle": @(M_PI_4),
                           @"x":@0,
                           @"y":@10};
    NSDictionary *info1 = @{@"image": [UIImage imageNamed:@"3"],
                           @"angle": @(M_PI_4),
                           @"x":@100,
                           @"y":@100};
    [self exportImage:[UIImage imageNamed:@"1"] decorateImages:@[info, info1]];
}



- (void)exportImage:(UIImage *)mainImage decorateImages:(NSArray *)imageInfos
{
    
    CGSize outputSize = CGSizeMake(mainImage.size.width, mainImage.size.height);
    UIGraphicsBeginImageContext(outputSize);
    
    [mainImage drawInRect:CGRectMake(0, 0, outputSize.width, outputSize.height)];
    
    for (NSDictionary *info in imageInfos) {
        UIImage *image = info[@"image"];
        NSNumber *angle = info[@"angle"];
        NSNumber *x = info[@"x"];
        NSNumber *y = info[@"y"];
        CGRect rect = CGRectMake(x.floatValue, y.floatValue, image.size.width, image.size.height);
        
        image = [image rotateImageWithRadian:angle.floatValue cropMode:enSvCropExpand];
        [image drawInRect:rect];
    }
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 导出
    NSData *data = UIImagePNGRepresentation(resultImage);
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingPathComponent:@"image.png"];
    [data writeToFile:path atomically:YES];
}


@end
