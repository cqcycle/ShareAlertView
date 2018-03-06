//
//  CycleAlertManager.h
//  ProjectAlertView
//
//  Created by zl on 2017/11/10.
//  Copyright © 2017年 zl. All rights reserved.
//  管理视图的弹出

#import <Foundation/Foundation.h>
#import "cycle_define.h"
typedef NS_ENUM(NSInteger,alertViewDirectionType){
    alertViewDirectionTypeBottom = 1,
    alertViewDirectionTypeCenter = 2
};

@interface CycleAlertManager : NSObject<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>
///初始化管理者
+(instancetype)sharedCycleAlertManager;
/** 是否隐藏背景 */
@property (nonatomic , assign) BOOL hideCoverView;
/** 背景View透明度 */
@property (nonatomic , assign) CGFloat coverViewAlpha;
/** 背景View背景色 */
@property (nonatomic) UIColor *coverViewBgColor;
/**  设置尺寸 */
@property (nonatomic) CGRect presentedFrame;
/** 方向 */
@property (nonatomic,assign) alertViewDirectionType AlertDirection;

/** coverView背景视图 */
@property (nonatomic , strong) UIView   *coverView;

@end
