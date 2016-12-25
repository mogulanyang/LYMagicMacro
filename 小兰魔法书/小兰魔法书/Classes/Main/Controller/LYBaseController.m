//  github<https://github.com/mogulanyang>
//  微博<http://weibo.com/u/1806924330?refer_flag=1001030101_>
//  LYBaseController.m
//  一个良好的编码习惯很重要
//
//  Created by 兰洋 on 2016/12/24.
//  Copyright © 2016年 lanyang. All rights reserved.
//

#import "LYBaseController.h"
#import "Person.h"

@interface LYBaseController ()<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>
// 声明普通字典
Dictionary_(dataDict)
// 初始化普通字典
mDictionary_(dataDictM)
// 初始化button
Button_(addBtn)
// 初始化label
Label_(nameLabel)
// 初始化自定义对象
DIYObj_(Person, p)
// 初始化tableView
TableView_(mainTableView)
// 初始化collectionViewFlowLayout
FlowLayout_(mainFlowLayout)
// 初始化collectionView
CollectionView_(mainCollectionView)
@end

@implementation LYBaseController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - UI层
- (void)setupUI
{
    self.view.backgroundColor = UIColorWithHex16_(0xefefef);
}

- (void)addBtnClick:(UIButton *)sender
{
    NSLog(@"%@",sender);
    
}

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
#pragma mark - tableView和collectionView的数据源方法和代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    cell.backgroundColor = UIColorWithRandom;
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = UIColorWithRandom;
    return cell;
}

@end
