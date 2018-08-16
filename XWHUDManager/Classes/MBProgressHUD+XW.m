//
//  MBProgressHUD+XW.m
//  XWHUDManager
//
//  Created by 邱学伟 on 2017/3/8.
//  Copyright © 2017年 邱学伟. All rights reserved.
//

#import "MBProgressHUD+XW.h"


@interface NSTimer (XWHUD)
/// 弱引用Timer
+ (NSTimer *)xwhud_timerTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(void))block repeats:(BOOL)repeats;
@end

@implementation MBProgressHUD (XW)
/// 隐藏蒙版默认时间
static const NSTimeInterval kHideHUDTimeInterval = 1.0f;
/// 提示框文字大小
static CGFloat kFONT_SIZE = 14.0f;
static NSTimer * kHideHUDTimer;

#pragma mark - 隐藏HUD
/// 隐藏蒙版(无论在view还是window)
+ (void)hide{
    
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:[self p_getCurrentUIVC].view animated:YES];
    [self hideHUDForView:winView animated:YES];
}

/// 延时隐藏蒙版(无论在view还是window)
+ (void)hideDelay:(NSTimeInterval)delaySeconds{
    [kHideHUDTimer invalidate];
    
    kHideHUDTimer = [NSTimer xwhud_timerTimeInterval:delaySeconds block:^{
        [MBProgressHUD hide];
    } repeats:NO];
}

/// 隐藏当前View上的HUD
+ (void)hideInView{
    
    [self hideHUDForView:[self p_getCurrentUIVC].view animated:YES];
}

/// 隐藏当前window上的HUD
+ (void)hideInWindow{
    
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:winView animated:YES];
}

#pragma mark - 小菊花
/// 在window展示一个小菊花
+ (void)showHUD{
    
    [self p_showActivityMessage:@"" isWindow:YES timer:HUGE_VALF];
}

/// 在window展示一个小菊花 (延时 afterSecond 秒 结束)
+ (void)showHUDAfterDelay:(NSTimeInterval)afterSecond{
    
    [self p_showActivityMessage:@"" isWindow:YES timer:afterSecond];
}

/// 在当前View展示一个小菊花
+ (void)showHUDInView{
    
    [self p_showActivityMessage:@"" isWindow:NO timer:HUGE_VALF];
}

/// 在window展示一个 loading... 小菊花
+ (void)showHUDLoadingEN {
    
    [self p_showActivityMessage:@"loading..." isWindow:YES timer:HUGE_VALF];
}

/// 在window展示一个 加载中... 小菊花
+ (void)showHUDLoadingCH {
    
    [self p_showActivityMessage:@"加载中..." isWindow:YES timer:HUGE_VALF];
}

/// 在window展示一个有文本小菊花
+ (void)showHUDMessage:(NSString *)message {
    
    [self p_showActivityMessage:message isWindow:YES timer:HUGE_VALF];
}

/// 限时隐藏在window展示一个 loading... 小菊花
+ (void)showHUDLoadingAfterDelay:(NSTimeInterval)afterSecond{
    
    [self p_showActivityMessage:@"loading..." isWindow:YES timer:afterSecond];
}

/// 限时隐藏在window展示一个有文本小菊花
+ (void)showHUDMessage:(NSString *)message afterDelay:(NSTimeInterval)afterSecond{
    
    [self p_showActivityMessage:message isWindow:YES timer:afterSecond];
}

/// 限时隐藏在view展示一个有文本小菊花
+ (void)showHUDMessageInView:(NSString *)message afterDelay:(NSTimeInterval)afterSecond{
    
    [self p_showActivityMessage:message isWindow:NO timer:afterSecond];
}

#pragma mark - 文本提示框
/// 在window上显示文本提示框
+ (void)showTipHUD:(NSString *)message {
    
    [self p_showTipMessage:message isWindow:YES timer:kHideHUDTimeInterval];
}

/// 在window上显示文本提示框
+ (void)showTipHUDInView:(NSString *)message {
    
    [self p_showTipMessage:message isWindow:NO timer:kHideHUDTimeInterval];
}

/// 限时隐藏在window展示一个有文本提示框
+ (void)showTipHUD:(NSString *)message afterDelay:(NSTimeInterval)afterSecond{
    
    [self p_showTipMessage:message isWindow:YES timer:afterSecond];
}

/// 限时隐藏在view展示一个有文本提示框
+ (void)showTipHUDInView:(NSString *)message afterDelay:(NSTimeInterval)afterSecond{
    
    [self p_showTipMessage:message isWindow:NO timer:afterSecond];
}

