//
//  ZKUIView+Alert.m
//  lesson UIView
//
//  Created by ZK on 15/7/27.
//  Copyright (c) 2015年 ZK. All rights reserved.
//  0.0.0

#define DisPlayTime  1.5       //弹窗显示存在时间

#import "ZKUIView+Alert.h"


@implementation UIView (ZKFrame)

- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)Y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)Y{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}
-(CGFloat)X{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)X{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}
-(CGFloat)X_width{
    return self.X + self.width;
}
-(void)setX_width:(CGFloat)X_width{
}
-(CGFloat)Y_height{
    return self.Y + self.height;
}
-(void)setY_height:(CGFloat)Y_height{
}

-(void)setIsloading:(BOOL)isloading{
}

#pragma mark - 提示部分
- (void)popMessageWithTitle:(NSString *)title postion:(POSTION_TYPE)postion;{
    
    CGFloat messageY;
    switch (postion) {
        case TOP:
            messageY = 100;
            break;
        case CENTER:
            messageY = self.window.height/2-12.5;
            break;
        case BELOW:
            messageY = self.window.height-100;
            break;
        default:
            break;
    }
    [[self viewWithTag:90009000909] removeFromSuperview];
    UILabel *messageLable = [[UILabel alloc] initWithFrame:CGRectMake(10, messageY, self.window.width, 0)];
    [messageLable setShadowColor:[UIColor lightGrayColor]];
    [messageLable setShadowOffset:CGSizeMake(0.5, 0.5)];
    messageLable.tag = 90009000909;
    messageLable.text = [NSString stringWithFormat:@"%@  ",title];
    messageLable.backgroundColor = [UIColor blackColor];
    messageLable.textColor = [UIColor whiteColor];
    messageLable.textAlignment = NSTextAlignmentCenter;
    messageLable.layer.cornerRadius = 8;
    messageLable.layer.masksToBounds = YES;
    messageLable.numberOfLines = 0;
    messageLable.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self.window addSubview:messageLable];
    [messageLable sizeToFit];
    messageLable.frame = CGRectMake(self.window.center.x-messageLable.width/2, messageLable.Y, messageLable.width, messageLable.height);
    [UIView animateWithDuration:0.15 animations:^{
        messageLable.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            messageLable.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
    [self hiddenMessage:messageLable];
}

- (CGFloat)ZKreturnStringHeight:(NSString *)string Wdth:(CGFloat)Wdth Font:(int)font{
    CGRect frame = [string boundingRectWithSize:CGSizeMake(Wdth, 10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:font <= 0 ? 17 : font] forKey:NSFontAttributeName] context:nil];
    return frame.size.height;
}
- (void)hiddenMessage:(UILabel *)messageLable{
    __block UILabel *label = messageLable;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DisPlayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.05 animations:^{
            label.transform = CGAffineTransformMakeScale(0.5, 0.5);
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
            label = nil;
        }];
    });
}

