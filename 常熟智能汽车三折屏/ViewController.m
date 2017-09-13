//
//  ViewController.m
//  常熟智能汽车三折屏
//
//  Created by 尤超 on 17/4/25.
//  Copyright © 2017年 尤超. All rights reserved.
//

#import "ViewController.h"

#define   KSCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define   KSCREENHEIGHT  [UIScreen mainScreen].bounds.size.height
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;
@property (nonatomic, strong) UIButton *btn4;

@property (nonatomic, strong) UIButton *car;

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIView *view4;

@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line3;

@property (nonatomic, strong) UIImageView *img1;
@property (nonatomic, strong) UIImageView *img2;
@property (nonatomic, strong) UIImageView *img3;
@property (nonatomic, strong) UIImageView *img4;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIImageView *backImg = [[UIImageView alloc] init];
    backImg.image = [UIImage imageNamed:@"0"];
    backImg.frame = self.view.frame;
    [self.view addSubview:backImg];
    
    
    UIButton *back = [[UIButton alloc] init];
    [self addBtn:back Frame:CGRectMake(850, 680 , 120, 50) SEL:@selector(backClick) Img:@"back"];
    
    
    [self setUpUI];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self btnClickWithblock:^{
            CGPoint tempCenter = self.car.center;
            
            tempCenter.x += 264;
            tempCenter.y += 100;
            
            self.car.center = tempCenter;
            
        }];
    });

    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.btn1.hidden = NO;
        self.btn2.hidden = NO;
        self.btn3.hidden = NO;
        self.btn4.hidden = NO;
        self.view1.hidden = NO;
        self.view2.hidden = NO;
        self.view3.hidden = NO;
        self.view4.hidden = NO;
        self.line1.hidden = NO;
        self.line3.hidden = NO;
    });
    
}

- (void)setUpUI {
    self.btn1 = [[UIButton alloc] init];
    [self addBtn:self.btn1 Frame:CGRectMake(120, 200, 182, 100) SEL:@selector(btn1Click) Img:@"1"];
    self.btn1.hidden = YES;
    
    self.btn2 = [[UIButton alloc] init];
    [self addBtn:self.btn2 Frame:CGRectMake(120, 450, 152, 88) SEL:@selector(btn2Click) Img:@"2"];
    self.btn2.hidden = YES;
    
    self.btn3 = [[UIButton alloc] init];
    [self addBtn:self.btn3 Frame:CGRectMake(660, 220, 174, 90) SEL:@selector(btn3Click) Img:@"3"];
    self.btn3.hidden = YES;
    
    self.btn4 = [[UIButton alloc] init];
    [self addBtn:self.btn4 Frame:CGRectMake(760, 500, 165, 90) SEL:@selector(btn4Click) Img:@"4"];
    self.btn4.hidden = YES;
    
    
    
    self.line1 = [[UIView alloc] init];
    [self addView:self.line1 Frame:CGRectMake(482, 220, 1, 88)];
    self.line1.hidden = YES;
    
    self.line3 = [[UIView alloc] init];
    [self addView:self.line3 Frame:CGRectMake(532, 240, 1, 156)];
    self.line3.hidden = YES;
    
    
    self.view1 = [[UIView alloc] init];
    [self addView:self.view1 Frame:CGRectMake(280, 220, 202, 1)];
    self.view1.hidden = YES;
    
    
    self.view2 = [[UIView alloc] init];
    [self addView:self.view2 Frame:CGRectMake(220, 472, 122, 1)];
    self.view2.hidden = YES;
    
    self.view3 = [[UIView alloc] init];
    [self addView:self.view3 Frame:CGRectMake(532, 240, 145, 1)];
    self.view3.hidden = YES;
    
    self.view4 = [[UIView alloc] init];
    [self addView:self.view4 Frame:CGRectMake(705, 540, 110, 1)];
    self.view4.hidden = YES;
    
    self.img1 = [[UIImageView alloc] init];
    [self addIMG:self.img1 Frame:CGRectMake(230, 240, 417, 235) Name:@"6"];
    self.img1.alpha = 0;
    
    self.img2 = [[UIImageView alloc] init];
    [self addIMG:self.img2 Frame:CGRectMake(230, 150, 470, 524) Name:@"7"];
    self.img2.alpha = 0;
    
    self.img3 = [[UIImageView alloc] init];
    [self addIMG:self.img3 Frame:CGRectMake(260, 230, 450, 415) Name:@"8"];
    self.img3.alpha = 0;
    
    self.img4 = [[UIImageView alloc] init];
    [self addIMG:self.img4 Frame:CGRectMake(260, 300, 470, 236) Name:@"9"];
    self.img4.alpha = 0;
    
    UIButton *back = [[UIButton alloc] init];
    [self addBtn:back Frame:CGRectMake(850, 680 , 120, 50) SEL:@selector(backClick) Img:@"back"];
    
    
    self.car = [[UIButton alloc] init];
    [self addBtn:self.car Frame:CGRectMake(20, 200 , 476, 293) SEL:nil Img:@"5"];
    
    
}