#pragma mark - 提示图片
/// 正确提示
+ (void)showSuccessHUD {
    
    [self p_showCustomIcon:@"right" message:@"" isWindow:YES timer:kHideHUDTimeInterval];
}

/// 有文本正确提示
+ (void)showSuccessTipHUD:(NSString *)message {
    
    [self p_showCustomIcon:@"right" message:message isWindow:YES timer:kHideHUDTimeInterval];
}

/// 在view展示有文本正确提示
+ (void)showSuccessTipHUDInView:(NSString *)message {
    
    [self p_showCustomIcon:@"right" message:message isWindow:NO timer:kHideHUDTimeInterval];
}

/// 错误提示
+ (void)showErrorHUD {
    
    [self p_showCustomIcon:@"error" message:@"" isWindow:YES timer:kHideHUDTimeInterval];
}

/// 有文本错误提示
+ (void)showErrorTipHUD:(NSString *)message {
    
    [self p_showCustomIcon:@"error" message:message isWindow:YES timer:kHideHUDTimeInterval];
}

/// 在view有文本错误提示
+ (void)showErrorTipHUDInView:(NSString *)message {
    
    [self p_showCustomIcon:@"error" message:message isWindow:NO timer:kHideHUDTimeInterval];
}

/// 信息提示
+ (void)showInfoTipHUD:(NSString *)message {
    
    [self p_showCustomIcon:@"info" message:message isWindow:YES timer:kHideHUDTimeInterval];
}

/// 在view信息提示
+ (void)showInfoTipHUDInView:(NSString *)message {
    
    [self p_showCustomIcon:@"info" message:message isWindow:NO timer:kHideHUDTimeInterval];
}

/// 警告提示
+ (void)showWarningTipHUD:(NSString *)message {
    
    [self p_showCustomIcon:@"tip" message:message isWindow:YES timer:kHideHUDTimeInterval];
}

/// 在view警告提示
+ (void)showWarningTipHUDInView:(NSString *)message {
    
    [self p_showCustomIcon:@"tip" message:message isWindow:NO timer:kHideHUDTimeInterval];
}

#pragma mark - 自定义图片
/// 展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中
+ (void)showCustomIconHUD:(NSString *)iconName message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showCustomIcon:iconName message:message isWindow:YES timer:aTimer];
}

/// 在view上展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中
+ (void)showCustomIconHUDInView:(NSString *)iconName message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showCustomIcon:iconName message:message isWindow:NO timer:aTimer];
}

/// 展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中 - 不自动移除
+ (void)showCustomIconHUD:(NSString *)iconName message:(NSString *)message {
    
    [self p_showCustomIcon:iconName message:message isWindow:YES timer:HUGE_VALF];
}

/// 在view上展示自定义图片 - 图片需要导入 'XWHUDImages.bundle' 包中 - 不自动移除
+ (void)showCustomIconHUDInView:(NSString *)iconName message:(NSString *)message {
    
    [self p_showCustomIcon:iconName message:message isWindow:NO timer:HUGE_VALF];
}


#pragma mark - 自定义图片+提示语(图片外界传入)
/// 展示自定义图片
+ (void)showCustomImageHUD:(UIImage *)image message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showCustomImage:image message:message isWindow:YES timer:aTimer];
}

/// 在view上展示自定义图片
+ (void)showCustomImageHUDInView:(UIImage *)image message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showCustomImage:image message:message isWindow:NO timer:aTimer];
}

/// 展示自定义图片 - 不自动移除
+ (void)showCustomImageHUD:(UIImage *)image message:(NSString *)message {
    
    [self p_showCustomImage:image message:message isWindow:YES timer:HUGE_VALF];
}

/// 在view上展示自定义图片 - 不自动移除
+ (void)showCustomImageHUDInView:(UIImage *)image message:(NSString *)message {
    
    [self p_showCustomImage:image message:message isWindow:NO timer:HUGE_VALF];
}


#pragma mark - 提示序列帧图片
/// 展示自定义序列帧图片
+ (void)showCustomImagesHUD:(NSArray <UIImage *> *)images message:(NSString *)message timer:(NSTimeInterval)aTimer {
 
    [self p_showCustomImages:images message:message isWindow:YES timer:aTimer > 0 ? aTimer : images.count * 0.1];
}
/// 在view上展示自定义序列帧图片
+ (void)showCustomImagesHUDInView:(NSArray <UIImage *> *)images message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showCustomImages:images message:message isWindow:NO timer:aTimer > 0 ? aTimer : images.count * 0.1];
}
/// 展示自定义序列帧图片 - 不自动移除
+ (void)showCustomImagesHUD:(NSArray <UIImage *> *)images message:(NSString *)message {
    
    [self p_showCustomImages:images message:message isWindow:YES timer:HUGE_VALF];
}
/// 在view上展示自定义序列帧图片 - 不自动移除
+ (void)showCustomImagesHUDInView:(NSArray <UIImage *> *)images message:(NSString *)message {
    
    [self p_showCustomImages:images message:message isWindow:NO timer:HUGE_VALF];
}

