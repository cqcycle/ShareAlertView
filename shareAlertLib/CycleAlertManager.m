//
//  CycleAlertManager.m
//  ProjectAlertView
//
//  Created by zl on 2017/11/10.
//  Copyright © 2017年 zl. All rights reserved.
//

#import "CycleAlertManager.h"
#import "CyclePresentationController.h"
#import "cycle_define.h"
@interface CycleAlertManager()
/** flg */
@property (nonatomic , assign) BOOL presenting;

@end
@implementation CycleAlertManager
///初始化管理者
+(instancetype)sharedCycleAlertManager{
    static CycleAlertManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CycleAlertManager alloc]init];
    });
    return manager;
}
#pragma mark --- <AlertViewControllerDelegate>
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0){
    CyclePresentationController *presentedView = [[CyclePresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    ///默认值
    if(!self.AlertDirection){
        self.AlertDirection = alertViewDirectionTypeCenter;
    }
    if (self.coverViewBgColor == nil) {
        self.coverViewBgColor = [UIColor blackColor];
    }
    if (self.coverViewAlpha <= 0.0) {
        self.coverViewAlpha = 0.4;
    }
    
    
    presentedView.presentedFrame = self.presentedFrame;
    presentedView.hideCoverView  = self.hideCoverView;
    presentedView.coverViewBgColor = self.coverViewBgColor;
    presentedView.coverViewAlpha = self.coverViewAlpha;
    presentedView.coverView = self.coverView;
    return presentedView;
}
//隐藏
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.presenting = NO;
    return self;
}
//显示
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.presenting = YES;
    return self;
}
#pragma mark --- <UIViewControllerContextTransitioning>
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext     {
    
    // NSLog(@"%@",transitionContext);
    //1.获取弹出框和消失框
    UIView *vTo = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *vFrom = [transitionContext viewForKey:UITransitionContextFromViewKey];

    
    if (self.presenting) {
        //2.1 添加到ContainerView上
        [transitionContext.containerView addSubview:vTo];
        [transitionContext.containerView addSubview:vFrom];
        if (self.AlertDirection == alertViewDirectionTypeCenter) {
            //2.2 设置弹出框弹出的缩放比例
            vTo.transform = CGAffineTransformMakeScale(0.5, 0.5);
        }else if (self.AlertDirection == alertViewDirectionTypeBottom){
            
            vTo.transform = CGAffineTransformMakeTranslation(0, self.presentedFrame.origin.y);
        }else{
            //2.2 设置弹出框弹出的缩放比例
            vTo.transform = CGAffineTransformMakeScale(0.5, 0.5);
        }
        
        
        //可以设置毛点
        //        vTo.layer.anchorPoint = CGPointMake(0.0, 0.5);
        //2.3 设置动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            vTo.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        
        //        vFrom.frame = CGRectMake(0, 0, 100, 100);
        //        vTo.frame = CGRectMake(100, 100, 100, 100);
        
        //        //2.1 添加到ContainerView上
        //        [transitionContext.containerView addSubview:vTo];
        //        [transitionContext.containerView addSubview:vFrom];
        //2.2 设置弹出框弹出的缩放比例
        //         vFrom.transform = CGAffineTransformMakeScale(1.0, 1.0);
        //        //可以设置毛点
        //         vTo.layer.anchorPoint = CGPointMake(0.5, 0.5);
        if (self.AlertDirection == alertViewDirectionTypeCenter) {
            //2.2 设置弹出框弹出的缩放比例
            //2.3 设置动画
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                vFrom.transform = CGAffineTransformMakeScale(0.000000001,0.000000001);
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    [vFrom removeFromSuperview];
                } completion:^(BOOL finished) {
                    [transitionContext completeTransition:YES];
                }];
                
            }];
        }else if (self.AlertDirection == alertViewDirectionTypeBottom){
            //2.3 设置动画
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
               
                vFrom.transform = CGAffineTransformMakeTranslation(0,self.presentedFrame.origin.y+self.presentedFrame.size.height);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    [vFrom removeFromSuperview];
                } completion:^(BOOL finished) {
                    [transitionContext completeTransition:YES];
                }];
                
            }];
        }else{
            //2.2 设置弹出框弹出的缩放比例
            //2.3 设置动画
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                vFrom.transform = CGAffineTransformMakeScale(0.000000001,0.000000001);
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    [vFrom removeFromSuperview];
                } completion:^(BOOL finished) {
                    [transitionContext completeTransition:YES];
                }];
                
            }];
        }
        
    }
}
@end
