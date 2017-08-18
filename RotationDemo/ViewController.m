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

@property(nonatomic, assign)BOOL imageClip;

@property(nonatomic, assign)NSInteger timesNum;
@property(nonatomic, assign)NSInteger timesNum1;
@property(nonatomic, assign)NSInteger timesNum2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    //设置是否裁剪图片，不裁剪的话，图片会相应的缩小，裁剪则不会缩小 但是边缘部分会被去掉。
    self.imageClip=NO;
    
    _imageName=@"icon";
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 150, 150)];
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    _imageView.backgroundColor=[UIColor redColor];
    UIImage* image=[UIImage imageNamed:_imageName];
    image=[LJImageTools rotationImage:image angle:70 clip:_imageClip];
    
    _imageView.image=image;
    [self.view addSubview:_imageView];
    
    LJLineLayer* line1=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(0, 0) ToPoint:CGPointMake(_imageView.bounds.size.width, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    LJLineLayer* line2=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(_imageView.bounds.size.width, 0) ToPoint:CGPointMake(0, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    
    [_imageView.layer addSublayer:line1];
    [_imageView.layer addSublayer:line2];
    
    /**  =========================== */
    
    _imageName1=@"test3";
    _imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(180, 50, 150, 150)];
    _imageView1.contentMode=UIViewContentModeScaleAspectFit;
    _imageView1.backgroundColor=[UIColor redColor];
    UIImage* image1=[UIImage imageNamed:_imageName1];
    image=[LJImageTools rotationImage:image1 angle:70 clip:_imageClip];
    
    _imageView1.image=image;
    [self.view addSubview:_imageView1];
    
    LJLineLayer* line11=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(0, 0) ToPoint:CGPointMake(_imageView.bounds.size.width, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    LJLineLayer* line21=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(_imageView.bounds.size.width, 0) ToPoint:CGPointMake(0, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    
    [_imageView1.layer addSublayer:line11];
    [_imageView1.layer addSublayer:line21];
    
    /**  =========================== */
    
    _imageName2=@"test4";
    _imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(20, 220, 150, 150)];
    _imageView2.contentMode=UIViewContentModeScaleAspectFit;
    _imageView2.backgroundColor=[UIColor redColor];
    UIImage* image2=[UIImage imageNamed:_imageName2];
    image=[LJImageTools rotationImage:image2 angle:70 clip:_imageClip];
    
    _imageView2.image=image;
    [self.view addSubview:_imageView2];
    
    LJLineLayer* line12=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(0, 0) ToPoint:CGPointMake(_imageView.bounds.size.width, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    LJLineLayer* line22=[LJLineLayer getLineWithFrame:_imageView.bounds FromePoint:CGPointMake(_imageView.bounds.size.width, 0) ToPoint:CGPointMake(0, _imageView.bounds.size.height) width:1 color:[UIColor yellowColor].CGColor];
    
    [_imageView2.layer addSublayer:line12];
    [_imageView2.layer addSublayer:line22];
    

    [self rotateImageWithName:_imageName imageView:_imageView angle:0  times:1];
    [self rotateImageWithName:_imageName1 imageView:_imageView1 angle:0  times:1];
    [self rotateImageWithName:_imageName2 imageView:_imageView2 angle:0  times:1];
}

-(void)rotateImageWithName:(NSString*)imageName imageView:(UIImageView*)imageView angle:(CGFloat)angle times:(NSInteger)times{
    
    dispatch_queue_t anyncQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(anyncQueue, ^{
        
        CGFloat interval = 1/30.0;
        CGFloat baseNum = 1.0;
        UIImage* image=[UIImage imageNamed:imageName];
        image=[LJImageTools rotationImage:image angle:angle+times*baseNum clip:self.imageClip];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            imageView.image=image;
            [self rotateImageWithName:imageName imageView:imageView angle:angle times:(times+1)];
        });
    });
}


@end
