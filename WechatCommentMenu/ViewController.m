//
//  ViewController.m
//  WechatCommentMenu
//
//  Created by xubojoy on 2016/11/28.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIView+SDAutoLayout.h"
#import "SDTimeLineCellOperationMenu.h"
@interface ViewController ()
{
    SDTimeLineCellOperationMenu *_operationMenu;
}
@property (strong, nonatomic) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.backgroundColor=[UIColor purpleColor];
    [self.btn addTarget:self action:@selector(operationButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.width.equalTo(@100);
        //        make.height.mas_equalTo(100);
        //上面两行代码可缩写成下面的一行代码
        //                make.width.height.equalTo(@100);
        //也可写成下面的一行代码
        make.size.mas_equalTo(50);
        make.right.equalTo(self.view.mas_right).and.with.offset(-20);
        make.top.equalTo(self.view).offset(100);
    }];
    
    _operationMenu = [SDTimeLineCellOperationMenu new];
    [_operationMenu setLikeButtonClickedOperation:^{
        NSLog(@">>>>>>>>点击👍");
    }];
    [_operationMenu setCommentButtonClickedOperation:^{
        NSLog(@">>>>>>>>点击评论");
    }];
    [self.view addSubview:_operationMenu];
    _operationMenu.sd_layout
    .rightSpaceToView(self.btn, 0)
    .heightIs(30)
    .centerYEqualToView(self.btn)
    .widthIs(0);

}
- (void)operationButtonClicked
{
    _operationMenu.show = !_operationMenu.isShowing;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
