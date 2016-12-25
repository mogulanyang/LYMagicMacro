//
//  UIView+LYExt.m
//  LYTools
//
//  Created by 兰洋 on 2016/12/11.
//  Copyright © 2016年 lanyang. All rights reserved.
//

#import "UIView+LYExt.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>


@implementation UIView (LYExt)

@end
#pragma mark - 5.0寻找
@implementation UIView (Find)
- (UIView *)findSubViewWithClass:(Class)clazz;
{
    for (UIView * subView in self.subviews)
    {
        if ([subView isKindOfClass:clazz])
        {
            return subView;
        }
    }
    
    return nil;
}

- (NSArray *)findAllSubViewsWithClass:(Class)clazz
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (UIView * subView in self.subviews)
    {
        if ([subView isKindOfClass:clazz])
        {
            [array addObject:subView];
        }
    }
    
    return array;
}

- (UIView *)findSuperViewWithClass:(Class)clazz;
{
    if (self == nil)
    {
        return nil;
    }
    else if (self.superview == nil)
    {
        return nil;
    }
    else if ([self.superview isKindOfClass:clazz])
    {
        return self.superview;
    }
    else
    {
        return [self.superview findSuperViewWithClass:clazz];
    }
}

- (UIView *)findFirstResponder
{
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder))
    {
        return self;
    }
    
    for (UIView *v in self.subviews)
    {
        UIView *fv = [v findFirstResponder];
        if (fv)
        {
            return fv;
        }
    }
    
    return nil;
}

- (UIViewController *)findViewController;
{
    UIResponder *responder = self.nextResponder;
    do
    {
        if ([responder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    while (responder);
    
    return nil;
}

- (void)removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (NSArray *)allSubviews
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    [array addObjectsFromArray:self.subviews];
    
    for (UIView *view in self.subviews)
    {
        [array addObjectsFromArray:[view allSubviews]];
    }
    
    return array;
}
@end


#pragma mark - 4.0添加到window
@implementation UIView (LYWindow)
-(void) addToWindow
{
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(window)])
    {
        UIWindow * window = (UIWindow *) [appDelegate performSelector:@selector(window)];
        [window addSubview:self];
    }
}
@end

#pragma mark - 屏幕截图
@implementation UIView (LYScreenshot)
- (UIImage*) screenshot {
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    image = [UIImage imageWithData:imageData];
    
    return image;
}

- (UIImage *) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset {
    UIGraphicsBeginImageContext(self.bounds.size);
    
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0f, -contentOffset.y);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.55);
    image = [UIImage imageWithData:imageData];
    
    return image;
}

- (UIImage*) screenshotInFrame:(CGRect)frame {
    UIGraphicsBeginImageContext(frame.size);
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), frame.origin.x, frame.origin.y);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    image = [UIImage imageWithData:imageData];
    return image;
}
@end

#pragma mark - UIView坐标简写
@implementation UIView (LYFrame)
- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGSize)size{
    return self.frame.size;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)setRight:(CGFloat)right;
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)point
{
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setAddTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y += top;
    self.frame = frame;
}

- (void)setAddLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x += left;
    self.frame = frame;
}

@end


#import <objc/runtime.h>

//关键字为void*指针（任意类型指针）,每一个关联的关键字必须是唯一的，通常采用静态变量来作为关键字
static char LYSingleTapBlockKey;
static char LYDoubleTapBlockKey;
static char LYDoubleFingerTapBlockKey;
static char LYTouchDownTapBlockKey;
static char LYTouchUpTapBlcokKey;
static char LYLongPressBlockKey;

@interface UIView (LYTapPrivates)

- (void)requireSingleTapsRecognizer:(UIGestureRecognizer *)recognizer;
- (void)requireDoubleTapsRecognizer:(UIGestureRecognizer *)recognizer;
- (void)requireLongPressTecognizer:(UIGestureRecognizer *)recognizer;
- (UITapGestureRecognizer *)addTapRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches sel:(SEL)sel;
- (UILongPressGestureRecognizer *)addLongPressRecognizerWithTouches:(NSUInteger)touches sel:(SEL)sel;

- (void)returnBlockForkey:(void *)key;
- (void)setBlockForKey:(void *)key block:(LYTappedBlock)block;

@end

@implementation UIView (LYTappedBlcok)

