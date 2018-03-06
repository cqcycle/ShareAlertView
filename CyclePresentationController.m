//
//  CyclePresentationController.m
//  ProjectAlertView
//
//  Created by zl on 2017/11/9.
//  Copyright © 2017年 zl. All rights reserved.
//

#import "CyclePresentationController.h"
#import "cycle_define.h"


@interface CyclePresentationController()
/** coverView背景视图 */
//@property (nonatomic , strong) UIView   *coverView;
@end

@implementation CyclePresentationController


/**  懒加载“背景视图”  */
- (UIView *)coverView {
    
    if (!_coverView) {

        _coverView = [UIView new];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.4;
        _coverView.userInteractionEnabled = YES;
        _coverView.frame = self.containerView.bounds;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Click)];
        [_coverView addGestureRecognizer:tap];

    }
    ///是否隐藏背景
    _coverView.hidden = self.hideCoverView;
    ///背景色，透明度
    _coverView.backgroundColor = self.coverViewBgColor;
    _coverView.alpha = self.coverViewAlpha;
    
    return _coverView;
}
///控制背景视图的显示和隐藏
//-(void)setCoverView:(UIView *)coverView{
//    coverView.hidden = self.hideCoverView;
//}
//-(void)setHideCoverView:(BOOL)hideCoverView{
//    _hideCoverView = hideCoverView;
//    self.coverView.hidden = hideCoverView;
////    NSLog(@"%zd",hideCoverView);
//}

-(void)containerViewWillLayoutSubviews{
    [super containerViewWillLayoutSubviews];

//    NSLog(@"%f  %f  %f  %f",X,Y,presented_W,presented_H);
    ///设置弹出视图的尺寸
    self.presentedView.frame = self.presentedFrame;
    
//    self.presentedView.frame = CGRectMake(100   , 100, 200, 200);
    ///背景视图
    [self.containerView addSubview:self.coverView];
    [self.containerView insertSubview:self.coverView atIndex:0];
   

}
- (void)Click{
//    NSLog(@"tap...");
    //[self presentview];
    [self.coverView removeFromSuperview];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"you tap me,and i have successed hide the coverView");
    }];
    
}














@end
