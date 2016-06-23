//
//  ZKUIView+Alert.h
//  lesson UIView
//
//  Created by ZK on 15/7/27.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 弹窗位置*/
typedef enum{
    TOP,                   //顶部
    CENTER,                //中心
    BELOW,                 //底部
}POSTION_TYPE;



@interface UIView (ZKFrame)
/** 属性*/
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat Y;
@property (nonatomic,assign)CGFloat X;
@property (nonatomic,assign)CGFloat X_width;        //返回视图的x坐标加上宽度;
@property (nonatomic,assign)CGFloat Y_height;       //返回视图的y坐标加上高度;


/**  提示,出现的位置 ,1.5s 消失   */
- (void)popMessageWithTitle:(NSString *)title postion:(POSTION_TYPE)postion;
/** 弹出菜单  */
- (void)popMenuWithTitles:(NSArray *)titles frame:(CGRect)frame taget:(id)taget action:(SEL)action;
/** 关闭菜单  */
-(void)disMissMenu;
/** 显示菊花  */
-(void)starLoadingOpenInteraction:(BOOL)action title:(NSString *)title;
/** 关闭菊花  */
-(void)endLoding;
/** 菊花状态 */
-(BOOL)isloading;
/** 顶部窗口  */
-(void)topWithTitle:(NSString *)title;

@end
