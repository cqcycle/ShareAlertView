//
//  CycleAlertViewController.m
//  ProjectAlertView
//
//  Created by zl on 2017/11/10.
//  Copyright © 2017年 zl. All rights reserved.
//

#import "CycleAlertViewController.h"
#import "CyclePresentationConst.h"
#import "cycle_define.h"
@interface CycleAlertViewController ()

///提示语
@property (weak, nonatomic) IBOutlet UILabel *lblAttention;
///标题
@property (weak, nonatomic) IBOutlet UILabel *lblAttentionTitle;
///取消
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
///确定
@property (weak, nonatomic) IBOutlet UIButton *sureButton;


///（第一种）底部（取消／确认 按钮的View）
@property (weak, nonatomic) IBOutlet UIView *bottomView;

///(第二种情况，我知道啦按钮（可改文字）)
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UIView *updateBottomView;

/** 没有提示语的时候修改约束*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleViewLayoutConstrant;
///第三种滚动协议
@property (weak, nonatomic) IBOutlet UILabel *lblScrollContent;

//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollConstrantHeight;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainConstrant;



@end

@implementation CycleAlertViewController
#pragma mark -- 系统函数
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 6.0;
    self.view.layer.masksToBounds = YES;
    
    self.view.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.view.layer.borderWidth = 2.0;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //初始化
    self.lblScrollContent.font = [UIFont systemFontOfSize:17.0];
    
    //初始化
    [self.cancelButton setTitleColor:[UIColor colorWithRed:255/255.0 green:80/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.sureButton setTitleColor:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1.0] forState:UIControlStateNormal];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置不同情况下title的约束
    self.titleViewLayoutConstrant.constant = self.titleLayoutConstrant;
    //可滚动
    self.scrollView.userInteractionEnabled = YES;
    NSLog(@"%f",self.scrollConstrantHeight);
    self.scrollContentConstrant.constant = self.scrollConstrantHeight;
}
//-(void)setTitleViewLayoutConstrant:(NSLayoutConstraint *)titleViewLayoutConstrant{
//    self.titleViewLayoutConstrant.constant = self.titleLayoutConstrant;
//}
///**   标题约束  */
//-(void)setTitleLayoutConstrant:(CGFloat)titleLayoutConstrant{
//    _titleLayoutConstrant = titleLayoutConstrant;
//
//    [self setup:titleLayoutConstrant];
//}
//- (void)setup:(CGFloat)x{
//    self.titleViewLayoutConstrant.constant = x;
//}
/**  修改内容 */
/// 取消按钮
-(void)setCancelButton:(UIButton *)cancelButton{
    [cancelButton setTitle:self.cancelbtnName forState:UIControlStateNormal];
    [cancelButton setTitleColor:self.cancelbtnColor forState:UIControlStateNormal];
    cancelButton.titleLabel.font = self.cancelbtnFont;
}
-(void)setCancelbtnName:(NSString *)cancelbtnName{
    _cancelbtnName = cancelbtnName;
    if (cancelbtnName.length) {
        [self setCancelButton:self.cancelButton];
    }
}
-(void)setCancelbtnColor:(UIColor *)cancelbtnColor{
    _cancelbtnColor = cancelbtnColor;
    if (cancelbtnColor) {
         [self setCancelButton:self.cancelButton];
    }
    
}
-(void)setCancelbtnFont:(UIFont *)cancelbtnFont{
    _cancelbtnFont = cancelbtnFont;
    if (_cancelbtnFont) {
        [self setCancelButton:self.cancelButton];
    }
}
///确定按钮
-(void)setSureButton:(UIButton *)sureButton{
    [sureButton setTitle:self.surebtnName forState:UIControlStateNormal];
    [sureButton setTitleColor:self.surebtnColor forState:UIControlStateNormal];
    sureButton.titleLabel.font = self.surebtnFont;
}
-(void)setSurebtnName:(NSString *)surebtnName{
    _surebtnName = surebtnName;
    if (surebtnName.length) {
        [self setSureButton:self.sureButton];
    }
}
-(void)setSurebtnColor:(UIColor *)surebtnColor{
    _surebtnColor = surebtnColor;
    if (surebtnColor) {
        [self setSureButton:self.sureButton];
    }
}
-(void)setSurebtnFont:(UIFont *)surebtnFont{
    _surebtnFont = surebtnFont;
    if (surebtnFont) {
        [self setSureButton:self.sureButton];
    }
}






///提示语
-(void)setLblAttention:(UILabel *)lblAttention{
    lblAttention.text = self.topTitle;
    lblAttention.textColor = self.AttentionTextColor;
    lblAttention.font = self.AttentionTextFont;
}
-(void)setAttentionTextColor:(UIColor *)AttentionTextColor{
    _AttentionTextColor = AttentionTextColor;
    [self setLblAttention:self.lblAttention];
}
-(void)setAttentionTextFont:(UIFont *)AttentionTextFont{
    _AttentionTextFont = AttentionTextFont;
    [self setLblAttention:self.lblAttention];
}
-(void)setTopTitle:(NSString *)topTitle{
    _topTitle = topTitle;
//    self.lblAttention.text = topTitle;
    [self setLblAttention:self.lblAttention];
}