- (void)backClick {
    
    [self dismissViewControllerAnimated:YES completion: nil];

    
    
//    self.car.frame = CGRectMake(20, 200 , 476, 293);
//    
//    self.btn1.hidden = YES;
//    self.btn2.hidden = YES;
//    self.btn3.hidden = YES;
//    self.btn4.hidden = YES;
//    self.view1.hidden = YES;
//    self.view2.hidden = YES;
//    self.view3.hidden = YES;
//    self.view4.hidden = YES;
//    self.line1.hidden = YES;
//    self.line3.hidden = YES;
//    
//    self.img1.alpha = 0;
//    self.img2.alpha = 0;
//    self.img3.alpha = 0;
//    self.img4.alpha = 0;
//    
//    self.btn1.frame = CGRectMake(120, 200, 182, 100);
//    self.btn2.frame = CGRectMake(120, 450, 152, 88);
//    self.btn3.frame = CGRectMake(660, 220, 174, 90);
//    self.btn4.frame = CGRectMake(760, 500, 165, 90);
//    
//    self.view1.transform = CGAffineTransformIdentity;
//    self.view2.transform = CGAffineTransformIdentity;
//    self.view3.transform = CGAffineTransformIdentity;
//    self.view4.transform = CGAffineTransformIdentity;
//    
//    self.btn1.userInteractionEnabled = YES;
//    self.btn2.userInteractionEnabled = YES;
//    self.btn3.userInteractionEnabled = YES;
//    self.btn4.userInteractionEnabled = YES;
//    
//    
//    self.line1.backgroundColor = COLOR(0, 245, 255, 1);
//    self.view1.backgroundColor = COLOR(0, 245, 255, 1);
//    self.view2.backgroundColor = COLOR(0, 245, 255, 1);
//    self.view3.backgroundColor = COLOR(0, 245, 255, 1);
//    self.view4.backgroundColor = COLOR(0, 245, 255, 1);
//    self.line3.backgroundColor = COLOR(0, 245, 255, 1);
//    
//    [self.btn1 setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
//    [self.btn2 setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
//    [self.btn3 setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
//    [self.btn4 setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
//
//    
//    
//    [self btnClickWithblock:^{
//        CGPoint tempCenter = self.car.center;
//        
//        tempCenter.x += 264;
//        tempCenter.y += 100;
//        
//        self.car.center = tempCenter;
//        
//    }];
//    
//
//    
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.btn1.hidden = NO;
//        self.btn2.hidden = NO;
//        self.btn3.hidden = NO;
//        self.btn4.hidden = NO;
//        self.view1.hidden = NO;
//        self.view2.hidden = NO;
//        self.view3.hidden = NO;
//        self.view4.hidden = NO;
//        self.line1.hidden = NO;
//        self.line3.hidden = NO;
//    });
//
    
}