#pragma mark - 提示GIF图片  (传入Gif 文件名)
/// 展示自定义GIF图片
+ (void)showGifImagesHUD:(NSString *)gifFileName message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showGifImagesHUD:gifFileName message:message isWindow:YES timer:aTimer backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}
/// 在view上展示自定义GIF图片
+ (void)showGifImagesHUDInView:(NSString *)gifFileName message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showGifImagesHUD:gifFileName message:message isWindow:NO timer:aTimer backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}
/// 展示自定义GIF图片 - 不自动移除
+ (void)showGifImagesHUD:(NSString *)gifFileName message:(NSString *)message {
    
    [self p_showGifImagesHUD:gifFileName message:message isWindow:YES timer:HUGE_VALF backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}
/// 在view上展示自定义GIF图片 - 不自动移除
+ (void)showGifImagesHUDInView:(NSString *)gifFileName message:(NSString *)message {
    
    [self p_showGifImagesHUD:gifFileName message:message isWindow:NO timer:HUGE_VALF backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}

#pragma mark - 提示GIF图片 (传入Gif 图片)
/// 展示自定义GIF图片
+ (void)showGifImageHUD:(UIImage *)gifImage message:(NSString *)message timer:(NSTimeInterval)aTimer {
 
    [self p_showGifImageHUD:gifImage message:message isWindow:YES timer:aTimer backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}
/// 在view上展示自定义GIF图片
+ (void)showGifImageHUDInView:(UIImage *)gifImage message:(NSString *)message timer:(NSTimeInterval)aTimer {
    
    [self p_showGifImageHUD:gifImage message:message isWindow:NO timer:aTimer backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}
/// 展示自定义GIF图片 - 不自动移除
+ (void)showGifImageHUD:(UIImage *)gifImage message:(NSString *)message {
    
    [self p_showGifImageHUD:gifImage message:message isWindow:YES timer:HUGE_VALF backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}
/// 在view上展示自定义GIF图片 - 不自动移除
+ (void)showGifImageHUDInView:(UIImage *)gifImage message:(NSString *)message {
    
    [self p_showGifImageHUD:gifImage message:message isWindow:NO timer:HUGE_VALF backgroundColor:nil textColor:nil textFont:nil alpha:1.0];
}
/// 展示自定义GIF图片 - 不自动移除
+ (void)showGifImageHUD:(UIImage *)gifImage message:(NSString *)message backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont alpha:(CGFloat)alpha {
    
    [self p_showGifImageHUD:gifImage message:message isWindow:YES timer:HUGE_VALF backgroundColor:backgroundColor textColor:textColor textFont:textFont alpha:alpha];
}
/// 在view上展示自定义GIF图片 - 不自动移除
+ (void)showGifImageHUDInView:(UIImage *)gifImage message:(NSString *)message backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont alpha:(CGFloat)alpha {
    
    [self p_showGifImageHUD:gifImage message:message isWindow:NO timer:HUGE_VALF backgroundColor:backgroundColor textColor:textColor textFont:textFont alpha:alpha];
}


#pragma mark - Data -> Gif
+ (UIImage *)imageGIFWithData:(NSData *)data {
    if (!data) {
        return nil;
    }
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(source);
    UIImage *animatedImage;
    if (count <= 1) {
        animatedImage = [[UIImage alloc] initWithData:data];
    }
    else {
        NSMutableArray *images = [NSMutableArray array];
        NSTimeInterval duration = 0.0f;
        for (size_t i = 0; i < count; i++) {
            CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
            if (!image) {
                continue;
            }
            duration += [self p_frameDurationAtIndex:i source:source];
            [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
            CGImageRelease(image);
        }
        if (!duration) {
            duration = (1.0f / 10.0f) * count;
        }
        animatedImage = [UIImage animatedImageWithImages:images duration:duration];
    }
    CFRelease(source);
    return animatedImage;
}

#pragma mark - private
/// 文本框
+ (void)p_showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(NSTimeInterval)aTimer {
    
    MBProgressHUD *hud = [self p_createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.color = [UIColor blackColor];
    hud.label.textColor = [UIColor whiteColor];
    [hud hideAnimated:YES afterDelay:aTimer];
}

/// 小菊花
+ (void)p_showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(NSTimeInterval)aTimer {
    MBProgressHUD *hud  =  [self p_createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud hideAnimated:YES afterDelay:aTimer];
}

/// 自定义图片 - bundle内资源
+ (void)p_showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow timer:(NSTimeInterval)aTimer {
    MBProgressHUD *hud  =  [self p_createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[@"XWHUDImages.bundle" stringByAppendingPathComponent:iconName]]];
    [hud hideAnimated:YES afterDelay:aTimer];
}

/// 自定义图片-外界传入图片
+ (void)p_showCustomImage:(UIImage *)image message:(NSString *)message isWindow:(BOOL)isWindow timer:(NSTimeInterval)aTimer{
    MBProgressHUD *hud  =  [self p_createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    [hud hideAnimated:YES afterDelay:aTimer];
}

/// 序列帧
+ (void)p_showCustomImages:(NSArray <UIImage *> *)images message:(NSString *)message isWindow:(BOOL)isWindow timer:(NSTimeInterval)aTimer{
    MBProgressHUD *hud  =  [self p_createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeCustomView;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.animationImages = images;
    imageView.animationDuration = images.count * 0.1;
    imageView.animationRepeatCount = HUGE_VALF;
    [imageView startAnimating];
    hud.customView = imageView;
    [hud hideAnimated:YES afterDelay:aTimer];
}

/// GIF - Gif 文件名
+ (void)p_showGifImagesHUD:(NSString *)gifFileName message:(NSString *)message isWindow:(BOOL)isWindow timer:(NSTimeInterval)aTimer backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont alpha:(CGFloat)alpha {
    MBProgressHUD *hud  =  [self p_createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeCustomView;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:gifFileName ofType:@"gif"];
    UIImage *gifImage = [self imageGIFWithData:[NSData dataWithContentsOfFile:filePath]];
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:gifImage];
    hud.customView = gifImageView;
    
    hud.alpha = alpha;
    if (backgroundColor) {
        hud.bezelView.color = backgroundColor;
    }
    if (textColor) {
        hud.label.textColor = textColor;
    }
    if (textFont) {
        hud.label.font = textFont;
    }
    
    [hud hideAnimated:YES afterDelay:aTimer];
}

/// GIF
+ (void)p_showGifImageHUD:(UIImage *)gifImage message:(NSString *)message isWindow:(BOOL)isWindow timer:(NSTimeInterval)aTimer backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont alpha:(CGFloat)alpha {
    MBProgressHUD *hud  =  [self p_createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeCustomView;
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:gifImage];
    hud.customView = gifImageView;
    
    hud.alpha = alpha;
    if (backgroundColor) {
        hud.bezelView.color = backgroundColor;
    }
    if (textColor) {
        hud.label.textColor = textColor;
    }
    if (textFont) {
        hud.label.font = textFont;
    }
    
    [hud hideAnimated:YES afterDelay:aTimer];
}

/// 全局统一生成提示框对象
+ (MBProgressHUD *)p_createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow {
    
    UIView *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self p_getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.label.text = message ? message : @"加载中...";
    hud.label.font = [UIFont systemFontOfSize:kFONT_SIZE];
    hud.backgroundView.color = [UIColor clearColor];
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    // 注释下面配置代码默认显示浅灰->
    hud.bezelView.color = [UIColor blackColor];
    hud.label.textColor = [UIColor whiteColor];
    hud.contentColor = [UIColor whiteColor];
    return hud;
}

/// 获取当前屏幕显示的viewcontroller
+ (UIViewController *)p_getCurrentUIVC {
    
    UIViewController  *superVC = [[self class]  p_getCurrentWindowVC ];
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}

+ (UIViewController *)p_getCurrentWindowVC {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}

+ (float)p_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source {
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTimeUnclampedProp) {
        frameDuration = [delayTimeUnclampedProp floatValue];
    }
    else {
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTimeProp) {
            frameDuration = [delayTimeProp floatValue];
        }
    }
    if (frameDuration < 0.011f) {
        frameDuration = 0.100f;
    }
    CFRelease(cfFrameProperties);
    return frameDuration;
}

@end

#pragma mark - NSTimer
@implementation NSTimer (XWHUD)
+ (NSTimer *)xwhud_timerTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(void))block repeats:(BOOL)repeats {
    NSTimer *timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(timerMethod:) userInfo:block repeats:repeats];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

+ (void)timerMethod:(NSTimer *)timer {
    void(^inBlock)(void) = [timer userInfo];
    if (inBlock) {
        inBlock();
    }
}
@end
