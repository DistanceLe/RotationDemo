//
//  LJLineLayer.h
//  RotationDemo
//
//  Created by LiJie on 16/9/1.
//  Copyright © 2016年 LiJie. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface LJLineLayer : CALayer

+(instancetype)getLineWithFrame:(CGRect)frame
                     FromePoint:(CGPoint)fromePoint
                        ToPoint:(CGPoint)toPoint
                          width:(float)width
                          color:(CGColorRef)color;

@end
