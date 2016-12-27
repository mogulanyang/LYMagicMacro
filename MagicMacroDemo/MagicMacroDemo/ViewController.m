//
//  ViewController.m
//  MagicMacroDemo
//
//  Created by 兰洋 on 2016/12/27.
//  Copyright © 2016年 lanyang. All rights reserved.
//

#import "ViewController.h"
#import "LYMagicMacro.h"
#import "LYDiyView.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>
// 声明tableView
TableView_(upTableView)
// 声明collectionView
CollectionView_(downCollectionView)
// 声明flowLayout
FlowLayout_(downLayout)
// 声明button
Button_(backBtn)
// 声明TextField
TextField_(nameField)
// 声明imageView
ImageView_(imageView)
// 自定义View
DIYObj_(LYDiyView, lyView)
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
    self.title = @"魔法";

    [self configUI];
}

#pragma mark - 设置UI
- (void)configUI
{
    [self upTableView];
    [self downCollectionView];
    [self backBtn];
    [self nameField];
    [self imageView];
    [self lyView];
    
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
    NSLog(@"%@",array);
}

#pragma mark - 懒加载控件
// 懒加载tableView
GET_TableView_(upTableView, self.view,UITableViewStylePlain,
               obj.frame = CGRectMake(0, 0, UIScreen_W, UIScreen_H/3);
               [obj registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableID"];
               )
// 懒加载flowlayout
GET_FlowLayout_(downLayout,
                UICollectionViewScrollDirectionVertical,
                CGSizeMake((UIScreen_W-20)/4, (UIScreen_W-20)/4), 5, 5,
                )
// 懒加载collectionView
GET_CollectionView_(downCollectionView, self.view, self.downLayout, [UIColor whiteColor],
                    obj.frame = CGRectMake(0, UIScreen_H/3, UIScreen_W, UIScreen_H/3);
                    [obj registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionID"];
                    obj.backgroundColor = [UIColor grayColor];
                    )
// 懒加载button
GET_Button_(backBtn, self.view, @selector(backClick), nil, @"back", 15, [UIColor whiteColor],
            obj.backgroundColor = [UIColor blackColor];
            obj.frame = CGRectMake(0, UIScreen_H*2/3 + 10, 60, 44);
            )
// 懒加载textFiled
GET_TextField_(nameField, self.view, 15, @"请输入小兰魔法宏",
               obj.frame = CGRectMake(0, UIScreen_H*2/3+60, 150,35);
               obj.clearButtonMode = UITextFieldViewModeAlways;
               )
// 懒加载imageView
GET_ImageView_(imageView, self.view, @"mo",
               [obj sizeToFit];
               obj.frame = CGRectMake(160, UIScreen_H*2/3+60, 100, 100);
               )
// 懒加载自定义LYView
GET_DIYObj_(LYDiyView, lyView,
            [self.view addSubview:obj];
            obj.backgroundColor = [UIColor purpleColor];
            obj.frame = CGRectMake(280, UIScreen_H*2/3+60, 169, 44);
            )


#pragma mark - 按钮的点击方法
- (void)backClick
{
    NSLog(@"点击了backClick按钮");
}

#pragma mark - tableView和collectionView的数据源代理方法
// tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableID"];
    cell.backgroundColor = UIColorWithRandom;
    return cell;
}

// collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionID" forIndexPath:indexPath];
    cell.backgroundColor = UIColorWithRandom;
    
    return cell;
}
@end
