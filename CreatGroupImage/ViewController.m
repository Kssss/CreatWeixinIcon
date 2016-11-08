//
//  ViewController.m
//  CreatGroupImage
//
//  Created by Vieene on 16/7/26.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "ViewController.h"
#import "CJGroupImageTool.h"

@interface ViewController ()
@property (nonatomic,strong) UIImageView  *imageV;
@property (nonatomic,strong) UIImageView  *imageV2;
@property (nonatomic,strong) UIImageView  *imageV3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubView];
    [self.navigationItem setPrompt:@"点击屏幕开始"];
 }
- (void)loadSubView
{
    self.imageV = [[UIImageView  alloc] init];
    self.imageV.frame = CGRectMake(40, 100, 140, 140);
    [self.view addSubview:self.imageV];
    
    self.imageV2 = [[UIImageView  alloc] init];
    self.imageV2.frame = CGRectMake(180, 180, 140, 140);
    [self.view addSubview:self.imageV2];
    self.imageV3 = [[UIImageView  alloc] init];
    self.imageV3.frame = CGRectMake(40,320 ,140, 140);
    [self.view addSubview:self.imageV3];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.backgroundColor = [UIColor lightGrayColor];
    }];
}
// 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    

    NSMutableArray *urlStr = @[@"http://p2.wmpic.me/article/2016/01/05/1451965063_yGDyTOWl_215x185.jpg",
                               @"http://img2.3lian.com/2014/f5/107/81.jpg",
                               @"http://img0.imgtn.bdimg.com/it/u=3722669989,1324928559&fm=21&gp=0.jpg",
                               @"http://img63.nipic.com/file/20150425/20879097_211407359000_1.jpg",
                               @"http://img15.3lian.com/2015/f1/7/44.jpg",
                               @"https://www.baidu.com.jpg"].mutableCopy;
    
    NSURL *url0 = [NSURL URLWithString:urlStr[0]];
    NSURL *url1 = [NSURL URLWithString:urlStr[1]];
    NSURL *url2 = [NSURL URLWithString:urlStr[2]];
    NSURL *url3 = [NSURL URLWithString:urlStr[3]];
    NSURL *url4 = [NSURL URLWithString:urlStr[4]];
    NSURL *url5 = [NSURL URLWithString:urlStr[5]];
    
    
    [CJGroupImageTool creatGroupUrl:@[url0,url1] image:^(UIImage *image) {
        self.imageV.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url3]image:^(UIImage *image) {
        self.imageV2.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url2,url3,url4,url5] image:^(UIImage *image) {
        self.imageV3.image = image;
    }];

}

@end
