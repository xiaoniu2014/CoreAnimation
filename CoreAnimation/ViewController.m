//
//  ViewController.m
//  CoreAnimation
//
//  Created by hw on 15/10/20.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "ViewController.h"
#import "AnimationLibrary.h"

@interface ViewController ()

@property (nonatomic,strong) CALayer *myLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 94, 50, 50);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    layer.cornerRadius = 25;
    layer.masksToBounds = YES;
    layer.contents = (id)[UIImage imageNamed:@"AppIcon60x60"].CGImage;
    [self.view.layer addSublayer:layer];
    self.myLayer = layer;
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(beginAnimation)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)beginAnimation{
    SEL selector =  NSSelectorFromString(self.selectorName);
    AnimationLibrary *animationLib = [AnimationLibrary sharedAnimationLibrary];
    animationLib.layer = self.myLayer;
    [animationLib performSelectorOnMainThread:selector withObject:nil waitUntilDone:YES];
    
}


@end
