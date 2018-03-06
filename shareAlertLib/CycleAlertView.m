//
//  CycleAlertView.m
//  ProjectAlertView
//
//  Created by zl on 2017/11/10.
//  Copyright © 2017年 zl. All rights reserved.
//

#import "CycleAlertView.h"
#import "CycleAlertManager.h"
#import "CyclePresentationConst.h"
#import "cycle_define.h"
static CGFloat const NoAttentionTitleViewConstrant = 74.0;
static CGFloat const HaveAttentionTitleViewConstrant = 100.0;

@interface CycleAlertView()

/** 管理者 */
@property (nonatomic , strong) CycleAlertManager *_Nullable alertManager;

@end

@implementation CycleAlertView
/**  懒加载  */
- (CycleAlertManager *)alertManager {
    if (!_alertManager) {
        _alertManager = [CycleAlertManager sharedCycleAlertManager];

    }
    return _alertManager;
}
- (void)setAlertManager{
    //隐藏背景
    self.alertManager.hideCoverView = NO;
    //背景View颜色
    self.alertManager.coverViewBgColor = [UIColor whiteColor];
    //透明度
    self.alertManager.coverViewAlpha   = 0.2;
    //隐藏背景
    self.alertManager.hideCoverView = NO;
    ///弹出方向
    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
}
/** 初始化*/
+ (instancetype)sharedCycleAlertView{
    static CycleAlertView *alertV = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertV = [[CycleAlertView alloc]init];
    });
    return alertV;
}


