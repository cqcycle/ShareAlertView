//
//  CycleAlertView.h
//  ProjectAlertView
//
//  Created by zl on 2017/11/10.
//  Copyright © 2017年 zl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleAlertViewController.h"
@interface CycleAlertView : UIView

/** 初始化*/
+ (instancetype)sharedCycleAlertView;

/** 1.1 添加提示语，标题(标准版，只用于弹出框提示用户)
 *  @param flg 是否有顶部提示label
 *  @param topTitle 顶部提示语
 *  @param alertTitle 内容
 *  @param result 选择“确定”还是“取消”按钮的回调
 */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithTopTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle  resultBlock:(void(^)(selectType type))result;
/** 1.2 添加提示语，标题(标准版，弹出框提示用户,可修改 提示label，标题label颜色字体内容)
 *  @param topTitle 顶部提示语
 *  @param topColor 顶部提示语颜色
 *  @param topFont 顶部提示语字体大小
 *  @param alertTitle 内容
 *  @param AlertColor 内容颜色
 *  @param AlertFont 内容字体大小
 *  @param result 选择“确定”还是“取消”按钮的回调
 */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithTopTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont resultBlock:(void(^)(selectType type))result;


/** 1.3 添加提示语，标题(标准版，可修改(取消，确定按钮，提示label,标题label,)颜色字体内容，全改)
 *  @param topTitle 顶部提示语
 *  @param topColor 顶部提示语颜色
 *  @param topFont 顶部提示语字体大小
 *  @param alertTitle 内容
 *  @param AlertColor 内容颜色
 *  @param AlertFont 内容字体大小
 *  @param cancelBtnName “取消按钮名称”
 *  @param cancelBtnColor 取消按钮字体颜色
 *  @param cancelButtonFont 取消按钮字体大小
 *  @param sureBtnName 确定按钮名称
 *  @param sureBtnColor 取消按钮字体颜色
 *  @param sureButtonFont 取消按钮字体大小
 *  @param result 选择“确定”还是“取消”按钮的回调
 */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithTopTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont cancelButtonName:(NSString *)cancelBtnName cancelButtonColor:(UIColor *)cancelBtnColor cancelButtonFont:(UIFont *)cancelButtonFont sureButtonName:(NSString *)sureBtnName sureButtonColor:(UIColor *)sureBtnColor sureButtonFont:(UIFont *)sureButtonFont resultBlock:(void(^)(selectType type))result;

/** 2.1 按钮名字可以修改 (不可修改字体大小颜色等属性)
 *  @param flg 是否有顶部提示label
 *  @param topTitle 顶部提示语
 *  @param alertTitle 内容
 *  @param btnName 按钮内容
 *  @param result 回调
 */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle andBtnName:(NSString *)btnName  resultBlock:(void(^)(NSInteger i))result;



/** 2.2 按钮名字可以修改 (可修改字体大小颜色等属性)
 *  @param flg 是否有顶部提示label
 *  @param topTitle 顶部提示语
 *  @param alertTitle 内容
 *  @param btnName 按钮内容
 *  @param textColor 按钮颜色
 *  @param textFont 按钮尺寸
 *  @param result 回调
 */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle andBtnName:(NSString *)btnName btnTextColor:(UIColor *)textColor btnTextFont:(UIFont *)textFont resultBlock:(void(^)(NSInteger i))result;


/** 2.3 按钮名字可以修改 ,全改(可修改字体大小颜色等属性，一个按钮)
 *  @param flg 是否有顶部提示label
 *  @param topTitle 顶部提示语
 *  @param topColor 顶部提示语颜色
 *  @param topFont 顶部提示语字体大小
 *  @param AlertTitle 内容
 *  @param AlertColor 内容颜色
 *  @param AlertFont 内容字体大小
 *  @param btnName 按钮内容
 *  @param textColor 按钮颜色
 *  @param textFont 按钮尺寸
 *  @param result 回调
 */
- (void)cycle_alertViewHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)AlertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont andBtnName:(NSString *)btnName btnTextColor:(UIColor *)textColor btnTextFont:(UIFont *)textFont resultBlock:(void(^)(NSInteger i))result;





/** 3.1 可用于协议 内容可以滑动,可以修改按钮文字颜色尺寸
 *  @param flg 是否有顶部提示label
 *  @param topTitle 顶部提示语
 *  @param alertTitle 内容
 *  @param btnName 按钮内容
 *  @param textColor 按钮颜色
 *  @param textFont 按钮尺寸
 *  @param result 回调
 */
- (void)cycle_alertViewWithProtocolHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle andAlertTitle:(NSString *)alertTitle andBtnName:(NSString *)btnName btnTextColor:(UIColor *)textColor btnTextFont:(UIFont *)textFont  resultBlock:(void(^)(NSInteger i))result;

/** 3.2 可用于协议 内容可以滑动,可以修改“按钮，协议，标题 颜色尺寸内容”全部改
 *  @param flg 是否有顶部提示label
 *  @param topTitle 顶部提示语
 *  @param topColor 顶部提示语颜色
 *  @param topFont 顶部提示语字体大小
 *  @param alertTitle 内容
 *  @param AlertColor 内容颜色
 *  @param AlertFont 内容字体大小
 *  @param btnName 按钮内容
 *  @param btnColor 按钮颜色
 *  @param btnFont 按钮尺寸
 *  @param result 回调
 */
- (void)cycle_alertViewWithProtocolHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont  andBtnName:(NSString *)btnName btnTextColor:(UIColor *)btnColor btnTextFont:(UIFont *)btnFont  resultBlock:(void(^)(NSInteger i))result;


/** 3.3 可用于协议 内容可以滑动,可以修改按钮文字颜色尺寸，同时可以修改标题“颜色尺寸”，提示语“文字尺寸”，2个按钮
 *  @param flg 是否 显示 顶部提示label
 *  @param topTitle 顶部提示语
 *  @param topColor 顶部提示语颜色
 *  @param topFont 顶部提示语字体大小
 *  @param alertTitle 内容
 *  @param AlertColor 内容颜色
 *  @param AlertFont 内容字体大小
 *  @param cancelBtnName “取消按钮名称”
 *  @param cancelBtnColor 取消按钮字体颜色
 *  @param cancelButtonFont 取消按钮字体大小
 *  @param sureBtnName 确定按钮名称
 *  @param sureBtnColor 取消按钮字体颜色
 *  @param sureButFont 取消按钮字体大小
 *  @param result 回调
 */
- (void)cycle_alertViewWithProtocolHaveTopTitle:(BOOL)flg WithToTitle:(NSString *)topTitle topTextColor:(UIColor *)topColor topTextFont:(UIFont *)topFont andAlertTitle:(NSString *)alertTitle AlertTextColor:(UIColor *)AlertColor AlertTextFont:(UIFont *)AlertFont   cancelButtonName:(NSString *)cancelBtnName cancelButtonColor:(UIColor *)cancelBtnColor cancelButtonFont:(UIFont *)cancelButtonFont sureButtonName:(NSString *)sureBtnName sureButtonColor:(UIColor *)sureBtnColor sureButFont:(UIFont *)sureButFont  resultBlock:(void(^)(selectType type))result;















@end
