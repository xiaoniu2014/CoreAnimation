//
//  RootViewController.m
//  CoreAnimation
//
//  Created by hw on 15/10/20.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()

@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) NSArray *selectorNameArray;

@end

@implementation RootViewController
static NSString *identifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = @[@"事务动画",@"基础动画",@"关键帧动画",@"动画组",@"过渡动画"];
    
    NSArray *selector0 = @[@"位移"];
    
    NSArray *selector1 = @[@"变形金刚",
                          @"活塞运动",
                          @"旋转",
                          @"位移",
                          ];
    NSArray *selector2 = @[@"淘宝加入购物车"];
    
    NSArray *selector3 = @[@"变色",
                          @"位移",
                          @"模仿饿了么",
                          @"模仿卸载抖动",
                          ];
    
    
    
    NSArray *selector4 = @[@"水波"];
    
    
    self.dataSource = @[selector0,selector1,selector2,selector3,selector4];
    
    NSArray *section0 = @[@"transaction"];
    
    NSArray *section1 = @[@"basicanimationBounds",
                          @"basicanimationPosition",
                          @"basicanimationTransformRotation",
                          @"basicanimationTransformTranslation",
                          ];
    NSArray *section2 = @[@"animationGroup"];
    
    NSArray *section3 = @[@"keyframeAnimationColor",
                          @"keyframeAnimationPosition",
                          @"keyframeAnimationPath",
                          @"keyframeAnimationShark",
                          ];
    
    NSArray *section4 = @[@"transition"];
    
    
    self.selectorNameArray = @[section0,section1,section2,section3,section4];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
}

#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titleArray[section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataSource[indexPath.section][indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *vc = [[ViewController alloc] init];
    
    NSString *seletorName = self.selectorNameArray[indexPath.section][indexPath.row];
    vc.selectorName = seletorName;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
