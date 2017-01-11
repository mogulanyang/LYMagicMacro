// github<https://github.com/mogulanyang>
// 微博<http://weibo.com/u/1806924330?refer_flag=1001030101_>
// 该项目是小兰魔法手册.


#pragma mark - 1.0.必用宏
/** 屏幕属性 */
//主窗口
#define KeyWindow \
[UIApplication sharedApplication].keyWindow
//屏幕
#define ScreenWeight \
[UIScreen mainScreen].bounds.size.width
#define ScreenHeight \
[UIScreen mainScreen].bounds.size.height
#define UIScreen_W \
[UIScreen mainScreen].bounds.size.width
#define UIScreen_H \
[UIScreen mainScreen].bounds.size.height
//weakSelf
#define WeakSelf(type)  __weak typeof(type) weak##type = type;


/** 通知相关  */
//通知中心发送通知
#define NSNotificationPost_(ly_Name, ly_UserInfo) \
[[NSNotificationCenter defaultCenter] postNotificationName:ly_Name object:nil userInfo:(ly_UserInfo)]
//通知中心接收通知
#define NSNotificationReceive_(ly_SEL, ly_name) \
[[NSNotificationCenter defaultCenter] addObserver:self selector:ly_SEL name:ly_name object:nil]
//移除通知
#define NSNotificationRemove \
[[NSNotificationCenter defaultCenter] removeObserver:self]


//const字符串
#define NSString_Const_H_(ly_strName) \
UIKIT_EXTERN NSString * const ly_strName;

#define NSString_Const_M_(ly_strName, ly_String) \
NSString * const ly_strName = ly_String;


#define NSUserDefaultsSave_(key,value) \
[[NSUserDefaults standardUserDefaults] setObject:value forKey:key] //以key,value存储信息

#define NSUserDefaultsGet_(key) \
[[NSUserDefaults standardUserDefaults] objectForKey:key] //以key取出value

#define NSUserDefaultsRemove_(key) \
[[NSUserDefaults standardUserDefaults] removeObjectForKey:key] //以key删除value

//立即同步
#define NSUserDefaultsSync \
[[NSUserDefaults standardUserDefaults] synchronize]