/** 1.1 添加提示语，标题  */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithTopTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle  resultBlock:(void(^)(selectType type))result{
    
    
    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    //判断是否含有提示语
    if (!flg) {
        topTitle = @"";
        centerVC.titleLayoutConstrant = HaveAttentionTitleViewConstrant;
    }else{
        centerVC.titleLayoutConstrant = NoAttentionTitleViewConstrant;
    }
    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideUpdateBtn = YES;
    centerVC.titleView.hidden = NO;
    centerVC.scrollView.hidden = YES;
    
    __weak typeof(centerVC) centVC = centerVC;
    //选择了
    centerVC.cancelBlock = ^(selectType type){
      
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    centerVC.sureBlock = ^(selectType type){
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.Title = alertTitle;
    
    centerVC.cancelbtnName = cancelName;
    centerVC.cancelbtnFont = cancelFontSize;
    centerVC.cancelbtnColor = cancelFontColor;
    
    centerVC.surebtnName = sureName;
    centerVC.surebtnFont = sureFontSize;
    centerVC.surebtnColor = sureFontColor;
    
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentedY, presented_W, presented_H);
//    self.alertManager.presentedFrame = CGRectMake(0, screen_height-presented_H, screen_width, presented_H);
    //隐藏背景
    self.alertManager.hideCoverView = NO;
    //背景View颜色
    self.alertManager.coverViewBgColor = [UIColor blackColor];
    //透明度
    self.alertManager.coverViewAlpha   = 0.4;
    //隐藏背景
    self.alertManager.hideCoverView = NO;
    ///弹出方向
    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    ///设置bgView
    [self setAlertManager];
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
    
    

}
/** 1.2 添加提示语，标题(标准版，弹出框提示用户,可修改 提示label，标题label颜色字体内容) */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithTopTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont resultBlock:(void(^)(selectType type))result{
    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    //判断是否含有提示语
    if (!flg) {
        topTitle = @"";
        centerVC.titleLayoutConstrant = HaveAttentionTitleViewConstrant;
    }else{
        centerVC.titleLayoutConstrant = NoAttentionTitleViewConstrant;
    }
    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideUpdateBtn = YES;
    centerVC.titleView.hidden = NO;
    centerVC.scrollView.hidden = YES;
    __weak typeof(centerVC) centVC = centerVC;
    //选择了
    centerVC.cancelBlock = ^(selectType type){
        
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    centerVC.sureBlock = ^(selectType type){
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.AttentionTextColor = topColor;
    centerVC.AttentionTitleTextFont = topFont;
    
    centerVC.Title = alertTitle;
    centerVC.AttentionTitleTextColor = AlertColor;
    centerVC.AttentionTitleTextFont = AlertFont;
    
    centerVC.cancelbtnName = cancelName;
    centerVC.cancelbtnFont = cancelFontSize;
    centerVC.cancelbtnColor = cancelFontColor;
    
    centerVC.surebtnName = sureName;
    centerVC.surebtnFont = sureFontSize;
    centerVC.surebtnColor = sureFontColor;
    
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentedY, presented_W, presented_H);
    //隐藏背景
//    self.alertManager.hideCoverView = YES;
//    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    ///设置bgView
    [self setAlertManager];
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
    
    
    
}
/** 1.3 添加提示语，标题(标准版，可修改(取消，确定按钮，提示label,标题label,)颜色字体内容，全改) */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithTopTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont cancelButtonName:(NSString *)cancelBtnName cancelButtonColor:(UIColor *)cancelBtnColor cancelButtonFont:(UIFont *)cancelButtonFont sureButtonName:(NSString *)sureBtnName sureButtonColor:(UIColor *)sureBtnColor sureButtonFont:(UIFont *)sureButtonFont resultBlock:(void(^)(selectType type))result{
    
    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    //判断是否含有提示语
    if (!flg) {
        topTitle = @"";
        centerVC.titleLayoutConstrant = HaveAttentionTitleViewConstrant;
    }else{
        centerVC.titleLayoutConstrant = NoAttentionTitleViewConstrant;
    }
    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideUpdateBtn = YES;
    centerVC.titleView.hidden = NO;
    centerVC.scrollView.hidden = YES;
    __weak typeof(centerVC) centVC = centerVC;
    //选择了
    centerVC.cancelBlock = ^(selectType type){
        
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    centerVC.sureBlock = ^(selectType type){
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.AttentionTextColor = topColor;
    centerVC.AttentionTextFont = topFont;
    
    centerVC.Title = alertTitle;
    centerVC.AttentionTitleTextColor = AlertColor;
    centerVC.AttentionTitleTextFont = AlertFont;
    
    centerVC.cancelbtnName = cancelBtnName;
    centerVC.cancelbtnFont = cancelButtonFont;
    centerVC.cancelbtnColor = cancelBtnColor;
    
    centerVC.surebtnName = sureBtnName;
    centerVC.surebtnFont = sureButtonFont;
    centerVC.surebtnColor = sureBtnColor;
    
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentedY, presented_W, presented_H);
//    //隐藏背景
//    self.alertManager.hideCoverView = YES;
//    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    ///设置bgView
    [self setAlertManager];
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
    
    
    
    
    
    
    
    
    
}
/** 2.1 按钮名字可以修改 (不可修改字体大小颜色等属性)*/
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle andBtnName:(NSString *)btnName  resultBlock:(void(^)(NSInteger i))result{

    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    //判断是否含有提示语
    if (!flg) {
        topTitle = @"";
        centerVC.titleLayoutConstrant = HaveAttentionTitleViewConstrant;
    }else{
        centerVC.titleLayoutConstrant = NoAttentionTitleViewConstrant;
    }
    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideBottomView = YES;
    centerVC.titleView.hidden = NO;
    centerVC.scrollView.hidden = YES;
    //选择了
    __weak typeof(centerVC) centVC = centerVC;
    centerVC.updateBlock = ^{
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(0);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.Title = alertTitle;
    centerVC.bnName = btnName;
    centerVC.btnTextColor = [UIColor colorWithRed:255/255.0 green:80/255.0 blue:88/255.0 alpha:1.0];
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentedY, presented_W, presented_H);
    //隐藏背景
//    self.alertManager.hideCoverView = YES;
//    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    ///设置bgView
    [self setAlertManager];
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
}

/**2.2 按钮名字可以修改 (可修改字体大小颜色等属性)*/
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle andBtnName:(NSString *)btnName btnTextColor:(UIColor *)textColor btnTextFont:(UIFont *)textFont resultBlock:(void(^)(NSInteger i))result{

    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    //判断是否含有提示语
    if (!flg) {
        topTitle = @"";
        centerVC.titleLayoutConstrant = HaveAttentionTitleViewConstrant;
    }else{
        centerVC.titleLayoutConstrant = NoAttentionTitleViewConstrant;
    }
    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideBottomView = YES;
    centerVC.titleView.hidden = NO;
    centerVC.scrollView.hidden = YES;
    //选择了
     __weak typeof(centerVC) centVC = centerVC;
    centerVC.updateBlock = ^{
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(0);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.Title = alertTitle;
    centerVC.bnName = btnName;
    centerVC.btnTextColor = textColor;
    centerVC.btnTextFont  = textFont;
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentedY, presented_W, presented_H);
    //隐藏背景
//    self.alertManager.hideCoverView = YES;
//    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    ///设置bgView
    [self setAlertManager];
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
}


/** 2.3 按钮名字可以修改 ,全改(可修改字体大小颜色等属性，一个按钮) */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)AlertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont andBtnName:(NSString *)btnName btnTextColor:(UIColor *)textColor btnTextFont:(UIFont *)textFont resultBlock:(void(^)(NSInteger i))result{
    
    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    //判断是否含有提示语
    if (!flg) {
        topTitle = @"";
        centerVC.titleLayoutConstrant = HaveAttentionTitleViewConstrant;
    }else{
        centerVC.titleLayoutConstrant = NoAttentionTitleViewConstrant;
    }
    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideBottomView = YES;
    centerVC.titleView.hidden = NO;
    centerVC.scrollView.hidden = YES;
    
    
    __weak typeof(centerVC) centVC = centerVC;
    //选择了
    centerVC.updateBlock = ^{
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(0);
    };
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.AttentionTextColor = topColor;
    centerVC.AttentionTextFont = topFont;
    
    centerVC.Title = AlertTitle;
    centerVC.AttentionTitleTextColor = AlertColor;
    centerVC.AttentionTitleTextFont = AlertFont;
    
    centerVC.bnName = btnName;
    centerVC.btnTextColor = textColor;
    centerVC.btnTextFont  = textFont;
    
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentedY, presented_W, presented_H);
    //隐藏背景
//    self.alertManager.hideCoverView = YES;
//    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    ///设置bgView
    [self setAlertManager];
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
    
    
}

/** 3.1 可用于协议 文字过长可以修改 文本框尺寸，内容可以滑动*/
- (void)cycle_alertViewWithProtocolHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle andBtnName:(NSString *)btnName btnTextColor:(UIColor *)textColor btnTextFont:(UIFont *)textFont  resultBlock:(void(^)(NSInteger i))result{
    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];

    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideBottomView = YES;
    centerVC.titleView.hidden = YES;
    centerVC.scrollView.hidden = NO;
    //选择了
    __weak typeof(centerVC) centVC = centerVC;
    centerVC.updateBlock = ^{
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(0);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.scrollLabel = alertTitle;
    centerVC.bnName = btnName;
    centerVC.btnTextColor = textColor;
    centerVC.btnTextFont = textFont;
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    //设置大小
    CGFloat titleHeight = [self getContentHeight:alertTitle fontSize:17.0].height;
    CGFloat maxH = 0;
    if (titleHeight>protocol_maxHeight) {
        maxH = protocol_maxHeight;
    }else{
        maxH = titleHeight;
    }
    CGFloat presentY = (screen_height-(presented_H+maxH-scroll_height))*0.5;
    CGFloat presentH = presented_H+maxH-scroll_height;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentY, presented_W, presentH);
    ///设置bgView
    [self setAlertManager];
    //隐藏背景
//    self.alertManager.hideCoverView = YES;
    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    NSLog(@"%f",titleHeight);
//    centerVC.scrollView.contentSize = CGSizeMake(250, titleHeight+2000);
    centerVC.scrollConstrantHeight = titleHeight;
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
}

