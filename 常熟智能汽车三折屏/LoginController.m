//
//  LoginController.m
//  常熟智能汽车三折屏
//
//  Created by 尤超 on 2017/5/8.
//  Copyright © 2017年 尤超. All rights reserved.
//

#import "LoginController.h"
#import "ViewController.h"
#import "GCDAsyncSocket.h"

@interface LoginController ()<GCDAsyncSocketDelegate>

//客户端socket
@property(nonatomic)GCDAsyncSocket*clinetSocket;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *back = [[UIImageView alloc] init];
    back.frame = self.view.frame;
    back.image = [UIImage imageNamed:@"new_feature_4"];
    [self.view addSubview:back];
    
    
    //开始
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateHighlighted];
    CGRect startRect = CGRectZero;
    startRect.size = startBtn.currentBackgroundImage.size;
    startBtn.frame = startRect;
    
    CGPoint startCenter = startBtn.center;
    startCenter.x = self.view.frame.size.width*0.5;
    startCenter.y = self.view.frame.size.height * 0.75;
    startBtn.center = startCenter;
    [startBtn setTitle:nil forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];

    //初始化scoket
    self.clinetSocket= [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    [self connectAction];
}

- (void)startClick {
    ViewController *VC = [[ViewController alloc] init];
    [self presentViewController:VC animated:YES completion:nil];
    
    [self sendMessageAction];
}

#pragma mark - GCDAsynSocket Delegate

//连接
- (void)connectAction {
    
    //连接服务器
    
    [self.clinetSocket connectToHost:@"192.168.1.34" onPort:9999 withTimeout:-1 error:nil];
    
}

//开始
- (void)sendMessageAction {
    
    NSDictionary *dic = @{@"videoFile":@"旋转地台视频",
                          @"voice":@"30",
                          @"type":@"bf",
                          @"no":@"192.168.1.34"};
    
    
    NSLog(@"dic~~~~~~~~%@",dic);
    
    
    NSData *data =  [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];

    
    //withTimeout -1 :无穷大
    
    //tag：消息标记
    
    [self.clinetSocket writeData:data withTimeout:-1 tag:0];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
