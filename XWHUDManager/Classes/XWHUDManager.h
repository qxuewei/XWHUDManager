//
//  XWHUDManager.h
//  MBProgressHUD
//
//  Created by 邱学伟 on 2018/8/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Timer
@interface NSTimer (XWHUD)
/**
 弱引用Timer - 自动释放

 @param timeInterval 间隔时间
 @param block 操作, 注意需要弱引用当前控制器
 @param repeats 是否重复
 @return 弱引用Timer
 */
+ (NSTimer *)xw_timerTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(void))block repeats:(BOOL)repeats;
@end

@interface XWHUDManager : NSObject

#pragma mark - 隐藏HUD
/**
 隐藏蒙版 (KeyWindow和当前控制器视图)
 */
+ (void)hide;

/**
 隐藏当前View上的蒙版
 */
+ (void)hideInView;

/**
 隐藏当前KeyWindow上的蒙版
 */
+ (void)hideInWindow;

/**
 延时隐藏蒙版((KeyWindow和当前控制器视图))
 
 @param delaySeconds 延时消失时间
 */
+ (void)hideDelay:(NSTimeInterval)delaySeconds;

#pragma mark - 小菊花

/**
 在KeyWindow展示一个小菊花 - 不自动消失
 */
+ (void)showHUD;

/**
 在KeyWindow展示一个小菊花 (延时 afterSecond 秒 结束)
 
 @param afterSecond 延时消失时间
 */
+ (void)showHUDAfterDelay:(NSTimeInterval)afterSecond;

/**
 在当前View展示一个小菊花 - 不自动消失
 */
+ (void)showHUDInView;

/**
 在KeyWindow展示一个 loading... 小菊花
 */
+ (void)showHUDLoadingEN;

/**
 在KeyWindow展示一个 加载中... 小菊花
 */
+ (void)showHUDLoadingCH;

/**
 在KeyWindow展示一个有文本小菊花 - 不自动消失
 
 @param message 提示语
 */
+ (void)showHUDMessage:(NSString *)message;

/**
 限时隐藏在KeyWindow展示一个 loading... 小菊花
 
 @param afterSecond 延时消失时间
 */
+ (void)showHUDLoadingAfterDelay:(NSTimeInterval)afterSecond;

/**
 限时隐藏在KeyWindow展示一个有文本小菊花
 
 @param message 提示语
 @param afterSecond 延时消失时间
 */
+ (void)showHUDMessage:(NSString *)message afterDelay:(NSTimeInterval)afterSecond;

/**
 限时隐藏在view展示一个有文本小菊花
 
 @param message 提示语
 @param afterSecond 延时消失时间
 */
+ (void)showHUDMessageInView:(NSString *)message afterDelay:(NSTimeInterval)afterSecond;

#pragma mark - 文本提示框

/**
 在KeyWindow上显示文本提示框 - 1秒后消失
 
 @param message 提示语
 */
+ (void)showTipHUD:(NSString *)message;

/**
 在当前视图上显示文本提示框 - 1秒后消失
 
 @param message 提示语
 */
+ (void)showTipHUDInView:(NSString *)message;


/**
 在KeyWindow上显示文本提示框 - 1秒后消失
 
 @param message 提示语
 @param isLineFeed 是否自动换行
 */
+ (void)showTipHUD:(NSString *)message isLineFeed:(BOOL)isLineFeed;

/**
 在当前视图上显示文本提示框 - 1秒后消失
 
 @param message 提示语
 @param isLineFeed 是否自动换行
 */
+ (void)showTipHUDInView:(NSString *)message isLineFeed:(BOOL)isLineFeed;

/**
 限时隐藏在KeyWindow展示一个有文本提示框
 
 @param message 提示语
 @param isLineFeed 是否自动换行
 @param afterSecond 延时消失时间
 */
+ (void)showTipHUD:(NSString *)message isLineFeed:(BOOL)isLineFeed afterDelay:(NSTimeInterval)afterSecond;

/**
 限时隐藏在view展示一个有文本提示框
 
 @param message 提示语
 @param isLineFeed 是否自动换行
 @param afterSecond 延时消失时间
 */
+ (void)showTipHUDInView:(NSString *)message isLineFeed:(BOOL)isLineFeed afterDelay:(NSTimeInterval)afterSecond;