/** 3.2 可用于协议 内容可以滑动,可以修改按钮文字颜色尺寸，同时可以修改标题“颜色尺寸”，提示语“文字尺寸” */
- (void)cycle_alertViewWithProtocolHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont  andBtnName:(NSString *)btnName btnTextColor:(UIColor *)btnColor btnTextFont:(UIFont *)btnFont  resultBlock:(void(^)(NSInteger i))result{
 
    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    
    //2.隐藏第二种情况(可修改按钮文字)
    centerVC.hideBottomView = YES;
    centerVC.titleView.hidden = YES;
    centerVC.scrollView.hidden = NO;
    //选择了
    __weak typeof(centerVC) centVC = centerVC;
    centerVC.updateBlock = ^{
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(0);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.AttentionTextColor = topColor;
    centerVC.AttentionTextFont = topFont;
    
    centerVC.scrollLabel = alertTitle;
    centerVC.scrollTitleTextColor = AlertColor;
    centerVC.scrollTitleTextFont = AlertFont;
    
    centerVC.bnName = btnName;
    centerVC.btnTextColor = btnColor;
    centerVC.btnTextFont = btnFont;
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    //设置大小
    NSLog(@"%f",AlertFont.pointSize);
    CGFloat titleHeight = [self getContentHeight:alertTitle fontSize:AlertFont.pointSize].height;
    CGFloat maxH = 0;
    if (titleHeight>protocol_maxHeight) {
        maxH = protocol_maxHeight;
    }else{
        maxH = titleHeight;
    }
    CGFloat presentY = (screen_height-(presented_H+maxH-scroll_height))*0.5;
    CGFloat presentH = presented_H+maxH-scroll_height;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentY, presented_W, presentH);
    ///设置bgView
    [self setAlertManager];
    //隐藏背景
//    self.alertManager.hideCoverView = YES;
    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    NSLog(@"%f",titleHeight);
//    centerVC.scrollView.contentSize = CGSizeMake(250, titleHeight);
    centerVC.scrollConstrantHeight = titleHeight;
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
}