#pragma mark - 菜单部分
/** 弹窗菜单  */
- (void)popMenuWithTitles:(NSArray *)titles frame:(CGRect)frame taget:(id)taget action:(SEL)action{
    if (![self.window viewWithTag:18181818]) {
        NSLog(@"添加");
        UIView *backView = [[UIView alloc] initWithFrame:frame];
        backView.tag = 18181818;
        backView.layer.masksToBounds = YES;
        backView.layer.cornerRadius = 3;
        [self.window addSubview:backView];
        backView.transform = CGAffineTransformMakeScale(0, 0.4);
        CGFloat height = frame.size.height/(titles.count+1);
        for (int i = 0; i < titles.count+1; i++) {
            UIButton *temp = [UIButton buttonWithType:(UIButtonTypeCustom)];
            if (i<titles.count) {
                [temp setTitle:titles[i] forState:(UIControlStateNormal)];
                [temp addTarget:taget action:action forControlEvents:(UIControlEventTouchUpInside)];
                UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, height-1, frame.size.width, 0.5)];
                sep.backgroundColor = [UIColor grayColor];
                [temp addSubview:sep];
            }else{
                [temp setTitle:@"❌" forState:(UIControlStateNormal)];
                [temp addTarget:self action:@selector(disMissMenu) forControlEvents:(UIControlEventTouchUpInside)];
            }
            temp.frame = CGRectMake(0, i*height, frame.size.width, height);
            temp.backgroundColor = [UIColor whiteColor];
            temp.tag = i+1;
            [temp setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            [temp setTitleColor:[UIColor grayColor] forState:(UIControlStateHighlighted)];
            [backView addSubview:temp];
        }
        [UIView animateWithDuration:0.2 animations:^{
            backView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
}
-(void)disMissMenu{
    __block  UIView *view = [self.window viewWithTag:18181818];
    [UIView animateWithDuration:0.1 animations:^{
        view.transform = CGAffineTransformMakeScale(1, 0.1);
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        view = nil;
    }];
}
/** 显示菊花  */
-(void)starLoadingOpenInteraction:(BOOL)action title:(NSString *)title{
    //不允许交互

        if (![self viewWithTag:900000000009]) {
          UIView *placeholder = [[UIView alloc] initWithFrame:self.frame];
            placeholder.backgroundColor = [UIColor blackColor];
            placeholder.alpha = 0;
          placeholder.tag = 900000000009;
            if (action) {
                placeholder.userInteractionEnabled = NO;
            }
            [self addSubview:placeholder];
            [UIView animateWithDuration:0.3 animations:^{
                placeholder.alpha = 0.3;
            }];

        }
    UILabel *titleLable;
    if (![self viewWithTag:9091949010]) {
        UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(self.width/2-40, self.height/2-40, 80, 80))];
        view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
        view.layer.cornerRadius = 10;
        view.tag = 9091949010;

        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
        activity.frame = CGRectMake(0, 0, view.width, view.height);
        [view addSubview:activity];
        [activity startAnimating];
        titleLable = [[UILabel alloc] initWithFrame:(CGRectMake(0, view.height-20, view.width, 20))];
        titleLable.textColor = [UIColor whiteColor];
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.font = [UIFont systemFontOfSize:15];
        [view addSubview:titleLable];
        view.alpha = 0.1;
        view.transform = CGAffineTransformMakeScale(1.5, 1.5);
        [self addSubview:view];
        [UIView animateWithDuration:0.3 animations:^{
            view.transform = CGAffineTransformMakeScale(1, 1);
            view.alpha = 0.8;
        } completion:^(BOOL finished) {
        }];
    }
        titleLable.text = title;

}


/** 关闭菊花  */
-(void)endLoding{
    UIView *placeholder = [self.window viewWithTag:900000000009];
    UIView *flowe = [self.window viewWithTag:9091949010];
    [UIView animateWithDuration:0.3 animations:^{
        flowe.alpha = 0.1;
        placeholder.alpha = 0;
        flowe.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        for (UIView *view in flowe.subviews) {
            [view removeFromSuperview];
        }
        [flowe removeFromSuperview];

        [placeholder removeFromSuperview];
    
    }];
}
/** 菊花状态 */
- (BOOL)isloading{
    if ([self viewWithTag:9091949010]) {
        return YES;
    }else{
        return NO;
    }
}
/** 顶部窗口  */
-(void)topWithTitle:(NSString *)title{
    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, -64,[UIScreen mainScreen].bounds.size.width, 64))];
    view.backgroundColor = [UIColor blackColor];
    UILabel *lable = [[UILabel alloc] initWithFrame:(CGRectMake(10, 17, view.width-20, 30))];
    lable.text = [NSString stringWithFormat:@"❗️%@",title];
    lable.textColor = [UIColor whiteColor];
    [view addSubview:lable];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.numberOfLines = 0;
    [self.window addSubview:view];
    [UIView animateWithDuration:0.3 animations:^{
        [view setY:-3];
    }completion:^(BOOL finished) {
        [self removeTip:view];
    }];

}
- (void)removeTip:(UIView *)view{
    __block UIView *viewss = view;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^{
            [viewss setY:-64];
        }completion:^(BOOL finished) {
            [viewss removeFromSuperview];
            viewss = nil;
        }];

    });
}



@end