/**
 在 KeyWindow 上展示自定义提示语 - 1秒后移除

 @param message 提示语
 @param isLineFeed 是否自动换行
 @param backgroundColor 背景色
 @param textColor 文本色
 @param textFont 字体
 @param margin 边框间距
 @param offset 距离中心点偏移
 @param isWindow 是否在 window 展示
 */
+ (void)showCustomTipHUD:(NSString *)message isLineFeed:(BOOL)isLineFeed backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont margin:(CGFloat)margin offset:(CGPoint)offset isWindow:(BOOL)isWindow;

#pragma mark - 提示图片
/**
 在 KeyWindow 展示 成功提示,默认成功图片在 XWHUDImages.bundle 中, - 1秒消失
 */
+ (void)showSuccessHUD;

/**
 在 KeyWindow 展示 有文本的成功提示,默认成功图片在 XWHUDImages.bundle 中, - 1秒消失
 
 @param message 提示语
 */
+ (void)showSuccessTipHUD:(NSString *)message;

/**
 在 View 展示 成功提示,默认成功图片在 XWHUDImages.bundle 中, - 1秒消失
 */
+ (void)showSuccessTipHUDInView:(NSString *)message;

/**
 在 KeyWindow 展示 失败提示,默认失败图片在 XWHUDImages.bundle 中, - 1秒消失
 */
+ (void)showErrorHUD;

/**
 在 KeyWindow 展示 有文本的失败提示,默认失败图片在 XWHUDImages.bundle 中, - 1秒消失
 
 @param message 提示语
 */
+ (void)showErrorTipHUD:(NSString *)message;

/**
 在view有文本失败提示 - 1秒消失
 
 @param message 提示语
 */
+ (void)showErrorTipHUDInView:(NSString *)message;

/**
 在 KeyWindow 展示 信息提示,默认信息图片在 XWHUDImages.bundle 中, - 1秒消失
 
 @param message 提示语
 */
+ (void)showInfoTipHUD:(NSString *)message;

/**
 在 view 展示 信息提示,默认信息图片在 XWHUDImages.bundle 中, - 1秒消失
 
 @param message 提示语
 */
+ (void)showInfoTipHUDInView:(NSString *)message;

/**
 在 KeyWindow 展示 警告提示,默认警告图片在 XWHUDImages.bundle 中, - 1秒消失
 
 @param message 提示语
 */
+ (void)showWarningTipHUD:(NSString *)message;

/**
 在 View 展示 警告提示,默认警告图片在 XWHUDImages.bundle 中, - 1秒消失
 
 @param message 提示语
 */
+ (void)showWarningTipHUDInView:(NSString *)message;

#pragma mark - 自定义图片+提示语(图片需要导入 'XWHUDImages.bundle' 包中)
/**
 在 KeyWindow 展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中
 
 @param iconName 图片名
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showCustomIconHUD:(NSString *)iconName message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 View 展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中
 
 @param iconName 图片名
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showCustomIconHUDInView:(NSString *)iconName message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 KeyWindow 展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中 - 不自动移除
 
 @param iconName 图片名
 @param message 提示语
 */
+ (void)showCustomIconHUD:(NSString *)iconName message:(NSString *)message;

/**
 在 View 展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中 - 不自动移除
 
 @param iconName 图片名
 @param message 提示语
 */
+ (void)showCustomIconHUDInView:(NSString *)iconName message:(NSString *)message;

#pragma mark - 自定义图片+提示语(图片外界传入)
/**
 在 KeyWindow 展示自定义图片 - 图片外界传入
 
 @param image 图片
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showCustomImageHUD:(UIImage *)image message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 view 展示自定义图片 - 图片外界传入
 
 @param image 图片
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showCustomImageHUDInView:(UIImage *)image message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 KeyWindow 展示自定义图片 - 图片外界传入  - 不自动移除
 
 @param image 图片
 @param message 提示语
 */
+ (void)showCustomImageHUD:(UIImage *)image message:(NSString *)message;

/**
 在 View 展示自定义图片 - 图片外界传入  - 不自动移除
 
 @param image 图片
 @param message 提示语
 */
+ (void)showCustomImageHUDInView:(UIImage *)image message:(NSString *)message;

