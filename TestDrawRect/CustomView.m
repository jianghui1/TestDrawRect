//
//  CustomView.m
//  TestDrawRect
//
//  Created by ys on 15/12/31.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

// 覆盖drawRect方法，你可以在此自定义绘画和动画
- (void)drawRect:(CGRect)rect
{
    // 一个不透明类型的Quartz 2D绘画环境，相当于一个画布，你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /* 写文字 */
    [self writeWordWithCGContextRef:context];
    
    /* 画圆 */
    [self drawCircleWithCGContextRef:context];
    
    /* 画线及弧线 */
    [self drawLineAndArcLineWithCGContextRef:context];
    
    /* 画矩形 */
    [self drawRectangleWithCGContextRef:context];
    
    /* 画扇形和椭圆 */
    [self drawSectorAndOvalWithCGContextRef:context];
    
    /* 画三角形 */
    [self drawTrilateralWithCGContextRef:context];
    
    /* 画圆角矩形 */
    [self drawRoundedRectangularWithCGContextRef:context];
    
    /* 画贝塞尔曲线 */
    [self drawBethelWithCGContextRef:context];
    
    /* 图片 */
    [self drawPictureWithCGContextRef:context];
}

#pragma mark - 写文字
- (void)writeWordWithCGContextRef:(CGContextRef)context
{
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0); // 设置填充颜色
    UIFont *font = [UIFont boldSystemFontOfSize:15.0]; // 设置字体
