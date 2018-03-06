//
//  CycleAlertViewController.h
//  ProjectAlertView
//
//  Created by zl on 2017/11/10.
//  Copyright © 2017年 zl. All rights reserved.
//

#import <UIKit/UIKit.h>


//1.“取消” 和 “确认” 按钮
typedef NS_ENUM(NSInteger,selectType){
    selectTypeCancel = 0,
    selectTypeOK     = 1
};
typedef void(^cancelBlock)(selectType type);
typedef void(^sureBlock)(selectType type);

//2."按钮名字可修改"
typedef void(^updateBtnBlock)();



@interface CycleAlertViewController : UIViewController

/** 提示语 */
@property (nonatomic , copy) NSString *topTitle;
/** 标题 */
@property (nonatomic , copy) NSString *Title;

/** 按钮名字(单个按钮),我知道啦  */
@property (nonatomic , copy) NSString *bnName;
/** 按钮颜色(单个按钮)  */
@property (nonatomic) UIColor *btnTextColor;
/** 按钮字体大小(单个按钮)  */
@property (nonatomic) UIFont *btnTextFont;

/** 取消按钮  */
@property (nonatomic , copy) NSString *cancelbtnName;
/** 取消按钮  */
@property (nonatomic) UIColor *cancelbtnColor;
/** 取消按钮  */
@property (nonatomic) UIFont *cancelbtnFont;

/** 确定按钮  */
@property (nonatomic , copy) NSString *surebtnName;
/** 确定按钮 */
@property (nonatomic) UIColor *surebtnColor;
/** 确定按钮  */
@property (nonatomic) UIFont *surebtnFont;


/**  标准版处标题颜色  */
@property (nonatomic) UIColor *AttentionTitleTextColor;
/**  标准版处标题字体  */
@property (nonatomic) UIFont *AttentionTitleTextFont;



/**  隐藏底部View */
@property (nonatomic , assign) BOOL hideBottomView;
/**   隐藏 “可修改” 按钮 */
@property (nonatomic , assign) BOOL hideUpdateBtn;
/** 没有提示语的时候修改约束*/
@property (nonatomic, assign) CGFloat titleLayoutConstrant;

@property (weak, nonatomic) IBOutlet UIView *titleView;

///有滚动的协议框
/**  滚动标题 */
@property (nonatomic , copy) NSString *scrollLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentConstrant;
/**  滚动View的高度约束  */
@property (nonatomic , assign) CGFloat scrollConstrantHeight;
/** 提示语颜色  */
@property (nonatomic) UIColor *AttentionTextColor;
/** 提示语字体  */
@property (nonatomic) UIFont *AttentionTextFont;
/** 标题颜色  */
@property (nonatomic) UIColor *scrollTitleTextColor;
/** 标题字体  */
@property (nonatomic) UIFont *scrollTitleTextFont;





/** 定义取消的Block */
@property (nonatomic , copy) cancelBlock cancelBlock;
/** 定义取消的Block */
@property (nonatomic , copy) sureBlock sureBlock;
/** "按钮名字可修改" */
@property (nonatomic , copy) updateBtnBlock updateBlock;








@end
