//
//  CJGroupImage.m
//  CreatGroupImage
//
//  Created by Vieene on 16/7/26.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "CJGroupImageTool.h"
@interface CJGroupImageTool ()
@property (strong, nonatomic)  UIView *backView;
@property (strong, nonatomic)  UIImageView *groupImage;

@end
@implementation CJGroupImageTool
+(void)creatGroupUrl:(NSArray <NSURL *> *)urlArray image:(void (^)(UIImage *))imageHandle
{
    CJGroupImageTool *tool =  [[self alloc] init];
    if (![tool checkImageArray:urlArray]) {
        return ;
    }
    __block NSMutableArray *groupImages = [NSMutableArray array];
    dispatch_queue_t queue = dispatch_queue_create("downloadImages", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        //创建信号
        dispatch_semaphore_t disp = dispatch_semaphore_create(0);
        [urlArray enumerateObjectsUsingBlock:^(NSURL * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSURLRequest *request = [NSURLRequest requestWithURL:obj];
            __block UIImage *image = nil;
            NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error) {
                    image = [UIImage imageNamed:@"default"];
                }else{
                    image = [UIImage imageWithData:data];
                }
                if (!image){
                    image = [UIImage imageNamed:@"default"];
                    NSLog(@"下载失败的图片地址：%@",request.URL);
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [groupImages addObject:image];
                    if (groupImages.count == urlArray.count) {
                        //发送信号
                        dispatch_semaphore_signal(disp);
                    }
                });
            }];
            [dataTask resume];
        }];
        // 信号等待
        dispatch_semaphore_wait(disp, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            [tool loadSubView:groupImages];
            if (imageHandle) {
                imageHandle([tool creatGroupImage]);
            }
            
        });
    });
}


