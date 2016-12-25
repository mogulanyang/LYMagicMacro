//
//  UIView+LYExt.h
//  LYTools
//
//  Created by 兰洋 on 2016/12/11.
//  Copyright © 2016年 lanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LYExt)

@end

#pragma mark - 5.0 寻找对象
@interface UIView (Find)
/** 找到指定类名的subView */
- (UIView *)findSubViewWithClass:(Class)clazz;

- (NSArray *)findAllSubViewsWithClass:(Class)clazz;

/** 找到指定类名的superView对象 */
- (UIView *)findSuperViewWithClass:(Class)clazz;

/** 找到view上的第一响应者 */
- (UIView *)findFirstResponder;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)findViewController;

/** 拿到当前View所有的子View */
- (NSArray *)allSubviews;

/** 移除所有的子View */
- (void)removeAllSubviews;
@end

#pragma mark - 4.0添加到window
@interface UIView (LYWindow)
/**把View加在Window上 */
- (void)addToWindow;
@end

#pragma mark - 3.0屏幕截图
@interface UIView (LYScreenshot)
/** 截图返回image */
- (UIImage *)screenshot;
/** scrollView截图,传入contentoffset */
- (UIImage *)screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;
/** 截取CGRect范围内的图片 */
- (UIImage *)screenshotInFrame:(CGRect)frame;
@end

#pragma mark - 2.0坐标简写
@interface UIView (LYFrame)
/** 控件左边x */
- (CGFloat)left;
/** 控件右边x */
- (CGFloat)right;
/** 控件的size */
- (CGSize)size;
/** 控件顶部y */
- (CGFloat)top;
/** 控件底部y */
- (CGFloat)bottom;
/** 控件width */
- (CGFloat)width;
/** 控件height */
- (CGFloat)height;
/** 控件centerX */
- (CGFloat)centerX;
/** 控件centerY */
- (CGFloat)centerY;
/** 控件的最大X */
- (CGFloat)maxX;
/** 控件的最大Y */
- (CGFloat)maxY;


- (void)setLeft:(CGFloat)left;
- (void)setRight:(CGFloat)right;
- (void)setSize:(CGSize)size;
- (void)setTop:(CGFloat)top;
- (void)setBottom:(CGFloat)bottom;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)setOrigin:(CGPoint)point;
- (void)setAddTop:(CGFloat)top;
- (void)setAddLeft:(CGFloat)left;
@end

#pragma mark - 1.0添加响应
typedef void (^LYTappedBlock)();
@interface UIView (LYTappedBlcok)<UIGestureRecognizerDelegate>
/** 单击 */
- (void)whenTapped:(LYTappedBlock)block;
/** 双击 */
- (void)whenDoubleTapped:(LYTappedBlock)block;
/** 两根手指点击 */
- (void)whenDoubleFingerTapped:(LYTappedBlock)block;
/** 长按 */
- (void)whenLongPress:(LYTappedBlock)block;
/** 开始点击时 */
- (void)whenTouchDown:(LYTappedBlock)block;
/** 结束点击时 */
- (void)whenTouchUp:(LYTappedBlock)block;
@end
