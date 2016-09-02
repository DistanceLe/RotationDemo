//
//  LJLineLayer.m
//  RotationDemo
//
//  Created by LiJie on 16/9/1.
//  Copyright © 2016年 LiJie. All rights reserved.
//

#import "LJLineLayer.h"

@interface LJLineLayer ()

@property(nonatomic, assign)CGPoint    fromPoint;
@property(nonatomic, assign)CGPoint    toPoint;
@property(nonatomic, assign)CGColorRef lineColor;
@property(nonatomic, assign)float      lineWidth;

@end

@implementation LJLineLayer

+(instancetype)getLineWithFrame:(CGRect)frame
                     FromePoint:(CGPoint)fromePoint
                        ToPoint:(CGPoint)toPoint
                          width:(float)width
                          color:(CGColorRef)color{
    
    LJLineLayer* lineLayer=[LJLineLayer layer];
    lineLayer.frame=frame;
    lineLayer.lineWidth=width;
    lineLayer.lineColor=color;
    lineLayer.fromPoint=fromePoint;
    lineLayer.toPoint=toPoint;
    [lineLayer setNeedsDisplay];
    return lineLayer;
}

-(void)drawInContext:(CGContextRef)ctx{
    
    UIBezierPath* linePath=[UIBezierPath bezierPath];
    [linePath moveToPoint:self.fromPoint];
    [linePath addLineToPoint:self.toPoint];
    
    CGContextAddPath(ctx, linePath.CGPath);
    CGContextSetLineWidth(ctx, self.lineWidth);
    CGContextSetStrokeColorWithColor(ctx, self.lineColor);
    CGContextStrokePath(ctx);
}













@end
