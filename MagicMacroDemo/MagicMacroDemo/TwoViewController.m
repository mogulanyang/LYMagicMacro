//  github<https://github.com/mogulanyang>
//  微博<http://weibo.com/u/1806924330?refer_flag=1001030101_>
//  TwoViewController.m
//  MagicMacroDemo
//
//  Created by 兰洋 on 2016/12/27.
//  Copyright © 2016年 lanyang. All rights reserved.
//

#import "TwoViewController.h"
#import "LYDiyView.h"

@interface TwoViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>
// 声明tableView
@property(nonatomic, strong)UITableView *upTableView;
// 声明collectionView
@property(nonatomic, strong)UICollectionView *downCollectionView;
// 声明flowLayout
@property(nonatomic, strong)UICollectionViewFlowLayout *downLayout;
// 声明button
@property(nonatomic, strong)UIButton *backBtn;
// 声明TextField
@property(nonatomic, strong)UITextField *nameField;
// 声明imageView
@property(nonatomic, strong)UIImageView *imageView;
// 声明自定义View
@property(nonatomic, strong)LYDiyView *lyView;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
    self.title = @"普通";
    
    [self configUI];
}

- (void)configUI
{
    [self.upTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableID"];
    self.upTableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3);
    self.upTableView.delegate = self;
    self.upTableView.dataSource = self;
    self.upTableView.rowHeight = 54;
    [self.view addSubview:self.upTableView];
    
    
    self.downCollectionView.backgroundColor = [UIColor grayColor];
    [self.downCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionID"];
    self.downCollectionView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height/3+5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3);
    self.downCollectionView.delegate = self;
    self.downCollectionView.dataSource = self;
    [self.view addSubview:self.downCollectionView];
    
    
    self.backBtn.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height*2/3+10, 60, 44);
    [self.backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backBtn];
    
    self.nameField.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height*2/3+60, 150,35);
    [self.view addSubview:self.nameField];
    
    self.imageView.frame = CGRectMake(160, [UIScreen mainScreen].bounds.size.height*2/3+60, 100, 100);
    [self.view addSubview:self.imageView];

    self.lyView.backgroundColor = [UIColor purpleColor];
    self.lyView.frame = CGRectMake(280, [UIScreen mainScreen].bounds.size.height*2/3+60, 130, 44);
    [self.view addSubview:self.lyView];
    
    
    // 非懒加载创建属性
    NSMutableArray *arrayM = [NSMutableArray array];
    [arrayM addObject:@"value1"];
    [arrayM addObject:@"value2"];
    NSLog(@"%@",arrayM);
    
    NSArray *array = arrayM.copy;
    NSLog(@"%@",array);
}

#pragma mark - 懒加载控件
// 懒加载tableView
- (UITableView *)upTableView
{
    if (!_upTableView) {
        _upTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3) style:UITableViewStylePlain];
    }
    return _upTableView;
}
// 懒加载flowLayout
- (UICollectionViewFlowLayout *)downLayout
{
    if (!_downLayout) {
        _downLayout = [[UICollectionViewFlowLayout alloc] init];
        _downLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _downLayout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20)/4, ([UIScreen mainScreen].bounds.size.width - 20)/4);
        _downLayout.minimumLineSpacing = 5;
        _downLayout.minimumInteritemSpacing = 5;
        _downLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _downLayout;
}
// 懒加载collectionView
- (UICollectionView *)downCollectionView
{
    if (!_downCollectionView) {
        _downCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3) collectionViewLayout:self.downLayout];
    }
    return _downCollectionView;
}


- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setTitle:@"Normal" forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _backBtn.backgroundColor = [UIColor whiteColor];
        self.backBtn.backgroundColor = [UIColor blackColor];
        [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    };
    return _backBtn;
}

-(UITextField *)nameField
{
    if (!_nameField) {
        _nameField = [[UITextField alloc] init];
        _nameField.placeholder = @"普通布局";
        _nameField.borderStyle = UITextBorderStyleRoundedRect;
        _nameField.font = [UIFont fontWithName:@"Arial" size:15]; // 设置属性
        _nameField.clearButtonMode = UITextFieldViewModeAlways; // 带X模式
    }
    return _nameField;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"pu"];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}
- (LYDiyView *)lyView
{
    if (!_lyView) {
        _lyView = [[LYDiyView alloc] init];
        _lyView.backgroundColor = [UIColor greenColor];
    }
    return _lyView;
}


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
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
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
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
    return cell;
}
@end