#pragma mark -Taps
- (void)whenTapped:(LYTappedBlock)block
{
    UITapGestureRecognizer *tap = [self addTapRecognizerWithTaps:1 touches:1 sel:@selector(singleTap)];
    [self requireDoubleTapsRecognizer:tap];
    [self requireLongPressTecognizer:tap];
    [self setBlockForKey:&LYSingleTapBlockKey block:block];
}

- (void)whenDoubleTapped:(LYTappedBlock)block
{
    UITapGestureRecognizer *tap = [self addTapRecognizerWithTaps:2 touches:1 sel:@selector(doubleTap)];
    [self requireSingleTapsRecognizer:tap];
    [self setBlockForKey:&LYDoubleTapBlockKey block:block];
}

- (void)whenDoubleFingerTapped:(LYTappedBlock)block
{
    [self addTapRecognizerWithTaps:1 touches:2 sel:@selector(doubleFingerTap)];
    [self setBlockForKey:&LYDoubleFingerTapBlockKey block:block];
}

- (void)whenLongPress:(LYTappedBlock)block
{
    [self addLongPressRecognizerWithTouches:1 sel:@selector(longPress:)];
    [self setBlockForKey:&LYLongPressBlockKey block:block];
}

- (void)whenTouchDown:(LYTappedBlock)block
{
    [self setBlockForKey:&LYTouchDownTapBlockKey block:block];
}

- (void)whenTouchUp:(LYTappedBlock)block
{
    [self setBlockForKey:&LYTouchUpTapBlcokKey block:block];
}

#pragma mark - 添加block属性
//获取关联对象
- (void)returnBlockForkey:(void *)key
{
    LYTappedBlock block = objc_getAssociatedObject(self, key);
    if (block) block();
}

//创建关联
- (void)setBlockForKey:(void *)key block:(LYTappedBlock)block
{
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - CallBacks
- (void)singleTap
{
    [self returnBlockForkey:&LYSingleTapBlockKey];
}

- (void)doubleTap
{
    [self returnBlockForkey:&LYDoubleTapBlockKey];
}

- (void)doubleFingerTap
{
    [self returnBlockForkey:&LYDoubleFingerTapBlockKey];
}

- (void)longPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)[self returnBlockForkey:&LYLongPressBlockKey];}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self returnBlockForkey:&LYTouchDownTapBlockKey];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self returnBlockForkey:&LYTouchUpTapBlcokKey];
}

#pragma mark - 解决手势冲突
//在单击和双击手势时,由于手势的触发条件会有重合,有些情况下会产生冲突,无法达到满意的效果,利用 requireGestureRecognizerToFail 的方法指定某个手势确定失效之后才会触发本次手势，即使本次手势的触发条件已经满足
- (void)requireSingleTapsRecognizer:(UIGestureRecognizer *)recognizer
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer *tap = (UITapGestureRecognizer *)gesture;
            if (tap.numberOfTouchesRequired==1&tap.numberOfTapsRequired == 1) {
                [tap requireGestureRecognizerToFail:recognizer];
            }
        }
    }
}

- (void)requireDoubleTapsRecognizer:(UIGestureRecognizer *)recognizer
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer *tap = (UITapGestureRecognizer *)gesture;
            if (tap.numberOfTapsRequired == 2&tap.numberOfTouchesRequired == 1) {
                [tap requireGestureRecognizerToFail:recognizer];
            }
        }
    }
}

- (void)requireLongPressTecognizer:(UIGestureRecognizer *)recognizer
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]]) {
            UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)gesture;
            [longPress requireGestureRecognizerToFail:recognizer];
        }
    }
}

#pragma mark - 添加手势
- (UITapGestureRecognizer *)addTapRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches sel:(SEL)sel
{
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:sel];
    tapGr.delegate = self;
    tapGr.numberOfTapsRequired = taps;
    tapGr.numberOfTouchesRequired = touches;
    [self addGestureRecognizer:tapGr];
    return tapGr;
}

- (UILongPressGestureRecognizer *)addLongPressRecognizerWithTouches:(NSUInteger)touches sel:(SEL)sel
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:sel];
    longPress.numberOfTouchesRequired = touches;
    longPress.delegate = self;
    [self addGestureRecognizer:longPress];
    return longPress;
}
@end

