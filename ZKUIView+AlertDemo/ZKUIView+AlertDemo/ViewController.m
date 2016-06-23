//
//  ViewController.m
//  ZKUIView+AlertDemo
//
//  Created by ZK on 16/6/23.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ViewController.h"
#import "ZKUIView+Alert.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
/** 自定义菜单位置(枚举)*/
- (IBAction)show:(id)sender {
        [self.view popMessageWithTitle:@"nimei" postion:TOP];
    }
/** 自定义提醒 (用两个) */
- (IBAction)showForYou:(id)sender {
    NSArray * arr = @[@"确定",@"取消"];
    [self.view popMenuWithTitles:arr frame:CGRectMake(200, 100, 100, 50) taget:self action:@selector(pop)];
    }
    
//显示菊花 (主要用于下载)
- (IBAction)showFlos:(id)sender {
    [self.view starLoadingOpenInteraction:NO title:@"是的"];
    }
    
//显示在状态栏的警告
- (IBAction)top:(id)sender {
    [self.view topWithTitle:@"hehe"];
    }
    
- (void)pop {
        
        NSLog(@"失败");
    }

    


@end
