//
//  FLMallHeaderView.m
//  FLFightingLivePlatform
//
//  Created by 何旋 on 2019/6/15.
//  Copyright © 2019年 com. All rights reserved.
//

#import "HMHHeaderScrollView.h"

@interface HMHHeaderScrollView()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *titleScrollView;

/** 标签栏底部的红色指示器 */
@property (nonatomic, strong) UIView *indicatorView;

@property(nonatomic,strong)UIView *bottemLineView;

@property(nonatomic,strong)NSArray *dataArrays;

/** 当前选中的按钮 */
@property (nonatomic, strong) HXNormalBtn *selectedButton;

@property(nonatomic,strong)NSMutableArray *btns;

@property(nonatomic,assign)CGFloat maxWidth;

@end

@implementation HMHHeaderScrollView

- (instancetype)initWithMaxWidth:(CGFloat)maxWidth{
    self = [super init];
    if (self) {
         self.maxWidth = maxWidth;
         [self setup];
    }return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.maxWidth = kDeviceWidth;
        [self setup];
    }return self;
}

- (void)setup{
    self.lineViewColor = HMHLineBgColor;
    self.disabledTitleColor = [UIColor blackColor];
    self.normalTitleColor = HXTitleBgColor;
    self.normalTitleFont = KFont(17);
    self.disabledTitleFont = KFont(17);
    
    self.backgroundColor = [UIColor whiteColor];
    self.btns = [NSMutableArray array];
}


- (void)dataDidChange{
    
    if ([self.data isKindOfClass:[NSArray class]]) {
        
        self.dataArrays = self.data;
        
        [self setUI];
        [self layout];
        [self addEvent];
    }
}

- (CGFloat)getWidth:(NSArray *)dataArrays{
    
    CGFloat totalW = 0;
    
    for (NSString *title in dataArrays) {
        
        totalW += [title sizeFont:self.disabledTitleFont maxSize:CGSizeMake(MAXFLOAT, 30)].width + 10;
    }
    //totalW += (dataArrays.count + 1) * 10;
    
    return totalW;
}

- (void)setUI{
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = ThemeBgColor;
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = 47;
    self.indicatorView = indicatorView;
    
    CGFloat realTotalW = [self getWidth:self.dataArrays];
    CGFloat lastW = realTotalW + (self.dataArrays.count + 1) *10;
    
    CGFloat padding = (lastW < self.maxWidth)?(self.maxWidth -realTotalW)/(self.dataArrays.count + 1):10;
    
    CGFloat btnX = padding;
    CGFloat btnY = 0;
    CGFloat btnW = 0;
    CGFloat btnH = 47;
    
    for (NSInteger index = 0; index<self.dataArrays.count; index++) {
        
        NSString *btnTitle = [self.dataArrays safeObjectAtIndex:index];
       
        btnW = [btnTitle sizeFont:self.disabledTitleFont maxSize:CGSizeMake(MAXFLOAT, 30)].width + 10;
        
      //  btnH = [btnTitle sizeFont:[HMHCommonTool textFont] maxSize:CGSizeMake(MAXFLOAT, 30)].height;
        
        btnY = 0;
        
        HXNormalBtn *btn =  [HXNormalBtn createButtonWithFrame:CGRectMake(btnX, btnY, btnW, btnH) target:self selector:@selector(btnEvent:) text:btnTitle bgColor:[UIColor whiteColor] titleColor:self.normalTitleColor tag:index font:self.normalTitleFont];
        
        [btn setTitleColor:self.disabledTitleColor forState:UIControlStateDisabled];
        
        [btn.titleLabel sizeToFit];
        
        [self.titleScrollView addSubview:btn];
        
        [self.btns addObject:btn];
     
        btnX += (padding + btnW);
        
        if (index == 0) {
            
            btn.enabled = NO;
            self.selectedButton = btn;
            
            self.selectedButton.titleLabel.font = self.disabledTitleFont;
            self.indicatorView.width = btn.titleLabel.width;
            self.indicatorView.centerX = btn.centerX;
        }
    }
    
    self.bottemLineView.frame = CGRectMake(0, 49, self.maxWidth, 1);
    
    self.titleScrollView.contentSize = CGSizeMake(btnX, 0);
    [self addSubview:self.titleScrollView];
    [self addSubview:self.bottemLineView];
    [self.titleScrollView addSubview:indicatorView];
   
}
- (void)layout{}
- (void)getData{}
- (void)addEvent{}


- (void)updateSelectedBtnIndex:(NSInteger)index{
    
    HXNormalBtn *btn;
    
    for (HXNormalBtn *currentBtn in self.btns) {
        if (currentBtn.tag == index) {
            btn = currentBtn;
        }
    }
    [self btnEvent:btn];
}

- (void)btnEvent:(HXNormalBtn *)button{
    // 修改按钮状态
    self.selectedButton.enabled = YES;
    self.selectedButton.titleLabel.font = self.normalTitleFont;
    button.enabled = NO;
    self.selectedButton = button;
    self.selectedButton.titleLabel.font = self.disabledTitleFont;
    
    [self.selectedButton.titleLabel sizeToFit];
    
    if ([self.delegate respondsToSelector:@selector(checkView:didSelectBtn:)]) {
        [self.delegate checkView:self didSelectBtn:self.selectedButton];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
        //self.indicatorView.y = CGRectGetMaxY(button.frame)-2;
    }];
    
    
    //设置当前按钮居中显示
    CGFloat scrollW = self.titleScrollView.size.width;
    CGFloat scrollSizeW = self.titleScrollView.contentSize.width;
    if (scrollSizeW > scrollW) {
        CGPoint titleOffset = self.titleScrollView.contentOffset;
        titleOffset.x = self.selectedButton.center.x - scrollW * 0.5;
        
        //边界处理
        if (titleOffset.x < 0) {titleOffset.x  = 0;}
        CGFloat maxTitleOffsetX = self.titleScrollView.contentSize.width - scrollW;
        if (titleOffset.x > maxTitleOffsetX) {titleOffset.x = maxTitleOffsetX; }
        [self.titleScrollView setContentOffset:titleOffset animated:YES];
    }
}

#pragma mark ---- <getting>
- (void)setLineViewColor:(UIColor *)lineViewColor{
    _lineViewColor = lineViewColor;
}

- (void)setDisabledTitleColor:(UIColor *)disabledTitleColor{
    _disabledTitleColor = disabledTitleColor;
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor{
    _normalTitleColor = normalTitleColor;
}

- (void)setNormalTitleFont:(UIFont *)normalTitleFont{
    _normalTitleFont = normalTitleFont;
}

- (void)setDisabledTitleFont:(UIFont *)disabledTitleFont{
    _disabledTitleFont = disabledTitleFont;
}

- (UIScrollView *)titleScrollView{
    if (!_titleScrollView) {
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.maxWidth, 49)];
        _titleScrollView.backgroundColor = [UIColor whiteColor];
        _titleScrollView.delegate = self;
        _titleScrollView.pagingEnabled = NO;
        _titleScrollView.bounces = NO;
        _titleScrollView.showsHorizontalScrollIndicator = NO;
    }return _titleScrollView;
}


- (UIView *)bottemLineView{
    if (!_bottemLineView) {
        _bottemLineView = [[UIView alloc] init];
        _bottemLineView.backgroundColor = self.lineViewColor;
    }return _bottemLineView;
}


@end