//    [@"画圆" drawInRect:CGRectMake(10, 20, 80, 20) withFont:font];
    [@"画圆" drawInRect:CGRectMake(10, 20, 80, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
    [@"画线及弧线:" drawInRect:CGRectMake(10, 80, 100, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
    [@"画矩形：" drawInRect:CGRectMake(10, 120, 80, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
    [@"画扇形和椭圆：" drawInRect:CGRectMake(10, 160, 110, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
    [@"画三角形：" drawInRect:CGRectMake(10, 220, 80, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
    [@"画圆角矩形：" drawInRect:CGRectMake(10, 260, 100, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
    [@"画贝塞尔曲线:" drawInRect:CGRectMake(10, 300, 100, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
    [@"图片:" drawInRect:CGRectMake(10, 340, 80, 20) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor redColor]}];
}

#pragma mark - 画圆 
- (void)drawCircleWithCGContextRef:(CGContextRef)context
{
    // 边框圆
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1.0); // 画笔线的颜色
    CGContextSetLineWidth(context, 1.0); // 线的宽度
    // 画弧度
    CGContextAddArc(context, 100, 20, 15, 0, 2 * M_PI, 0); // 添加一个圆
    CGContextDrawPath(context, kCGPathStroke); // 绘制路径
    
    // 填充圆，无边框
    CGContextSetRGBFillColor(context, 1.0, .0, 0, 1);
    CGContextAddArc(context, 150, 30, 30, 0, 2 * M_PI, 0); // 添加一个圆
    CGContextDrawPath(context, kCGPathFill); // 绘制填充
    
    // 画大圆并填充颜色
    UIColor *aColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor); // 填充颜色
    CGContextSetLineWidth(context, 3.0); // 线的宽度
    CGContextAddArc(context, 250, 40, 40, 0, 2 * M_PI, 0); // 添加一个圆
    // kCGPathFill填充非零绕数规则，kCGPathEOFill表示用奇偶规则，kCGPathStroke路径，kCGPathFillStroke路径填充，kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFillStroke); // 绘制路径加填充
    
}

#pragma mark - 画线及弧线
- (void)drawLineAndArcLineWithCGContextRef:(CGContextRef)context
{
    // 画线
    CGPoint aPoint[2]; // 坐标点
    aPoint[0] = CGPointMake(100, 80); // 坐标1
    aPoint[1] = CGPointMake(130, 80); // 坐标2
//    CGContextAddLines(CGContextRef  _Nullable c, const CGPoint * _Nullable points, size_t count)
    // points坐标数组， 和count大小
    CGContextAddLines(context, aPoint, 2); // 添加线
    CGContextDrawPath(context, kCGPathStroke); // 根据坐标绘制路径
    
    // 画笑脸弧线
    // 左
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1); // 改变画笔颜色
    CGContextMoveToPoint(context, 140, 80); // 开始坐标p1
//    CGContextAddArcToPoint(CGContextRef  _Nullable c, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
    // x1,y1跟p1形成一条线的坐标p2，x2，y2结束坐标跟p3形成一条线的p3，radius半径，注意，需要算好半径的长度
    CGContextAddArcToPoint(context, 148, 68, 156, 80, 10);
    CGContextStrokePath(context);
    
    // 右
    CGContextMoveToPoint(context, 160, 80); // 开始坐标p1
//    CGContextAddArcToPoint(CGContextRef  _Nullable c, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
    CGContextAddArcToPoint(context, 168, 68, 176, 80, 10);
    CGContextStrokePath(context); // 绘画路径

    // 右
    CGContextMoveToPoint(context, 150, 90); // 开始坐标p1
    CGContextAddArcToPoint(context, 158, 102, 166, 90, 10);
    CGContextStrokePath(context); // 绘画路径
}

#pragma mark - 画矩形 
- (void)drawRectangleWithCGContextRef:(CGContextRef)context
{
    /* 画矩形 */
    CGContextStrokeRect(context, CGRectMake(100, 120, 10, 10)); // 画方框
    CGContextFillRect(context, CGRectMake(120, 120, 10, 10)); // 填充框
    // 矩形，并填充颜色
    CGContextSetLineWidth(context, 2.0); // 线的宽度
    UIColor *aColor = [UIColor blueColor]; // 蓝色
    CGContextSetFillColorWithColor(context, aColor.CGColor); // 填充颜色
    aColor = [UIColor yellowColor];
    CGContextSetStrokeColorWithColor(context, aColor.CGColor); // 线框颜色
    CGContextAddRect(context, CGRectMake(140, 120, 60, 30)); // 画方框
    CGContextDrawPath(context, kCGPathFillStroke); // 绘画路径
    
    // 矩形，并填充渐变颜色
    // 第一种填充方式，第一种方式必须导入类库quartcore并#impor<QuartzCore/QuartzCore.h>,这个就不属于在context上画，而是将层插入到view层上面，那么这里就设计到Quartz Core 图层编程了。
    CAGradientLayer *gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(240, 120, 60, 30);
    gradient1.colors = [NSArray arrayWithObjects:[UIColor whiteColor], [UIColor grayColor], [UIColor yellowColor].CGColor, [UIColor blueColor].CGColor, [UIColor redColor].CGColor, [UIColor greenColor].CGColor, [UIColor orangeColor].CGColor, [UIColor brownColor].CGColor, nil];
    [self.layer insertSublayer:gradient1 atIndex:0];
    
    // 第二种填充方式
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] = {1,1,1, 1.00, 1,1,0, 1.00, 1,0,0, 1.00, 1,0,1, 1.00, 0,1,1, 1.00, 0,1,0, 1.00, 0,0,1, 1.00, 0,0,0, 1.00};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors) / (sizeof(colors[0]) * 4)); // 形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    // 画线形成一个矩形
//    CGContextSaveGState与CGContextRestoreGState的作用
    /* CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。在修改完成后，您可以通过CGContextSaveGState函数把堆栈顶部的状态弹出，返回到之前的图形状态。这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤销所有的状态修改；这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。 */
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 220, 90);
    CGContextAddLineToPoint(context, 240, 90);
    CGContextAddLineToPoint(context, 240, 110);
    CGContextAddLineToPoint(context, 220, 110);
    CGContextClip(context); // context裁剪路径，后续操作的路径
//    CGContextDrawLinearGradient(CGContextRef  _Nullable c, CGGradientRef  _Nullable gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
    // grandient渐变颜色，startPoint开始渐变的起始位置，endPoint结束坐标，options开始坐标之前or开始之后开始渐变
    CGContextDrawLinearGradient(context, gradient, CGPointMake(220, 90), CGPointMake(240, 110), kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context); // 恢复到之前的context
    
    // 再写一个看看效果
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 260, 90);
    CGContextAddLineToPoint(context, 280, 90);
    CGContextAddLineToPoint(context, 280, 100);
    CGContextAddLineToPoint(context, 260, 100);
    CGContextClip(context); // 裁剪路径
    // 说白了，开始坐标和结束坐标是控制渐变的方向和形状
    CGContextDrawLinearGradient(context, gradient, CGPointMake(260, 90), CGPointMake(260, 100), kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context); // 恢复到之前的context
    
    // 下面在看一下颜色渐变的圆
    CGContextDrawRadialGradient(context, gradient, CGPointMake(300, 100), 0.0, CGPointMake(300, 100), 10, kCGGradientDrawsBeforeStartLocation);
}

#pragma mark - 画扇形和椭圆 
- (void)drawSectorAndOvalWithCGContextRef:(CGContextRef)context
{
    /* 画扇形和椭圆 */
    // 画扇形，也就是画圆，只不过是设置角度的大小，形成一个扇形
    UIColor *aColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor); // 填充颜色
    // 以10为半径围绕圆心画指定角度扇形
    CGContextMoveToPoint(context, 160, 180);
    CGContextAddArc(context, 160, 180, 30,  -60 * M_PI / 180, -120 * M_PI / 180, 1);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); // 绘制路径
    
    // 画椭圆
    CGContextAddEllipseInRect(context, CGRectMake(160, 180, 20, 8)); // 椭圆
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark - 画三角形
- (void)drawTrilateralWithCGContextRef:(CGContextRef)context
{
    /* 画三角形 */
    // 只要三个点就行 跟画一条线的方式一样，把三点连接起来
    CGPoint sPoint[3]; // 坐标点
    sPoint[0] = CGPointMake(100, 220); // 坐标1
    sPoint[1] = CGPointMake(130, 220); // 坐标2
    sPoint[2] = CGPointMake(130, 160); // 坐标3
    CGContextAddLines(context, sPoint, 3); // 添加线
    CGContextClosePath(context); // 封起来
    CGContextDrawPath(context, kCGPathFillStroke); // 根据坐标绘制路径
}

#pragma mark - 画圆角矩形
- (void)drawRoundedRectangularWithCGContextRef:(CGContextRef)context
{
    /* 画圆角矩形 */
    float fw = 180;
    float fh = 280;
    
    CGContextMoveToPoint(context, fw, fh - 20); // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw - 20, fh, 10); // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh - 20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw - 20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh - 20, 10); // 右上角
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); // 根据坐标绘制路径
}

#pragma mark - 画贝塞尔曲线 
- (void)drawBethelWithCGContextRef:(CGContextRef)context
{
    // 二次曲线
    CGContextMoveToPoint(context, 120, 330); // 设置Path的起点
    CGContextAddQuadCurveToPoint(context, 190, 310, 120, 390); // 设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(context);
    // 三次曲线函数
    CGContextMoveToPoint(context, 200, 300); // 设置Path的起点
    CGContextAddCurveToPoint(context, 250, 280, 250, 400, 280, 300); // 设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
    CGContextStrokePath(context);
}

#pragma mark - 图片
- (void)drawPictureWithCGContextRef:(CGContextRef)context
{
    UIImage *image = [UIImage imageNamed:@"3.jpg"];
    [image drawInRect:CGRectMake(60, 340, 20, 20)]; // 在坐标中画出图片
    [image drawAtPoint:CGPointMake(100, 340)]; // 保持图片大小在point点开始画图片
    CGContextDrawImage(context, CGRectMake(100, 340, 20, 20), image.CGImage); // 使用这个使图片上下颠倒了，
//    CGContextDrawTiledImage(context, CGRectMake(0, 0, 20, 20), image.CGImage); // 平铺图
}












@end
