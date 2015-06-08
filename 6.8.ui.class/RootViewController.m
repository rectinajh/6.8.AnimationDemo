//
//  ViewController.m
//  6.8.ui.class
//
//  Created by rimi on 15/6/8.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "RootViewController.h"
#import "imageViewController.h"


@interface RootViewController ()

- (void)initializeUserface;

- (void)handleButtonEvent:(UIButton *)sender;

- (void)handleBarButtonEvent:(id)sender;

//- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeUserface];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initializeUserface
{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Animation";
    
    UIButton *botton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    botton.backgroundColor = [UIColor blackColor];
    
    [botton addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:botton];
    
    //创建nextItem
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(handleBarButtonEvent:)];
    
    self.navigationItem.rightBarButtonItem = nextItem;
    

}

- (void)handleBarButtonEvent:(id)sender
{
    ImageViewController *imageVC = [[ImageViewController alloc]init];
    [self.navigationController pushViewController:imageVC animated:YES];

}

- (void)handleButtonEvent:(UIButton *)sender
{
#pragma mark - 普通方式
    /*//  配置开始标识
    [UIView beginAnimations:@"position" context:nil];
    //  配置动画时长
    [UIView setAnimationDuration:3];
    //  动画延时
    [UIView setAnimationDelay:0];
    //  配置动画线性规律
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    // 设置代理,获取回调，结束的时候捕获
    [UIView setAnimationDelegate:self];
    // 设置已经结束方法名
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    //  动画逻辑
    sender.center = self.view.center;
    //  提交结束
    [UIView commitAnimations];*/
#pragma mark - 动画代码块
    // 参数1：动画执行时间
    // 参数2：动画逻辑
    // 参数3：动画执行参数
    // 参数4：执行动画逻辑
    // 参数5：动画完成回调block
    
    [UIView animateWithDuration:1 animations:^{
        sender.center = self.view.center;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear |UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
            
            //放大逻辑
            sender.transform = CGAffineTransformMakeScale(2, 2);
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1 animations:^{
                
                //颜色改变
                sender.backgroundColor = [UIColor blueColor];
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:1 animations:^{
                    
                    //旋转（角度会对360求余）
                    sender.transform = CGAffineTransformRotate(sender.transform, M_PI);
                    sender.transform = CGAffineTransformRotate(sender.transform, M_PI);
                    
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                        
                        //还原所有transform
                        sender.transform = CGAffineTransformIdentity;
                    } completion:Nil];
                    
                    //转场动画
                    // 参数1：指定视图
                    // 参数2：动画时长
                    // 参数3：动画选项
                    // 参数4：动画逻辑
                    // 参数5：动画完成回调
                    [UIView transitionWithView:sender duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                        //还原所有的transform
                        sender.transform = CGAffineTransformIdentity;
                        sender.backgroundColor = [UIColor blueColor];
                    } completion:nil];
                    
                }];
            }];
        }];
    }];

}

//- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
//{
//    NSLog(@"animation = %@,%@,%@",animationID,finished,context);
//    
//    if ([animationID isEqualToString:@"position"]) {
//        //位移动画执行完毕
//        //指向方法的指针-》SEL
//        
//        
//    }
//
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