/** 颜色  */
//RGB颜色
#define UIColorWithRGB_(ly_R,ly_G,ly_B) \
[UIColor colorWithRed:ly_R green:ly_G blue:ly_B alpha:1]
#define ColorRGB_(ly_R,ly_G,ly_B) \
[UIColor colorWithRed:ly_R green:ly_G blue:ly_B alpha:1]
//随机颜色
#define UIColorWithRandom \
[UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
#define RandomColor \
[UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
//十六进制颜色
#define UIColorWithHex16_(ly_0Xefefef) \
[UIColor colorWithRed:((ly_0Xefefef & 0xFF0000) >> 16) / 255.0 green:((ly_0Xefefef & 0x00FF00) >> 8) / 255.0 blue:((ly_0Xefefef & 0x0000FF)) / 255.0 alpha:1]
#define colorWithHex_(ly_0Xefefef) \
[UIColor colorWithRed:((ly_0Xefefef & 0xFF0000) >> 16) / 255.0 green:((ly_0Xefefef & 0x00FF00) >> 8) / 255.0 blue:((ly_0Xefefef & 0x0000FF)) / 255.0 alpha:1]




#pragma mark - 定义属性
/**
 *     便捷定义@property属性
 */

/** copy */
//NSString
#define String_(name) \
ly_copy_property(NSString*,name)
//NSArray
#define Array_(name) \
ly_copy_property(NSArray*,name)
//NSDictionary
#define Dictionary_(name) \
ly_copy_property(NSDictionary*,name)
//NSNumber,它没用对应的不可变类，其实用copy或strong没有区别
#define Number_(name) \
ly_copy_property(NSNumber*,name)
//NSData
#define Data_(name) \
ly_copy_property(NSData*,name)
//NSSet
#define Set_(name) \
ly_copy_property(NSSet*,name)
//NSIndexSet
#define IndexSet_(name) \
ly_copy_property(NSIndexSet*,name)

//带多态的数组和可变数组
#define mArray_type(modelType, name) \
@property(nonatomic, strong)NSMutableArray <modelType *> *name;
#define Array_type(modelType, name) \
@property(nonatomic, strong)NSArray <modelType *> *name;


//代码块，名称和传参，没有传参就不填
#define Block_(name,...) \
ly_set_block(void,name,__VA_ARGS__)
//有返回值的代码块
#define BlockReturn_(name,returnClass,...) \
ly_set_block(returnClass,name,__VA_ARGS__)


/** strong */
//UISearchBar
#define SearchBar_(ly_name) \
@property (nonatomic, strong) UISearchBar *ly_name;
#define MapView_(ly_name) \
@property (nonatomic, strong) MKMapView *ly_name;
#define LocationManager_(ly_name) \
@property (nonatomic, strong)CLLocationManager *ly_name;

//UICollectionViewFlowLayout
#define FlowLayout_(ly_name) \
@property(nonatomic, strong)UICollectionViewFlowLayout *ly_name;
//NSMutableString
#define mString_(name,...) \
ly_strong_property(NSMutableString*,name,__VA_ARGS__)
//NSMutableArray
#define mArray_(name,...) \
ly_strong_property(NSMutableArray*,name,__VA_ARGS__)
//NSMutableDictionary
#define mDictionary_(name,...) \
ly_strong_property(NSMutableDictionary*,name,__VA_ARGS__)
//NSMutableData
#define mData_(name,...) \
ly_strong_property(NSMutableData*,name,__VA_ARGS__)
//NSMutableSet
#define mSet_(name,...) \
ly_strong_property(NSMutableSet*,name,__VA_ARGS__)
//NSMutableIndexSet
#define mIndexSet_(name,...) \
ly_strong_property(NSMutableIndexSet*,name,__VA_ARGS__)

//UIImage
#define Image_(name) \
ly_strong_property(UIImage*,name)
//UIColor
#define Color_(name) \
ly_strong_property(UIColor*,name)
//id
#define id_(name,...) \
ly_strong_property(id,name,__VA_ARGS__)

//UIView
#define View_(name,...) \
ly_strong_property(UIView*,name,__VA_ARGS__)
//UIImageView
#define ImageView_(name,...) \
ly_strong_property(UIImageView*,name,__VA_ARGS__)
//UILabel
#define Label_(name,...) \
ly_strong_property(UILabel*,name,__VA_ARGS__)
//UIButton
#define Button_(name,...) \
ly_strong_property(UIButton*,name,__VA_ARGS__)
//UITableView
#define TableView_(name,...) \
ly_strong_property(UITableView*,name,__VA_ARGS__)
//UICollectionView
#define CollectionView_(name,...) \
ly_strong_property(UICollectionView*,name,__VA_ARGS__)
//UISegmentedControl
#define SegmentedControl_(name,...) \
ly_strong_property(UISegmentedControl*,name,__VA_ARGS__)
//UITextField
#define TextField_(name,...) \
ly_strong_property(UITextField*,name,__VA_ARGS__)
//UISlider
#define Slider_(name,...) \
ly_strong_property(UISlider*,name,__VA_ARGS__)
//UISwitch
#define Switch_(name,...) \
ly_strong_property(UISwitch*,name,__VA_ARGS__)
//UIActivityIndicatorView
#define ActivityIndicatorView_(name,...) \
ly_strong_property(UIActivityIndicatorView*,name,__VA_ARGS__)
//UIProgressView
#define ProgressView_(name,...) \
ly_strong_property(UIProgressView*,name,__VA_ARGS__)
//UIPageControl
#define PageControl_(name,...) \
ly_strong_property(UIPageControl*,name,__VA_ARGS__)
//UIStepper
#define Stepper_(name,...) \
ly_strong_property(UIStepper*,name,__VA_ARGS__)
//UITextView
#define TextView_(name,...) \
ly_strong_property(UITextView*,name,__VA_ARGS__)
//UIScrollView
#define ScrollView_(name,...) \
ly_strong_property(UIScrollView*,name,__VA_ARGS__)
//UIDatePicker
#define DatePicker_(name,...) \
ly_strong_property(UIDatePicker*,name,__VA_ARGS__)
//UIPickerView
#define PickerView_(name,...) \
ly_strong_property(UIPickerView*,name,__VA_ARGS__)
//UIWebView
#define WebView_(name,...) \
ly_strong_property(UIWebView*,name,__VA_ARGS__)
//自定义类
#define DIYObj_(class,name,...) \
ly_strong_property(class*,name,__VA_ARGS__)





/** assign */

//int
#define int_(name,...) \
ly_assign_property(int,name,__VA_ARGS__)
//float
#define float_(name,...) \
ly_assign_property(float,name,__VA_ARGS__)
//double
#define double_(name,...) \
ly_assign_property(double,name,__VA_ARGS__)
//CGFloat
#define CGFloat_(name,...) \
ly_assign_property(CGFloat,name,__VA_ARGS__)
//NSInteger
#define NSInteger_(name,...) \
ly_assign_property(NSInteger,name,__VA_ARGS__)
//NSUInteger
#define NSUInteger_(name,...) \
ly_assign_property(NSUInteger,name,__VA_ARGS__)
//BOOL
#define BOOL_(name,...) \
ly_assign_property(BOOL,name,__VA_ARGS__)
//CGRect
#define CGRect_(name,...) \
ly_assign_property(CGRect,name,__VA_ARGS__)
//CGSize
#define CGSize_(name,...) \
ly_assign_property(CGSize,name,__VA_ARGS__)
//CGPoint
#define CGPoint_(name,...) \
ly_assign_property(CGPoint,name,__VA_ARGS__)
//CGAffineTransform
#define CGAffineTransform_(name,...) \
ly_assign_property(CGAffineTransform,name,__VA_ARGS__)
//NSTimeInterval
#define NSTimeInterval_(name,...) \
ly_assign_property(NSTimeInterval,name,__VA_ARGS__)
//Class
#define Class_(name) \
ly_assign_property(Class,name)




/** weak */

//UIImageView
#define weakImageView_(name,...) \
ly_weak_property(UIImageView*,name,__VA_ARGS__)
//UIView
#define weakView_(name,...) \
ly_weak_property(UIView*,name,__VA_ARGS__)
//UILabel
#define weakLabel_(name,...) \
ly_weak_property(UILabel*,name,__VA_ARGS__)
//UIButton
#define weakButton_(name,...) \
ly_weak_property(UIButton*,name,__VA_ARGS__)
//UITableView
#define weakTableView_(name,...) \
ly_weak_property(UITableView*,name,__VA_ARGS__)
//UICollectionView
#define weakCollectionView_(name,...) \
ly_weak_property(UICollectionView*,name,__VA_ARGS__)
//UISegmentedControl
#define weakSegmentedControl_(name,...) \
ly_weak_property(UISegmentedControl*,name,__VA_ARGS__)
//UITextField
#define weakTextField_(name,...) \
ly_weak_property(UITextField*,name,__VA_ARGS__)
//UISlider
#define weakSlider_(name,...) \
ly_weak_property(UISlider*,name,__VA_ARGS__)
//UISwitch
#define weakSwitch_(name,...) \
ly_weak_property(UISwitch*,name,__VA_ARGS__)
//UIActivityIndicatorView
#define weakActivityIndicatorView_(name,...) \
ly_weak_property(UIActivityIndicatorView*,name,__VA_ARGS__)
//UIProgressView
#define weakProgressView_(name,...) \
ly_weak_property(UIProgressView*,name,__VA_ARGS__)
//UIPageControl
#define weakPageControl_(name,...) \
ly_weak_property(UIPageControl*,name,__VA_ARGS__)
//UIStepper
#define weakStepper_(name,...) \
ly_weak_property(UIStepper*,name,__VA_ARGS__)
//UITextView
#define weakTextView_(name,...) \
ly_weak_property(UITextView*,name,__VA_ARGS__)
//UIScrollView
#define weakScrollView_(name,...) \
ly_weak_property(UIScrollView*,name,__VA_ARGS__)
//UIDatePicker
#define weakDatePicker_(name,...) \
ly_weak_property(UIDatePicker*,name,__VA_ARGS__)
//UIPickerView
#define weakPickerView_(name,...) \
ly_weak_property(UIPickerView*,name,__VA_ARGS__)
//UIWebView
#define weakWebView_(name,...) \
ly_weak_property(UIWebView*,name,__VA_ARGS__)
//自定义类
#define weakDIYObj_(class,name,...) \
ly_weak_property(class*,name,__VA_ARGS__)

//delegate
#define Delegate_(class,name) \
ly_weak_property(id<class>,name)


/** base */

//copy && DIY
#define ly_copy_property(class,var,...) \
ly_set_property(class,var,copy,__VA_ARGS__)
//strong && DIY
#define ly_strong_property(class,var,...) \
ly_set_property(class,var,strong,__VA_ARGS__)
//weak && DIY
#define ly_weak_property(class,var,...) \
ly_set_property(class,var,weak,__VA_ARGS__)
//assign && DIY
#define ly_assign_property(class,var,...) \
ly_set_property(class,var,assign,__VA_ARGS__)
//DIY
#define ly_diy_property(class,var,...) \
ly_set_property(class,var,__VA_ARGS__)
//block
#define ly_set_block(class,name,...) \
ly_set_property(class,(^name)(__VA_ARGS__),copy)

//baseMacro
#define ly_set_property(class,var,...) \
@property (nonatomic, __VA_ARGS__) class var;



/**
 *     其他宏
 */
//block的调用
#define Call(block,...) \
!block?:block(__VA_ARGS__);
//block的调用，并带有返回值
#define CallRerurn(block,failReturnValue,...) \
block?(block(__VA_ARGS__)):(failReturnValue)

//打印宏
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s %s:%d\t%s\n",__TIME__,[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

/**
 初始化属性
 */
#pragma mark - 2.0.初始化控件
//初始化Button
#define GET_Button_(ly_name, ly_superView,ly_SEL,ly_imageName,ly_title, ly_font, ly_titleColor, ...)\
- (UIButton *)ly_name\
{\
    ly_lazy_(ly_name,\
             UIButton *obj = [UIButton buttonWithType:UIButtonTypeCustom]; \
             ly_if_(ly_title,[obj setTitle:ly_title forState:UIControlStateNormal];) \
             ly_if_(ly_font,obj.titleLabel.font = [UIFont systemFontOfSize:ly_font];) \
             ly_if_(ly_titleColor,[obj setTitleColor:ly_titleColor forState:UIControlStateNormal];) \
             ly_if_(ly_imageName, [obj setImage:[UIImage imageNamed:ly_imageName] forState:UIControlStateNormal];)\
             ly_if_(ly_SEL, [obj addTarget:self action:ly_SEL forControlEvents:UIControlEventTouchUpInside];)\
             [ly_superView addSubview:obj];\
             __VA_ARGS__\
             obj;\
             )\
}
//初始化Label
#define GET_Label_(ly_name, ly_superView, ly_text, ly_titleColor, ly_font, ...) \
-(UILabel *)ly_name\
{ \
    ly_lazy_(ly_name,\
            UILabel *obj = [[UILabel alloc] init]; \
            ly_if_(ly_text,obj.text = ly_text;) \
            ly_if_(ly_titleColor,obj.textColor = ly_titleColor;) \
            ly_if_(ly_font,obj.font = [UIFont systemFontOfSize:ly_font];)\
            obj.numberOfLines = 0; \
            [ly_superView addSubview:obj]; \
            __VA_ARGS__\
            obj;\
            )\
}
//初始化imageView
#define GET_ImageView_(ly_name, ly_superView, ly_imageName, ...) \
- (UIImageView *)ly_name \
{ \
    ly_lazy_(ly_name,\
            UIImageView *obj = [[UIImageView alloc] init]; \
            obj.image = [UIImage imageNamed:ly_imageName]; \
            obj.contentMode = UIViewContentModeScaleAspectFill; \
            [ly_superView addSubview:obj]; \
            __VA_ARGS__\
            obj; \
            ) \
}
//初始化textField
#define GET_TextField_(ly_name, ly_superView, ly_UIFont,ly_placeholder, ...) \
-(UITextField *)ly_name \
{ \
    ly_lazy_(ly_name,\
            UITextField *obj = [[UITextField alloc] init]; \
            ly_if_(ly_placeholder,obj.placeholder = ly_placeholder;) \
            obj.borderStyle = UITextBorderStyleRoundedRect; \
            obj.font = ly_UIFont;  \
            [ly_superView addSubview:obj]; \
            __VA_ARGS__\
            obj; \
        ) \
} \
//初始化tableView (记得注册Cell)
#define GET_TableView_(ly_name, ly_superView, ly_style, ...) \
- (UITableView *)ly_name \
{ \
    ly_lazy_(ly_name,\
            UITableView *obj = [[UITableView alloc] initWithFrame:CGRectZero style: ly_style]; \
            [ly_superView addSubview:obj]; \
            obj.dataSource = self; \
            obj.delegate = self; \
            __VA_ARGS__\
            obj; \
        ) \
}
//初始化collectionViewFlowLayout
#define GET_FlowLayout_(ly_name, ly_scrollDirection, ly_itemSize, ly_minimumLineSpacing, ly_minimumInteritemSpacing, ...) \
- (UICollectionViewFlowLayout *)ly_name \
{ \
    ly_lazy_(ly_name,\
            UICollectionViewFlowLayout *obj = [[UICollectionViewFlowLayout alloc] init]; \
            ly_if_(ly_scrollDirection,obj.scrollDirection = ly_scrollDirection;) \
            obj.minimumLineSpacing = ly_minimumLineSpacing; \
            ly_if_(ly_minimumInteritemSpacing,obj.minimumInteritemSpacing = ly_minimumInteritemSpacing;) \
            obj.itemSize = ly_itemSize; \
            __VA_ARGS__\
            obj; \
        ) \
}
//初始化collectionView
#define GET_CollectionView_(ly_name, ly_superView, ly_flowLayout, ly_color, ...) \
- (UICollectionView *)ly_name \
{ \
        ly_lazy_(ly_name,\
            UICollectionView *obj = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:ly_flowLayout]; \
            obj.dataSource = self; \
            obj.delegate = self; \
            [ly_superView addSubview:obj]; \
            obj.backgroundColor = ly_color; \
            __VA_ARGS__\
            obj; \
        )\
}
//初始化普通数组
#define GET_Array_(ly_name, ...) \
- (NSArray *)ly_name \
{ \
    ly_lazy_(ly_name,\
            NSArray *obj = [NSArray array]; \
            __VA_ARGS__\
            obj; \
        ) \
}
//初始化可变数组
#define GET_mArray_(ly_name, ...)\
- (NSMutableArray *)ly_name \
{ \
        ly_lazy_(ly_name,\
            NSMutableArray *obj = [NSMutableArray array]; \
            __VA_ARGS__\
            obj; \
        ) \
}
//初始化字典
#define GET_Dictionary_(ly_name, ...) \
- (NSDictionary *)ly_name \
{ \
    ly_lazy_(ly_name,\
            NSDictionary *obj = [NSDictionary dictionary]; \
            __VA_ARGS__\
            obj; \
        ) \
}
//初始化可变字典
#define GET_mDictionary_(ly_name, ...) \
- (NSMutableDictionary *)ly_name \
{ \
    ly_lazy_(ly_name,\
            NSMutableDictionary *obj = [NSMutableDictionary dictionary]; \
            __VA_ARGS__\
            obj; \
        ) \
}
//初始化自定义对象
#define GET_DIYObj_(ly_class, ly_name, ...) \
- (ly_class *)ly_name \
{ \
    ly_lazy_(ly_name, \
        ly_class *obj = [[ly_class alloc] init]; \
        __VA_ARGS__ \
        obj ; \
    )\
}
//初始化View
#define GET_View_(ly_name, ly_superView, ly_backgroundColor, ...) \
- (UIView *)ly_name \
{ \
    ly_lazy_(ly_name,\
             UIView *obj = [[UIView alloc] init]; \
             [ly_superView addSubview:obj];\
             obj.backgroundColor = ly_backgroundColor; \
             __VA_ARGS__\
             obj; \
             ) \
}
//初始化MapView
#define GET_MapView_(ly_name, ly_superView, ...) \
GET_DIYObj_(MKMapView, ly_name, \
obj.mapType = MKMapTypeStandard; \
obj.frame = CGRectMake(0, 0, UIScreen_W, UIScreen_H); \
obj.delegate = self; \
[ly_superView addSubview:obj]; \
__VA_ARGS__\
)
//初始化LocationManager
#define GET_LocationManger_(ly_name, ly_distanceFilter, ly_desiredAccuracy, ...) \
GET_DIYObj_(CLLocationManager, ly_name, \
            [obj requestWhenInUseAuthorization]; \
            obj.delegate = self; \
            if([UIDevice currentDevice].systemVersion.floatValue >= 9.0){ \
                [obj allowsBackgroundLocationUpdates]; \
            } \
            obj.distanceFilter = ly_distanceFilter; \
            obj.desiredAccuracy = ly_desiredAccuracy; \
            __VA_ARGS__\
            )
/**************************************/
//初始化非全局控件
#define NEW_Class_(ly_class,...) \
({\
    ly_class *obj  = [[ly_class alloc] init];  \
    __VA_ARGS__\
    obj; \
});
/**************************************/
//baseif
#define ly_if_(name, ...) \
if (name) { \
__VA_ARGS__\
}
//baseLazy
#define ly_lazy_(ly_name, ...) \
if (!_##ly_name) { \
    _##ly_name = ({ \
        __VA_ARGS__\
    }); \
} \
return _##ly_name; \