/**  3.3 可用于协议 内容可以滑动,可以修改按钮文字颜色尺寸，同时可以修改标题“颜色尺寸”，提示语“文字尺寸”，2个按钮 */
- (void)cycle_alertViewWithProtocolHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont   cancelButtonName:(NSString *)cancelBtnName cancelButtonColor:(UIColor *)cancelBtnColor cancelButtonFont:(UIFont *)cancelButtonFont sureButtonName:(NSString *)sureBtnName sureButtonColor:(UIColor *)sureBtnColor sureButFont:(UIFont *)sureButFont  resultBlock:(void(^)(selectType type))result{
    //1.初始化
    CycleAlertViewController *centerVC = [[CycleAlertViewController alloc]init];
    
    //2.隐藏第二种情况(可修改按钮文字)
//    centerVC.hideBottomView = NO;
//    centerVC.titleView.hidden = YES;
//    centerVC.scrollView.hidden = NO;
    centerVC.hideUpdateBtn = YES;
    centerVC.titleView.hidden = YES;
    centerVC.scrollView.hidden = NO;
    //选择了
    __weak typeof(centerVC) centVC = centerVC;
    //选择了
    centerVC.cancelBlock = ^(selectType type){
        
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    centerVC.sureBlock = ^(selectType type){
        [centVC dismissViewControllerAnimated:YES completion:nil];
        result(type);
    };
    
    
    //设置内容
    centerVC.topTitle = topTitle;
    centerVC.AttentionTextColor = topColor;
    centerVC.AttentionTextFont = topFont;
    
    centerVC.scrollLabel = alertTitle;
    centerVC.scrollTitleTextColor = AlertColor;
    centerVC.scrollTitleTextFont = AlertFont;
    
    centerVC.cancelbtnName = cancelBtnName;
    centerVC.cancelbtnFont = cancelButtonFont;
    centerVC.cancelbtnColor = cancelBtnColor;
    
    centerVC.surebtnName = sureBtnName;
    centerVC.surebtnFont = sureButFont;
    centerVC.surebtnColor = sureBtnColor;
    
    //设置转场代理
    centerVC.transitioningDelegate = self.alertManager;
    //设置大小
    NSLog(@"%f",AlertFont.pointSize);
    CGFloat titleHeight = [self getContentHeight:alertTitle fontSize:AlertFont.pointSize].height;
    CGFloat maxH = 0;
    if (titleHeight>protocol_maxHeight) {
        maxH = protocol_maxHeight;
    }else{
        maxH = titleHeight;
    }
    CGFloat presentY = (screen_height-(presented_H+maxH-scroll_height))*0.5;
    CGFloat presentH = presented_H+maxH-scroll_height;
    self.alertManager.presentedFrame = CGRectMake(presentedX, presentY, presented_W, presentH);
    
    ///设置bgView
    [self setAlertManager];
    //隐藏背景
//    self.alertManager.hideCoverView = YES;
    ///弹出方向
//    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    NSLog(@"%f",titleHeight);
    //    centerVC.scrollView.contentSize = CGSizeMake(250, titleHeight);
    centerVC.scrollConstrantHeight = titleHeight;
    //设置modal形式（custom弹出底部不会被遮挡）
    centerVC.modalPresentationStyle = UIModalPresentationCustom;
    //弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:centerVC animated:YES completion:nil];
    
    
}




///计算文字高度
- (CGSize)getContentHeight:(NSString *)content fontSize:(CGFloat)font{
    
    return [content boundingRectWithSize:CGSizeMake(presented_W-2*scroll_margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size;
}



@end
