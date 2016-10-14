//
//  DrawView.m
//  TestDrawRect
//
//  Created by ys on 15/12/31.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect
{
    // 1、获取处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2、设置线条样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    // 3、设置线条粗细宽度
    CGContextSetLineWidth(context, 1.0);
    
    // 4、设置颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    
    // 5、开始一个起始路径
    CGContextBeginPath(context);
    
    // 6、起始点设置为（0，0）；注意这是上下文对应区域中的相对坐标
    CGContextMoveToPoint(context, 0, 0);
    
    // 7、设置下一个坐标点
    CGContextAddLineToPoint(context, 100, 100);

    // 8、设置下一个坐标点
    CGContextAddLineToPoint(context, 0, 150);
    
    // 9、设置下一个坐标点
    CGContextAddLineToPoint(context, 50, 180);
    
    // 10、连接上面定义的坐标点
    CGContextStrokePath(context);
}




















@end