//标准版的title
-(void)setLblAttentionTitle:(UILabel *)lblAttentionTitle{
    lblAttentionTitle.text = self.Title;
    lblAttentionTitle.font = self.AttentionTitleTextFont;
    lblAttentionTitle.textColor = self.AttentionTitleTextColor;
}
-(void)setAttentionTitleTextColor:(UIColor *)AttentionTitleTextColor{
    _AttentionTitleTextColor = AttentionTitleTextColor;
    //    self.lblAttentionTitle.textColor = AttentionTitleTextColor;
}
-(void)setAttentionTitleTextFont:(UIFont *)AttentionTitleTextFont{
    _AttentionTitleTextFont = AttentionTitleTextFont;
    //    self.lblAttentionTitle.font = AttentionTitleTextFont;
}
-(void)setTitle:(NSString *)Title{
    _Title = Title;
    [self setLblAttention:self.lblAttention];
    //    self.lblAttentionTitle.text = Title;
}


//单个按钮属性设置
-(void)setBnName:(NSString *)bnName{
    _bnName = bnName;
    [self setUpdateButton:self.updateButton];
}
-(void)setBtnTextFont:(UIFont *)btnTextFont{
    _btnTextFont = btnTextFont;
    [self setUpdateButton:self.updateButton];
}
-(void)setBtnTextColor:(UIColor *)btnTextColor{
    _btnTextColor = btnTextColor;
    [self setUpdateButton:self.updateButton];
}
-(void)setUpdateButton:(UIButton *)updateButton{
    [updateButton setTitle:self.bnName forState:UIControlStateNormal];
    [updateButton setTitleColor:self.btnTextColor forState:UIControlStateNormal];
     updateButton.titleLabel.font = self.btnTextFont;
}

///计算文字高度
- (CGSize)getContentHeight:(NSString *)content{
    
    return [content boundingRectWithSize:CGSizeMake(presented_W-2*scroll_margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:scroll_label_fontSize]} context:nil].size;
}


///状态
-(void)setBottomView:(UIView *)bottomView{
    bottomView.hidden = self.hideBottomView;
    
}
-(void)setUpdateBottomView:(UIView *)updateBottomView{
    updateBottomView.hidden = self.hideUpdateBtn;
    
}
-(void)setHideBottomView:(BOOL)hideBottomView{
    _hideBottomView = hideBottomView;
    [self setBottomView:self.bottomView];
}
-(void)setHideUpdateBtn:(BOOL)hideUpdateBtn{
    _hideUpdateBtn = hideUpdateBtn;
    [self setUpdateBottomView:self.updateBottomView];
}

/** /修改内容 */

///（第一种）底部（取消／确认 按钮的View）
//取消
- (IBAction)ClickCancel:(id)sender {
    
    //    [self dismissViewControllerAnimated:YES completion:nil];
    !self.cancelBlock ?: self.cancelBlock(selectTypeCancel);
    
}
///确定
- (IBAction)ClickSure:(UIButton *)sender {
    
    //    NSLog(@"sure");
    !self.sureBlock ?: self.sureBlock(selectTypeOK);
    
}


///(第二种情况，我知道啦按钮（可改文字）)
- (IBAction)updateBtnClick:(UIButton *)sender {
    
    !self.updateBlock ?: self.updateBlock();
    
}

///第三种 用户注册协议
///滚动label
-(void)setLblScrollContent:(UILabel *)lblScrollContent{
    lblScrollContent.text = self.scrollLabel;
    lblScrollContent.textColor = self.scrollTitleTextColor;
//    NSLog(@"%f",self.AttentionTextFont.pointSize);
    lblScrollContent.font = self.scrollTitleTextFont;
}
-(void)setScrollLabel:(NSString *)scrollLabel{
    _scrollLabel = scrollLabel;
    [self setLblScrollContent:self.lblScrollContent];
}
-(void)setScrollTitleTextFont:(UIFont *)scrollTitleTextFont{
    _scrollTitleTextFont = scrollTitleTextFont;
    [self setLblScrollContent:self.lblScrollContent];
}
-(void)setScrollTitleTextColor:(UIColor *)scrollTitleTextColor{
    _scrollTitleTextColor = scrollTitleTextColor;
    [self setLblScrollContent:self.lblScrollContent];
}














//
/////隐藏bottomView
//- (void)hideBottomView:(BOOL)flg{
//    self.bottomView.hidden = flg;
//}
/////隐藏 “可修改” 按钮
//- (void)hideUpdateBtn:(BOOL)flg{
//    self.updateButton.hidden = flg;
//}
//





@end
