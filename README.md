![logo](https://github.com/mogulanyang/LYMagicMacro/blob/master/sucai/magic.png)
# LYMagicMacro
如果没有,该如何创建?
## 功能
**快速声明和初始化控件的宏定义.**  

蝇量级,低耦合,项目仅1个文件,且不需任何分类和依赖库.

## 集成
将LYMagicMacro.h拖入文件,pch中导入即可
```
#import "LYMagicMacro.h"
```

## 使用方法
###声明属性
```
// 声明普通字典
Dictionary_(dataDict)
// 声明普通字典
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
###懒加载初始化控件
```
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
