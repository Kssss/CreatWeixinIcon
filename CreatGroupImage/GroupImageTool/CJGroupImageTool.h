//
//  CJGroupImage.h
//  CreatGroupImage
//
//  Created by Vieene on 16/7/26.
//  Copyright © 2016年 hhly. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface CJGroupImageTool : NSObject

/**     网络异步生成图片
 * @param imageArray 图片的URL地址
 * @param imageHandle 生成图片以后的回调
 */
+(void)creatGroupUrl:(NSArray <NSURL *> *)urlArray image:(void (^)(UIImage *))imageHandle;

@end