- (void)addView:(UIView *)view Frame:(CGRect)frame {
    view.frame = frame;
    view.backgroundColor = COLOR(0, 245, 255, 1);
    [self.view addSubview:view];

}

- (void)addIMG:(UIImageView *)img Frame:(CGRect)frame Name:(NSString *)name {
    img.frame = frame;
    img.image = [UIImage imageNamed:name];
    [self.view addSubview:img];
    
}

- (void)btn1Click {
    self.img2.alpha = 0;
    self.img3.alpha = 0;
    self.img4.alpha = 0;
    
    
    self.btn2.frame = CGRectMake(120, 450, 152, 88);
    self.btn3.frame = CGRectMake(660, 220, 174, 90);
    self.btn4.frame = CGRectMake(760, 500, 165, 90);
    
   
    self.view2.transform = CGAffineTransformIdentity;
    self.view3.transform = CGAffineTransformIdentity;
    self.view4.transform = CGAffineTransformIdentity;
    
    self.btn2.userInteractionEnabled = YES;
    self.btn3.userInteractionEnabled = YES;
    self.btn4.userInteractionEnabled = YES;
    
    
    self.line1.backgroundColor = COLOR(103, 172, 44, 1);
    self.view1.backgroundColor = COLOR(103, 172, 44, 1);
    
    self.view2.backgroundColor = COLOR(0, 245, 255, 1);
    self.view3.backgroundColor = COLOR(0, 245, 255, 1);
    self.view4.backgroundColor = COLOR(0, 245, 255, 1);
    self.line3.backgroundColor = COLOR(0, 245, 255, 1);
    
    [self.btn1 setImage:[UIImage imageNamed:@"1S"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    [self.btn3 setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    [self.btn4 setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
    
    [self addAnimations:self.view1 Time:2.0 Angle:20.0 Multiple:1.3];
    
    [self btnClickWithblock:^{
        CGPoint tempCenter = self.btn1.center;
        
        tempCenter.y -= 70;
        
        self.btn1.center = tempCenter;
        
        CGAffineTransform transform = self.btn1.transform;
        //第二个值表示横向，第三个值表示纵向
        transform = CGAffineTransformScale(transform, 1.5,1.5);
        self.btn1.transform = transform;

        self.btn1.userInteractionEnabled = NO;
        
        self.img1.alpha += 1.0;
    }];
    
    
}

- (void)btn2Click {
    
    self.img1.alpha = 0;
    self.img3.alpha = 0;
    self.img4.alpha = 0;
    
    self.btn1.frame = CGRectMake(120, 200, 182, 100);
    self.btn3.frame = CGRectMake(660, 220, 174, 90);
    self.btn4.frame = CGRectMake(760, 500, 165, 90);
    
    self.view1.transform = CGAffineTransformIdentity;
    self.view3.transform = CGAffineTransformIdentity;
    self.view4.transform = CGAffineTransformIdentity;
    
    self.btn1.userInteractionEnabled = YES;
    self.btn3.userInteractionEnabled = YES;
    self.btn4.userInteractionEnabled = YES;
    
   
    self.view2.backgroundColor = COLOR(103, 172, 44, 1);
    
    self.view1.backgroundColor = COLOR(0, 245, 255, 1);
    self.view3.backgroundColor = COLOR(0, 245, 255, 1);
    self.view4.backgroundColor = COLOR(0, 245, 255, 1);
    self.line1.backgroundColor = COLOR(0, 245, 255, 1);
    self.line3.backgroundColor = COLOR(0, 245, 255, 1);
    
    [self.btn1 setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"2S"] forState:UIControlStateNormal];
    [self.btn3 setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    [self.btn4 setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
    
    [self addAnimations:self.view2 Time:2.0 Angle:-20.0 Multiple:1.3];
    
    [self btnClickWithblock:^{
        CGPoint tempCenter = self.btn2.center;
        
        tempCenter.y += 70;
        
        self.btn2.center = tempCenter;
        
        CGAffineTransform transform = self.btn2.transform;
        //第二个值表示横向，第三个值表示纵向
        transform = CGAffineTransformScale(transform, 1.5,1.5);
        self.btn2.transform = transform;

        
        self.btn2.userInteractionEnabled = NO;
        
        self.img2.alpha += 1.0;
    }];

    
}

- (void)btn3Click {
    self.img1.alpha = 0;
    self.img2.alpha = 0;
    self.img4.alpha = 0;
    
    self.btn1.frame = CGRectMake(120, 200, 182, 100);
    self.btn2.frame = CGRectMake(120, 450, 152, 88);
    self.btn4.frame = CGRectMake(760, 500, 165, 90);
    
    self.view1.transform = CGAffineTransformIdentity;
    self.view2.transform = CGAffineTransformIdentity;
    self.view4.transform = CGAffineTransformIdentity;
    
    self.btn1.userInteractionEnabled = YES;
    self.btn2.userInteractionEnabled = YES;
    self.btn4.userInteractionEnabled = YES;
    
    self.line3.backgroundColor = COLOR(103, 172, 44, 1);
    self.view3.backgroundColor = COLOR(103, 172, 44, 1);
    
    self.view1.backgroundColor = COLOR(0, 245, 255, 1);
    self.view2.backgroundColor = COLOR(0, 245, 255, 1);
    self.view4.backgroundColor = COLOR(0, 245, 255, 1);
    self.line1.backgroundColor = COLOR(0, 245, 255, 1);
 
    [self.btn1 setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    [self.btn3 setImage:[UIImage imageNamed:@"3S"] forState:UIControlStateNormal];
    [self.btn4 setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
    
    [self addAnimations2:self.view3 Time:2.0 Angle:-20 Multiple:1.3];
    [self btnClickWithblock:^{
        CGPoint tempCenter = self.btn3.center;
        
        tempCenter.y -= 70;
        
        self.btn3.center = tempCenter;
        
        CGAffineTransform transform = self.btn3.transform;
        //第二个值表示横向，第三个值表示纵向
        transform = CGAffineTransformScale(transform, 1.5,1.5);
        self.btn3.transform = transform;

        
        self.btn3.userInteractionEnabled = NO;
        
        self.img3.alpha += 1.0;
    }];

    
}

- (void)btn4Click {
    self.img1.alpha = 0;
    self.img2.alpha = 0;
    self.img3.alpha = 0;
    
    self.btn1.frame = CGRectMake(120, 200, 182, 100);
    self.btn2.frame = CGRectMake(120, 450, 152, 88);
    self.btn3.frame = CGRectMake(660, 220, 174, 90);
  
    
    self.view1.transform = CGAffineTransformIdentity;
    self.view2.transform = CGAffineTransformIdentity;
    self.view3.transform = CGAffineTransformIdentity;
    
    self.btn1.userInteractionEnabled = YES;
    self.btn2.userInteractionEnabled = YES;
    self.btn3.userInteractionEnabled = YES;
    
  
    self.view4.backgroundColor = COLOR(103, 172, 44, 1);
    
    self.view1.backgroundColor = COLOR(0, 245, 255, 1);
    self.view2.backgroundColor = COLOR(0, 245, 255, 1);
    self.view3.backgroundColor = COLOR(0, 245, 255, 1);
    self.line1.backgroundColor = COLOR(0, 245, 255, 1);
    self.line3.backgroundColor = COLOR(0, 245, 255, 1);
    
    [self.btn1 setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    [self.btn3 setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    [self.btn4 setImage:[UIImage imageNamed:@"4S"] forState:UIControlStateNormal];
    
    [self addAnimations2:self.view4 Time:2.0 Angle:20 Multiple:1.3];
    
    [self btnClickWithblock:^{
        CGPoint tempCenter = self.btn4.center;
        
        tempCenter.y += 70;
        
        self.btn4.center = tempCenter;
        
        CGAffineTransform transform = self.btn4.transform;
        //第二个值表示横向，第三个值表示纵向
        transform = CGAffineTransformScale(transform, 1.5,1.5);
        self.btn4.transform = transform;

        self.btn4.userInteractionEnabled = NO;
        
        self.img4.alpha += 1.0;
        
        
    }];

    
}

- (void)addBtn:(UIButton *)btn Frame:(CGRect)frame SEL:(SEL)sel Img:(NSString *)img {
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

//button移动
- (void)btnClickWithblock:(void(^)())block {
    
    //动画开头
    [UIView beginAnimations:nil context:nil];
    //动画执行时间
    [UIView setAnimationDuration:2.0];
    
    block();
    
    //动画尾部
    [UIView commitAnimations];
    
}

//旋转动画2
- (void)addAnimations2:(UIView *)view Time:(CGFloat)time Angle:(CGFloat)angle Multiple:(CGFloat)multiple {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:2.0]; //动画时长
    
    float centerX = view.bounds.size.width/2;
    float centerY = view.bounds.size.height/2;
    float x = view.bounds.size.width;
    float y = view.bounds.size.height/2;
    
    CGAffineTransform trans = GetCGAffineTransformRotateAroundPoint2(centerX,centerY ,x ,y ,angle/180.0*M_PI);
    view.transform = CGAffineTransformIdentity;
    view.transform = trans;
    
    CGAffineTransform transform = view.transform;
    //第二个值表示横向，第三个值表示纵向
    transform = CGAffineTransformScale(transform, 1,multiple);
    view.transform = transform;
    
    [UIView commitAnimations];
    
}

CGAffineTransform  GetCGAffineTransformRotateAroundPoint2(float centerX, float centerY ,float x ,float y ,float angle)
{
    x = x - centerX; //计算(x,y)从(0,0)为原点的坐标系变换到(CenterX ，CenterY)为原点的坐标系下的坐标
    y = y - centerY; //(0，0)坐标系的右横轴、下竖轴是正轴,(CenterX,CenterY)坐标系的正轴也一样
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(-x, -y);
    trans = CGAffineTransformRotate(trans,angle);
    trans = CGAffineTransformTranslate(trans,x, y);
    return trans;
}



//旋转动画1
- (void)addAnimations:(UIView *)view Time:(CGFloat)time Angle:(CGFloat)angle Multiple:(CGFloat)multiple {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:2.0]; //动画时长
    
    float centerX = view.bounds.size.width/2;
    float centerY = view.bounds.size.height/2;
    float x = view.bounds.size.width;
    float y = view.bounds.size.height/2;
    
    CGAffineTransform trans = GetCGAffineTransformRotateAroundPoint(centerX,centerY ,x ,y ,angle/180.0*M_PI);
    view.transform = CGAffineTransformIdentity;
    view.transform = trans;
    
    CGAffineTransform transform = view.transform;
    //第二个值表示横向，第三个值表示纵向
    transform = CGAffineTransformScale(transform, 1,multiple);
    view.transform = transform;
    
    [UIView commitAnimations];

}

CGAffineTransform  GetCGAffineTransformRotateAroundPoint(float centerX, float centerY ,float x ,float y ,float angle)
{
    x = x - centerX; //计算(x,y)从(0,0)为原点的坐标系变换到(CenterX ，CenterY)为原点的坐标系下的坐标
    y = y - centerY; //(0，0)坐标系的右横轴、下竖轴是正轴,(CenterX,CenterY)坐标系的正轴也一样
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x, y);
    trans = CGAffineTransformRotate(trans,angle);
    trans = CGAffineTransformTranslate(trans,-x, -y);
    return trans;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
