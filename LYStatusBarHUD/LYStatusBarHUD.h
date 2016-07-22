//
//  LYStatusBarHUD.h

#import <UIKit/UIKit.h>

@interface LYStatusBarHUD : NSObject
/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)ly_showMessage:(NSString *)msg image:(UIImage *)image;
/**
 * 显示普通信息
 */
+ (void)ly_showMessage:(NSString *)msg;
/**
 * 显示成功信息
 */
+ (void)ly_showSuccess:(NSString *)msg;
/**
 * 显示失败信息
 */
+ (void)ly_showError:(NSString *)msg;
/**
 * 显示正在处理的信息
 */
+ (void)ly_showLoading:(NSString *)msg;
/**
 * 隐藏
 */
+ (void)ly_hide;

@end