- (BOOL)checkImageArray:(NSArray *)imageUrlArray
{
    if (imageUrlArray.count==0 || imageUrlArray.count == 1) {
        NSLog(@"图片NSURL数目为0 或者为1 了");
        return NO;
    }
    __block BOOL result ;
    [imageUrlArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[NSURL class]]){
            result = YES;
        }else{
            NSLog(@"数组只能包含NSURL");
            * stop = YES;
            result  = NO;
        }
    }];
    return result;

}
- (void)loadSubView:(NSMutableArray * )imageArray
{
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.borderWidth = 0.5;
    self.backView.layer.masksToBounds = YES;
    self.backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.backView.frame = CGRectMake(0, 0, 140, 140);
    switch (imageArray.count) {
        case 2:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 38.75, 62.5, 62.5)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(72.5, 38.75, 62.5, 62.5)];
            imageV2.image = imageArray[1];
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
        }
            break;
        case 3:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(38.75, 5, 62.5, 62.5)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 72.5, 62.5, 62.5)];
            imageV2.image = imageArray[1];
            
            UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(72.5, 72.5, 62.5, 62.5)];
            imageV3.image = imageArray[2];
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
            [self.backView addSubview:imageV3];
        }
            break;
        case 4:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 62.5, 62.5)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(72.5, 5, 62.5, 62.5)];
            imageV2.image = imageArray[1];
            
            UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 72.5, 62.5, 62.5)];
            imageV3.image = imageArray[2];
            
            UIImageView *imageV4 = [[UIImageView alloc]initWithFrame:CGRectMake(72.5, 72.5, 62.5, 62.5)];
            imageV4.image = imageArray[3];
            
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
            [self.backView addSubview:imageV3];
            [self.backView addSubview:imageV4];
        }
            break;
        case 5:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(27.5 , 27.5, 40, 40)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(72.5, 27.5, 40, 40)];
            imageV2.image = imageArray[1];
            
            UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 72.5, 40, 40)];
            imageV3.image = imageArray[2];
            
            UIImageView *imageV4 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 72.5, 40, 40)];
            imageV4.image = imageArray[3];
            
            UIImageView *imageV5 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 72.5, 40, 40)];
            imageV5.image = imageArray[4];
            
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
            [self.backView addSubview:imageV3];
            [self.backView addSubview:imageV4];
            [self.backView addSubview:imageV5];
        }
            break;
        case 6:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 27.5, 40, 40)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 27.5, 40, 40)];
            imageV2.image = imageArray[1];
            
            UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 27.5, 40, 40)];
            imageV3.image = imageArray[2];
            
            UIImageView *imageV4 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 72.5, 40, 40)];
            imageV4.image = imageArray[3];
            
            UIImageView *imageV5 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 72.5, 40, 40)];
            imageV5.image = imageArray[4];
            
            UIImageView *imageV6 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 72., 40, 40)];
            imageV6.image = imageArray[5];
            
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
            [self.backView addSubview:imageV3];
            [self.backView addSubview:imageV4];
            [self.backView addSubview:imageV5];
            [self.backView addSubview:imageV6];
        }
            break;
        case 7:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 5, 40, 40)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 50, 40, 40)];
            imageV2.image = imageArray[1];
            
            UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
            imageV3.image = imageArray[2];
            
            UIImageView *imageV4 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 50, 40, 40)];
            imageV4.image = imageArray[3];
            
            UIImageView *imageV5 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 95, 40, 40)];
            imageV5.image = imageArray[4];
            
            UIImageView *imageV6 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 95, 40, 40)];
            imageV6.image = imageArray[5];
            
            UIImageView *imageV7 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 95, 40, 40)];
            imageV7.image = imageArray[6];
            
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
            [self.backView addSubview:imageV3];
            [self.backView addSubview:imageV4];
            [self.backView addSubview:imageV5];
            [self.backView addSubview:imageV6];
            [self.backView addSubview:imageV7];
        }
            break;
        case 8:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(27.5, 5, 40, 40)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(72.5, 5, 40, 40)];
            imageV2.image = imageArray[1];
            
            UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 50, 40, 40)];
            imageV3.image = imageArray[2];
            
            UIImageView *imageV4 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
            imageV4.image = imageArray[3];
            
            UIImageView *imageV5 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 50, 40, 40)];
            imageV5.image = imageArray[4];
            
            UIImageView *imageV6 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 95, 40, 40)];
            imageV6.image = imageArray[5];
            
            UIImageView *imageV7 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 95, 40, 40)];
            imageV7.image = imageArray[6];
            
            UIImageView *imageV8 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 95, 40, 40)];
            imageV8.image = imageArray[7];
            
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
            [self.backView addSubview:imageV3];
            [self.backView addSubview:imageV4];
            [self.backView addSubview:imageV5];
            [self.backView addSubview:imageV6];
            [self.backView addSubview:imageV7];
            [self.backView addSubview:imageV8];
        }
            break;
        default:
        {
            UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
            imageV1.image = imageArray[0];
            
            UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 5, 40, 40)];
            imageV2.image = imageArray[1];
            
            UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 5, 40, 40)];
            imageV3.image = imageArray[2];
            
            UIImageView *imageV4 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 50, 40, 40)];
            imageV4.image = imageArray[3];
            
            UIImageView *imageV5 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
            imageV5.image = imageArray[4];
            
            UIImageView *imageV6 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 50, 40, 40)];
            imageV6.image = imageArray[5];
            
            UIImageView *imageV7 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 95, 40, 40)];
            imageV7.image = imageArray[6];
            
            UIImageView *imageV8 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 95, 40, 40)];
            imageV8.image = imageArray[7];
            
            UIImageView *imageV9 = [[UIImageView alloc]initWithFrame:CGRectMake(95, 95, 40, 40)];
            imageV9.image = imageArray[8];
            
            [self.backView addSubview:imageV1];
            [self.backView addSubview:imageV2];
            [self.backView addSubview:imageV3];
            [self.backView addSubview:imageV4];
            [self.backView addSubview:imageV5];
            [self.backView addSubview:imageV6];
            [self.backView addSubview:imageV7];
            [self.backView addSubview:imageV8];
            [self.backView addSubview:imageV9];
        }
            break;
    }
    

}
- (UIImage *)creatGroupImage{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(280 , 280), YES, 0);
    [[self.backView layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = viewImage.CGImage;
    CGRect rect = CGRectMake(0, 0, 280, 280);
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    
    return sendImage;
    
}
@end
