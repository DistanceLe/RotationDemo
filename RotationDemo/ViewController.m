//
//  ViewController.m
//  RotationDemo
//
//  Created by LiJie on 16/8/31.
//  Copyright © 2016年 LiJie. All rights reserved.
//

#import "ViewController.h"
#import "LJImageTools.h"
#import "LJLineLayer.h"

@interface ViewController ()

@property(nonatomic, strong)UIImageView* imageView;
@property(nonatomic, strong)UIImageView* imageView1;
@property(nonatomic, strong)UIImageView* imageView2;
@property(nonatomic, strong)NSString* imageName;
@property(nonatomic, strong)NSString* imageName1;
@property(nonatomic, strong)NSString* imageName2;
@property(nonatomic, assign)CGFloat angle;
@property(nonatomic, assign)CGFloat angle1;
@property(nonatomic, assign)CGFloat angle2;
@property(nonatomic, strong)NSTimer* time;
@property(nonatomic, strong)NSTimer* time1;
@property(nonatomic, strong)NSTimer* time2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    _imageName=@"icon";
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 150, 150)];
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    _imageView.backgroundColor=[UIColor redColor];
    UIImage* image=[UIImage imageNamed:_imageName];
    image=[LJImageTools rotationImage:image angle:70 clip:NO];
    
    _imageView.image=image;
    [self.view addSubview:_imageView];
    
    LJLineLayer* line1=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(0, 0) ToPoint:CGPointMake(_imageView.bounds.size.width, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    LJLineLayer* line2=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(_imageView.bounds.size.width, 0) ToPoint:CGPointMake(0, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    
    [_imageView.layer addSublayer:line1];
    [_imageView.layer addSublayer:line2];
    
    _time=[NSTimer timerWithTimeInterval:3 target:self selector:@selector(rotateWithBeginangle:) userInfo:_imageName repeats:YES];
    [_time fire];
    [[NSRunLoop currentRunLoop]addTimer:_time forMode:NSRunLoopCommonModes];
    
    /**  =========================== */
    
    _imageName1=@"test3";
    _imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(180, 50, 150, 150)];
    _imageView1.contentMode=UIViewContentModeScaleAspectFit;
    _imageView1.backgroundColor=[UIColor redColor];
    UIImage* image1=[UIImage imageNamed:_imageName1];
    image=[LJImageTools rotationImage:image1 angle:70 clip:NO];
    
    _imageView1.image=image;
    [self.view addSubview:_imageView1];
    
    LJLineLayer* line11=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(0, 0) ToPoint:CGPointMake(_imageView.bounds.size.width, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    LJLineLayer* line21=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(_imageView.bounds.size.width, 0) ToPoint:CGPointMake(0, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    
    [_imageView1.layer addSublayer:line11];
    [_imageView1.layer addSublayer:line21];
    
    _time1=[NSTimer timerWithTimeInterval:3 target:self selector:@selector(rotateWithBeginangle:) userInfo:_imageName1 repeats:YES];
    [_time1 fire];
    [[NSRunLoop currentRunLoop]addTimer:_time1 forMode:NSRunLoopCommonModes];
    
    /**  =========================== */
    
    _imageName2=@"test4";
    _imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(20, 220, 150, 150)];
    _imageView2.contentMode=UIViewContentModeScaleAspectFit;
    _imageView2.backgroundColor=[UIColor redColor];
    UIImage* image2=[UIImage imageNamed:_imageName2];
    image=[LJImageTools rotationImage:image2 angle:70 clip:NO];
    
    _imageView2.image=image;
    [self.view addSubview:_imageView2];
    
    LJLineLayer* line12=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(0, 0) ToPoint:CGPointMake(_imageView.bounds.size.width, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    LJLineLayer* line22=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(_imageView.bounds.size.width, 0) ToPoint:CGPointMake(0, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    
    [_imageView2.layer addSublayer:line12];
    [_imageView2.layer addSublayer:line22];
    
    _time2=[NSTimer timerWithTimeInterval:3 target:self selector:@selector(rotateWithBeginangle:) userInfo:_imageName2 repeats:YES];
    [_time2 fire];
    [[NSRunLoop currentRunLoop]addTimer:_time2 forMode:NSRunLoopCommonModes];
    
    
}

-(void)rotateWithBeginangle:(NSTimer*)obj{
    NSString* imageName=obj.userInfo;
    if (imageName==self.imageName) {
        [self rotateImageWithName:imageName imageView:self.imageView angle:self.angle+=10];
    }else if(imageName==self.imageName1){
        [self rotateImageWithName:imageName imageView:self.imageView1 angle:self.angle1+=10 ];
    }else{
        [self rotateImageWithName:imageName imageView:self.imageView2 angle:self.angle2+=10];
    }
}
-(void)rotateImageWithName:(NSString*)imageName imageView:(UIImageView*)imageView angle:(CGFloat)angle{
    
    UIImage* image=[UIImage imageNamed:imageName];
    image=[LJImageTools rotationImage:image angle:angle+10 clip:NO];
    imageView.image=image;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage* image=[UIImage imageNamed:imageName];
        image=[LJImageTools rotationImage:image angle:angle+20 clip:NO];
        imageView.image=image;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIImage* image=[UIImage imageNamed:imageName];
            image=[LJImageTools rotationImage:image angle:angle+30 clip:NO];
            imageView.image=image;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                UIImage* image=[UIImage imageNamed:imageName];
                image=[LJImageTools rotationImage:image angle:angle+40 clip:NO];
                imageView.image=image;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    UIImage* image=[UIImage imageNamed:imageName];
                    image=[LJImageTools rotationImage:image angle:angle+50 clip:NO];
                    imageView.image=image;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        UIImage* image=[UIImage imageNamed:imageName];
                        image=[LJImageTools rotationImage:image angle:angle+60 clip:NO];
                        imageView.image=image;
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            UIImage* image=[UIImage imageNamed:imageName];
                            image=[LJImageTools rotationImage:image angle:angle+70 clip:NO];
                            imageView.image=image;
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                UIImage* image=[UIImage imageNamed:imageName];
                                image=[LJImageTools rotationImage:image angle:angle+80 clip:NO];
                                imageView.image=image;
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(  0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    UIImage* image=[UIImage imageNamed:imageName];
                                    image=[LJImageTools rotationImage:image angle:angle+90 clip:NO];
                                    imageView.image=image;
                                });
                            });
                        });
                    });
                });
            });
        });
    });
}


@end
