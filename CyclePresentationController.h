//
//  CyclePresentationController.h
//  ProjectAlertView
//
//  Created by zl on 2017/11/9.
//  Copyright © 2017年 zl. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void (void)
@interface CyclePresentationController : UIPresentationController
/** 是否隐藏背景 */
@property (nonatomic , assign) BOOL hideCoverView;
/** 背景View透明度 */
@property (nonatomic , assign) CGFloat coverViewAlpha;
/** 背景View背景色 */
@property (nonatomic) UIColor *coverViewBgColor;

/**  设置尺寸 */
@property (nonatomic) CGRect presentedFrame;

/** coverView背景视图 */
@property (nonatomic , strong) UIView   *coverView;

@end
