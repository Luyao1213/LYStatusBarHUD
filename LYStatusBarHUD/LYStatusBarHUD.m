//
//  LYStatusBarHUD.m

//

#import "LYStatusBarHUD.h"
#define LYMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const LYMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const LYAnimationDuration = 0.25;
@implementation LYStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;


/**
 * 显示窗口
 */
+ (void)showWindow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:LYAnimationDuration animations:^{
        window_.frame = frame;
    }];
}


/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)ly_showMessage:(NSString *)msg image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = LYMessageFont;
    if (image) { // 如果有图片，设置文字和图片的间距
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:LYMessageDuration target:self selector:@selector(ly_hide) userInfo:nil repeats:NO];

}
/**
 * 显示普通信息
 */
+ (void)ly_showMessage:(NSString *)msg
{
    [self ly_showMessage:msg image:nil];

}
/**
 * 显示成功信息
 */
+ (void)ly_showSuccess:(NSString *)msg
{
    [self ly_showMessage:msg image:[UIImage imageNamed:@"LYStatusBarHUD.bundle/success"]];
}
/**
 * 显示失败信息
 */
+ (void)ly_showError:(NSString *)msg
{

    [self ly_showMessage:msg image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/error"]];
}
/**
 * 显示正在处理的信息
 */
+ (void)ly_showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = LYMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : LYMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}
/**
 * 隐藏
 */
+ (void)ly_hide
{
    [UIView animateWithDuration:LYAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];

}
@end