#pragma mark - 提示序列帧图片
/**
 在 KeyWindow 展示自定义序列帧图片 - 图片数组外界传入
 
 @param images 序列帧
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showCustomImagesHUD:(NSArray <UIImage *> *)images message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 view 展示自定义序列帧图片 - 图片数组外界传入
 
 @param images 序列帧
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showCustomImagesHUDInView:(NSArray <UIImage *> *)images message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 KeyWindow 展示自定义序列帧图片 - 图片数组外界传入 - 不自动移除
 
 @param images 序列帧
 @param message 提示语
 */
+ (void)showCustomImagesHUD:(NSArray <UIImage *> *)images message:(NSString *)message;

/**
 在 View 展示自定义序列帧图片 - 图片数组外界传入 - 不自动移除
 
 @param images 序列帧
 @param message 提示语
 */
+ (void)showCustomImagesHUDInView:(NSArray <UIImage *> *)images message:(NSString *)message;

#pragma mark - 提示GIF图片 (传入Gif 文件名)
/**
 在 KeyWindow 展示自定义GIF图片 - 传入Gif 文件名
 
 @param gifFileName Gif 文件名
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showGifImagesHUD:(NSString *)gifFileName message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 View 展示自定义GIF图片 - 传入Gif 文件名
 
 @param gifFileName Gif 文件名
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showGifImagesHUDInView:(NSString *)gifFileName message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在 KeyWindow 展示自定义GIF图片 - 传入Gif 文件名 - 不自动移除
 
 @param gifFileName Gif 文件名
 @param message 提示语
 */
+ (void)showGifImagesHUD:(NSString *)gifFileName message:(NSString *)message;

/**
 在 View 展示自定义GIF图片 - 传入Gif 文件名 - 不自动移除
 
 @param gifFileName Gif 文件名
 @param message 提示语
 */
+ (void)showGifImagesHUDInView:(NSString *)gifFileName message:(NSString *)message;

#pragma mark - 提示GIF图片 (传入Gif 图片)
/**
 在KeyWindow上展示自定义GIF图片 - 延时消失
 
 @param gifImage Gif 图 建议使用 imageGIFWithData
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showGifImageHUD:(UIImage *)gifImage message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在view上展示自定义GIF图片 - 延时消失
 
 @param gifImage Gif 图 建议使用 imageGIFWithData
 @param message 提示语
 @param aTimer 延时消失时间
 */
+ (void)showGifImageHUDInView:(UIImage *)gifImage message:(NSString *)message timer:(NSTimeInterval)aTimer;

/**
 在KeyWindow上展示自定义GIF图片 - 不自动移除
 
 @param gifImage Gif 图 建议使用 imageGIFWithData
 @param message 提示语
 */
+ (void)showGifImageHUD:(UIImage *)gifImage message:(NSString *)message;

/**
 在view上展示自定义GIF图片 - 不自动移除
 
 @param gifImage Gif 图 建议使用 imageGIFWithData
 @param message 提示语
 */
+ (void)showGifImageHUDInView:(UIImage *)gifImage message:(NSString *)message;

/**
 在KeyWindow上展示自定义GIF图片 - 不自动移除
 
 @param gifImage Gif 图 建议使用 imageGIFWithData
 @param message 提示语
 @param backgroundColor 背景色
 @param textColor 文本色
 @param textFont 字体
 @param alpha 透明度
 */
+ (void)showGifImageHUD:(UIImage *)gifImage message:(NSString *)message backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont alpha:(CGFloat)alpha timer:(NSTimeInterval)aTimer;

/**
 在view上展示自定义GIF图片 - 不自动移除
 
 @param gifImage Gif 图 建议使用 imageGIFWithData
 @param message 提示语
 @param backgroundColor 背景色
 @param textColor 文本色
 @param textFont 字体
 @param alpha 透明度
 */
+ (void)showGifImageHUDInView:(UIImage *)gifImage message:(NSString *)message backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont alpha:(CGFloat)alpha timer:(NSTimeInterval)aTimer;


#pragma mark - Data -> Gif

/**
 Gif
 
 @param data Gif 二进制
 eg : [MBProgressHUD imageGIFWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:gifFileName ofType:@"gif"]]];
 @return Gif 图
 */
+ (UIImage *)imageGIFWithData:(NSData *)data;
@end

NS_ASSUME_NONNULL_END
