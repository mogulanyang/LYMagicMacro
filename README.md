![logo](https://github.com/mogulanyang/LYMagicMacro/blob/master/sucai/magic.png)
# LYMagicMacro

**你还在一次一次的写无数行代码进行控件的创建,添加,布局么?**

**你还在一次一次的进行属性的声明么?**

**小兰魔法宏,一个.h文件,解决你的绝大部分烦恼.**

ps:小兰魔法宏现今维护中.致力于让体验者忘掉分类,拒绝耦合,添加更多更方便的功能,更轻量级.我也会修复一些漏洞使他更安全,更方便,更简单.

如果你发现了什么bug或者不足之处,欢迎各种邮件骚扰:lanyang0829@163.com
## 功能
**快速声明和初始化控件的宏定义.**  

蝇量级,低耦合,项目仅1个文件,且不需任何分类和依赖库.

## 集成
将LYMagicMacro.h拖入文件,pch中导入即可
```objc
#import "LYMagicMacro.h"
```

## 使用方法
##声明属性
```objc
XXX_()声明,如果是自定义对象使用DIYObj_(对象名).
// 声明普通字典
Dictionary_(dataDict)
// 声明可变字典
mDictionary_(dataDictM)
// 声明button
Button_(addBtn)
// 声明label
Label_(nameLabel)
// 声明自定义对象
DIYObj_(Person, p)
// 声明tableView
TableView_(mainTableView)
// 声明collectionViewFlowLayout
FlowLayout_(mainFlowLayout)
// 声明collectionView
CollectionView_(mainCollectionView)
// 还有其他....
```
##普通初始化
```objc
NEW_Class_(类名)方法,如果你需要添加额外的属性,括号里面,使用obj来添加各种属性即可.
// 不使用懒加载,创建可变数组并添加属性
NSMutableArray *arrayM = NEW_Class_(NSMutableArray,
                            [obj addObject:@"value1"];
                            [obj addObject:@"value2"];
                            NSLog(@"%@",obj)
                            )
// 创建普通数组
NSArray *array = NEW_Class_(NSArray,
                    obj = arrayM.copy;
                    )
```
##懒加载初始化控件
```objc
GET_XXX_(...)方法,如果你需要添加额外的属性,括号里面,使用obj来添加各种属性即可.

#pragma mark - 懒加载初始化
// 懒加载button
GET_Button_(addBtn,
            self.view, @selector(addBtnClick:), @"touxiang", @"你好", 14, [UIColor blueColor],
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.center.equalTo(self.view);
            }];
            [obj sizeToFit];
            )

// 懒加载label
GET_Label_(nameLabel,
           self.view, @"sdsdfsdfsdf", UIColorWithRandom, 17,
           [obj mas_makeConstraints:^(MASConstraintMaker *make) {
             make.center.equalTo(self.view);
            }];
           )

// 懒加载普通字典
GET_Dictionary_(dataDict,
                obj = @{@"key":@"value"};
                )

// 懒加载可变字典
GET_mDictionary_(dataDictM,
                 obj = @{@"key2":@"value2"}.mutableCopy;
                 [obj setValue:@"value4" forKey:@"key4"];
                 )

// 初始化自定义对象
GET_DIYObj_(Person,p,
            NSLog(@"%@", obj);
            )

// 懒加载tableView
// 记得遵守tableView的数据源方法和代理方法
GET_TableView_(mainTableView,
               self.view, UITableViewStylePlain,
               [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.equalTo(self.view);
               }];
               obj.backgroundColor = [UIColor blueColor];
               [obj registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableCell"];
               )


// 懒加载flowlayout
GET_FlowLyout_(mainFlowLayout,
               UICollectionViewScrollDirectionVertical, CGSizeMake(100, 100), 0, 0)

// 懒加载collectionView
GET_CollectionView_(mainCollectionView,
                    self.view, self.mainFlowLayout, [UIColor orangeColor],
                    [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.equalTo(self.view);
                    }];
                    [obj registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
                    )
```
## 调用
```objc
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 布局,添加都不需要单独写.直接调用get方法即可.
    [self dataDict];
    [self dataDictM];
    [self addBtn];
    [self nameLabel];
    [self p];
    [self mainTableView];
    [self mainFlowLayout];
    [self mainCollectionView];
}
```
## 注意点
- 不要搬运初始化控件所使用的宏,会出现问题.如果需要搬运,请先将需要搬运的代码注释,再进行搬运,然后解开注释使用.
- 如果需要其他个性初始化,只需要在最后面加一个逗号,把需要添加的属性赋值给obj即可.
- 除此之外,小兰魔法宏还提供了一些简单的常用宏,如果不需要大可删除即可
