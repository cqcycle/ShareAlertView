
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger , btnState){
    btnStateNormal = 0,
    btnStateHighted = 1
};


//弹出视图的尺寸
UIKIT_EXTERN const CGFloat  presented_W;
UIKIT_EXTERN const CGFloat  presented_H;

//滚动视图左右间距
UIKIT_EXTERN const CGFloat  scroll_margin;
//滚动label 的字体大小
UIKIT_EXTERN const CGFloat  scroll_label_fontSize;
///滚动视图高度
UIKIT_EXTERN const CGFloat  scroll_height;

//协议允许的最大高度
#define protocol_maxHeight screen_height * 0.6
//"确定" 和 "取消" 按钮默认内容 字体大小 字体颜色
#define cancelName @"取消"
#define sureName @"确定"
#define cancelFontSize [UIFont systemFontOfSize:16.0]
#define sureFontSize [UIFont systemFontOfSize:16.0]
#define cancelFontColor [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1.0]
#define sureFontColor [UIColor colorWithRed:255/255.0 green:80/255.0 blue:88/255.0 alpha:1.0]
//弹出视图的X,Y值
#define presentedX (screen_width-presented_W)*0.5
#define presentedY (screen_height-presented_H)*0.5


