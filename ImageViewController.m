//
//  ImageViewController.m
//  6.8.ui.class
//
//  Created by rimi on 15/6/8.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (nonatomic, strong) UIImageView       *imageView;
@end

@implementation ImageViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    //等比例缩放
//    self.imageview.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:self.imageview];
//    
//#pragma mark - UIImageView动画设置
//    //获取图书数组
//    NSMutableArray *dataSource = [NSMutableArray array];
//    for (int i = 0 ; i <= 137 ; i ++) {
//        // 获取图片名字
//        NSString *name = [NSString stringWithFormat:@"%d.png",i];
//        //获取图片
//        UIImage *image = [UIImage imageNamed:name];
//        //添加到数组
//        [dataSource addObject:image];
//    }
//    //进行关联
//    self.imageview.animationImages = dataSource;
//    //2, 设置时长
//    self.imageview.animationDuration = 3;
//    //3, 设置重复次数(0代表无穷)
//    self.imageview.animationRepeatCount = 0;
//    //4,开启动画
//    [self.imageview startAnimating];
//}
    - (void)viewDidLoad {
        [super viewDidLoad];
        //view默认是透明，设置成白色，返回时就不会看见其他有色控件
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        //等比例缩放
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:self.imageView];
        
        
        
#pragma mark - UIImageView动画设置
        //1.设置图片数组
        NSMutableArray *dataSource = [NSMutableArray array];
        for (int i = 0; i <= 137; i++) {
            //获取图片名字
            NSString *name = [NSString stringWithFormat:@"%d.png", i];
            //获取图片
            UIImage *image = [UIImage imageNamed:name];
            //添加到数组
            [dataSource addObject:image];
        }
        
        //进行关联
        self.imageView.animationImages = dataSource;
        //2.设置时长
        self.imageView.animationDuration = 3;
        //3.设置重复次数(0代表无穷)
        self.imageView.animationRepeatCount = 0;
        //开始动画
        [self.imageView startAnimating];
        
        
    }


//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
