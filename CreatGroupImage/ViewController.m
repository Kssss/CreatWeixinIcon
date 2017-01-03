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
@property (nonatomic,strong) UIImageView  *imageV4;
@property (nonatomic,strong) UIImageView  *imageV5;
@property (nonatomic,strong) UIImageView  *imageV6;
@property (nonatomic,strong) UIImageView  *imageV7;
@property (nonatomic,strong) UIImageView  *imageV8;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setPrompt:@"点击屏幕开始"];
 }
- (void)loadSubView
{
    self.imageV = [[UIImageView  alloc] initWithFrame:CGRectMake(40, 100, 100, 100)];
    [self.view addSubview:self.imageV];
    self.imageV2 = [[UIImageView  alloc] initWithFrame:CGRectMake(180, 100, 100, 100)];
    [self.view addSubview:self.imageV2];
    self.imageV3 = [[UIImageView  alloc] initWithFrame:CGRectMake(40,240 ,100, 100)];
    [self.view addSubview:self.imageV3];
    self.imageV4 = [[UIImageView alloc] initWithFrame:CGRectMake(180, 240, 100, 100)];
    [self.view addSubview:self.imageV4];
    self.imageV5 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 380, 100, 100)];
    [self.view addSubview:self.imageV5];
    self.imageV6 = [[UIImageView alloc] initWithFrame:CGRectMake(180, 380, 100, 100)];
    [self.view addSubview:self.imageV6];
    self.imageV7 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 520, 100, 100)];
    [self.view addSubview:self.imageV7];
    self.imageV8 = [[UIImageView alloc] initWithFrame:CGRectMake(180, 520, 100, 100)];
    [self.view addSubview:self.imageV8];
    
    
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.backgroundColor = [UIColor lightGrayColor];
    }];
}
// 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    __block NSMutableArray *array = [NSMutableArray array];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:obj];
    }];
    [array enumerateObjectsUsingBlock:^(UIView  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self loadSubView];
    NSMutableArray *urlStr = @[@"http://v1.qzone.cc/avatar/201503/15/13/08/550513b64bcbf041.jpg%21200x200.jpg",
                               @"http://img2.jfdown.com/upload/2/e9a65b00-b782-476e-933e-82d3a7ffd6fa.jpg",
                               @"http://tupian.qqjay.com/tou2/2016/0804/20cfec7259143037b09641a814e3f0c3.jpg",
                               @"http://img63.nipic.com/file/20150425/20879097_211407359000_1.jpg",
                               @"http://diy.qqjay.com/u2/2013/0320/2503c2c0e65e84b4f5c6d571b7377629.jpg",
                               @"http://img.wzfzl.cn/uploads/allimg/161001/2-161001042122.jpg",
                               @"http://www.th7.cn/d/file/p/2016/10/10/7732280a15bd9a4c679f9dc9e3925d54.jpg",
                               @"http://img.popoho.com/allimg/130104/1434392364-26.jpg",
                               @"http://tupian.qqjay.com/tou2/2016/0822/fb74c68fddedc28e8f8cc43acadf97ca.jpg",
                               @"http://tupian.qqjay.com/tou2/2016/0809/426df8708058d433bb4e18bf310a7879.jpg",
                               @"http://www.feizl.com/upload2007/2014_06/1406271337769428.jpg",
                               @"http://tupian.qqjay.com/tou2/2016/0819/317e4c86acac73abb77225b90069372b.jpg",].mutableCopy;
    
    NSURL *url0 = [NSURL URLWithString:urlStr[0]];
    NSURL *url1 = [NSURL URLWithString:urlStr[1]];
    NSURL *url2 = [NSURL URLWithString:urlStr[2]];
    NSURL *url3 = [NSURL URLWithString:urlStr[3]];
    NSURL *url4 = [NSURL URLWithString:urlStr[4]];
    NSURL *url5 = [NSURL URLWithString:urlStr[5]];
    NSURL *url6 = [NSURL URLWithString:urlStr[6]];
    NSURL *url7 = [NSURL URLWithString:urlStr[7]];
    NSURL *url8 = [NSURL URLWithString:urlStr[8]];
    
    
    [CJGroupImageTool creatGroupUrl:@[url0,url1] image:^(UIImage *image) {
        self.imageV.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url3]image:^(UIImage *image) {
        self.imageV2.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url3,url4]image:^(UIImage *image) {
        self.imageV3.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url3,url4,url5]image:^(UIImage *image) {
        self.imageV4.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url2,url3,url4,url5] image:^(UIImage *image) {
        self.imageV5.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url2,url3,url4,url5,url6] image:^(UIImage *image) {
        self.imageV6.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url2,url3,url4,url5,url6,url7] image:^(UIImage *image) {
        self.imageV7.image = image;
    }];
    [CJGroupImageTool creatGroupUrl:@[url0,url1,url2,url3,url4,url5,url6,url7,url8] image:^(UIImage *image) {
        self.imageV8.image = image;
    }];
}

@end
