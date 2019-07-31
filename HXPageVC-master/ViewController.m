//
//  ViewController.m
//  HXPageVC-master
//
//  Created by hexuan on 2019/7/30.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#import "ViewController.h"
#import "HMHHeaderScrollView.h"
#import "MainViewController.h"

@interface ViewController ()<UIScrollViewDelegate,HMHHeaderScrollViewDelegate>

@property(nonatomic,strong)NSArray *titles;

@property(nonatomic,strong)UIScrollView *contentScrollView;

@property(nonatomic,strong)HMHHeaderScrollView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.title = @"新闻列表";
    
    [self setUI];
    [self layout];
    [self getData];
    
    [self setupChildVC];
    [self addEvent];
    
    //默认显示第一个控制器
    [self.contentScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

- (void)setUI{
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.contentScrollView];
}

- (void)setupChildVC{
    NSArray *titles = self.titles;
    for (NSInteger index = 0; index < titles.count; index++) {
        MainViewController *orderVC = [[MainViewController alloc] init];
        orderVC.title = [titles safeObjectAtIndex:index];
        [self addChildViewController:orderVC];
    }
}

- (void)layout{
    self.headerView.frame  =CGRectMake(0, kNavHeight, kDeviceWidth, 50);
    self.contentScrollView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), kDeviceWidth, kDeviceHeight-kNavHeight-CGRectGetHeight(self.headerView.frame));
    self.contentScrollView.contentSize = CGSizeMake(kDeviceWidth * self.titles.count, 0);
}
- (void)getData{
    self.headerView.data = self.titles;
}
- (void)addEvent{}

//代码 scrollView结束滚动后调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidEndScrollingAnimation");
    
    CGFloat scrollW = scrollView.frame.size.width;
    
    CGFloat scrollH = scrollView.frame.size.height;
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //当前位置需要显示控制器的索引
    NSInteger index = offsetX / scrollW;
    
    //让对应的顶部标题居中
  
    [self.headerView updateSelectedBtnIndex:index];
    
    //当前位置需要显示控制器
    UIViewController *willShowVC = self.childViewControllers[index];
    
    //如果当前控制器已经显示过了
    if(willShowVC.isViewLoaded){return;}
    
    //显示控制器
    willShowVC.view.frame = CGRectMake(offsetX, 0, scrollW, scrollH);
    
    [self.contentScrollView addSubview:willShowVC.view];
    
    //    NSLog(@"添加[%@]控制器的view",willShowVC.title);
    
}

//人为因素滚动结束调取
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{}

- (void)checkView:(HMHHeaderScrollView *)checkView didSelectBtn:(HXNormalBtn *)button{
    
    CGFloat offsetX = button.tag * kDeviceWidth;
    
    [self.contentScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}


#pragma mark --- <getting>
- (HMHHeaderScrollView *)headerView{
    if (!_headerView) {
        _headerView = [[HMHHeaderScrollView alloc] init];
        _headerView.delegate = self;
        _headerView.disabledTitleColor = ThemeBgColor;
    }return _headerView;
}

- (UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.backgroundColor = [UIColor whiteColor];
        _contentScrollView.delegate = self;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = NO;
    }return _contentScrollView;
}

- (NSArray *)titles{
    if (!_titles) {
        _titles = @[@"体育新闻",@"科技新闻",@"娱乐新闻",@"时事新闻",@"赛事新闻"];
    }return _titles;
}



@end
