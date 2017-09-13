//
//  YCNewFeatureController.m
//  9.23.1微博框架
//
//  Created by brother on 15/10/6.
//  Copyright © 2015年 brother. All rights reserved.
//

#import "YCNewFeatureController.h"

#import "YCTabBarController.h"

#define YCNewFeatureCount 4

@interface YCNewFeatureController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation YCNewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scrollView.frame = self.view.bounds;
    
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
    CGFloat scrollW = scrollView.frame.size.width;
    
    CGFloat scrollH = scrollView.frame.size.height;
    
    for (int i = 0; i < YCNewFeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        CGFloat imageViewX = i * scrollW;
        CGFloat imageViewY = 0;
        CGFloat imageViewW = scrollW;
        CGFloat imageViewH = scrollH;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        NSString *name = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        // 如果是最后一个imageView，就往里面添加其他内容
        if (i == YCNewFeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    scrollView.contentSize = CGSizeMake(YCNewFeatureCount * scrollW, 0);
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    // PageControl 进行数据分页
    
    UIPageControl *pageController = [[UIPageControl alloc] init];
    pageController.numberOfPages = YCNewFeatureCount;
    pageController.backgroundColor = [UIColor redColor];
    pageController.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageController.pageIndicatorTintColor = [UIColor grayColor];
    CGPoint center = CGPointZero;
    center.x = scrollW * 0.5;
    center.y = scrollH - 50;
    //    pageController.userInteractionEnabled = NO;
    pageController.bounds = CGRectZero;
    pageController.backgroundColor = [UIColor redColor];
    pageController.center = center;
    [self.view addSubview:pageController];
    self.pageControl = pageController;
    // Do any additional setup after loading the view.
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    double page = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 1.5 + 0.5  => 2
    // 1.1 + 0.5  => 1
    // 1.6 + 0.5  => 2
    self.pageControl.currentPage = (int)(page + 0.5);
}

- (void)setupLastImageView:(UIImageView *)imageView {
    // 开启交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.分享给大家（checkbox）
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    CGRect shareRect = CGRectZero;
    shareRect.size = CGSizeMake(250, 30);
    shareBtn.frame = shareRect;
    
    CGPoint shareBtnCenter = CGPointZero;
    shareBtnCenter.x = imageView.frame.size.width * 0.5;
    shareBtnCenter.y = imageView.frame.size.height * 0.65;
    shareBtn.center = shareBtnCenter;
    
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];

    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    
    // 2.开始微博
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    CGRect startRect = CGRectZero;
    startRect.size = startBtn.currentBackgroundImage.size;
    startBtn.frame = startRect;
    
    CGPoint startCenter = startBtn.center;
    startCenter.x = shareBtn.center.x;
    startCenter.y = imageView.frame.size.height * 0.75;
    startBtn.center = startCenter;
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];

}

- (void)shareClick:(UIButton *)shareBtn {
    // 状态取反
    shareBtn.selected = !shareBtn.isSelected;
}

- (void)startClick {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    window.rootViewController = [[YCTabBarController alloc] init];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
