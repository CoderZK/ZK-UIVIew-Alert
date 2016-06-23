# ZK-UIVIew-Alert
是一个非常好用的UIView的类目的框架 用于提醒框
### --- 自定义菜单位置(枚举) --- ### \n
- (IBAction)show:(id)sender {
[self.view popMessageWithTitle:@"nimei" postion:TOP];
}
### --- 自定义提醒 (多个) --- ###
- (IBAction)showForYou:(id)sender {
NSArray * arr = @[@"确定",@"取消"];
[self.view popMenuWithTitles:arr frame:CGRectMake(200, 100, 100, 50) taget:self action:@selector(pop)];
}
### --- 显示菊花 (主要用于下载,缓存) --- ###
- (IBAction)showFlos:(id)sender {
[self.view starLoadingOpenInteraction:NO title:@"是的"];
}
### --- 在状态栏显示警告 --- ###
- (IBAction)top:(id)sender {
[self.view topWithTitle:@"hehe"];
}