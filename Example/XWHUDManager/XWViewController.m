//
//  XWViewController.m
//  XWHUDManager
//
//  Created by qxuewei on 08/16/2018.
//  Copyright (c) 2018 qxuewei. All rights reserved.
//

#import "XWViewController.h"

#import "XWHUDManager.h"

@interface XWViewController () <UITableViewDelegate,UITableViewDataSource>{
    NSArray *data;
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation XWViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    data = @[@"无限展示小菊花",@"在当前View展示一个小菊花",@"loading... 小菊花",@"显示隐藏自定义文本菊花",@"window上显示文本提示框",@"限时隐藏在view展示一个有文本提示框",@"正确提示正确提示正确提示正确提示正确提示正确提示正确提示",@"有文本正确提示有文本正确提示有文本正确提示有文本正确提示",@"错误提示",@"有文本错误提示",@"信息提示",@"警告提示",@"自定义图片",@"序列帧",@"GIF"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid=@"cellID";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell==nil){
        
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:rid];
    }
    cell.textLabel.text = data[indexPath.row];
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [timer invalidate];
    switch (indexPath.row) {
        case 0:
            [XWHUDManager showHUD];
            break;
        case 1:
            [XWHUDManager showHUDInView];
            break;
        case 2:
            [XWHUDManager showHUDLoadingEN];
            break;
        case 3:
            [XWHUDManager showHUDMessage:@"加载中..." afterDelay:1.5];
            break;
        case 4:
            [XWHUDManager showTipHUD:@"www.qiuxuewei.com"];
            break;
        case 5:
            [XWHUDManager showTipHUDInView:@"加油!" afterDelay:3];
            break;
        case 6:
            [XWHUDManager showSuccessHUD];
            break;
        case 7:
            [XWHUDManager showSuccessTipHUD:@"加载成功"];
            break;
        case 8:
            [XWHUDManager showErrorHUD];
            break;
        case 9:
            [XWHUDManager showErrorTipHUD:@"加载失败"];
            break;
        case 10:
            [XWHUDManager showInfoTipHUD:@"信息提示"];
            break;
        case 11:
            [XWHUDManager showWarningTipHUD:@"警告提示"];
            break;
        case 12:
        {
            UIImage *image = [UIImage imageNamed:@"wildcat_gif_1"];
            [XWHUDManager showCustomImageHUD:image message:@"这是张自定义图片"];
            break;
        }
        case 13:
        {
            NSMutableArray *array = [NSMutableArray array];
            for (NSInteger i = 1; i <= 6; i++) {
                [array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"wildcat_gif_%zd",i]]];
            }
            [XWHUDManager showCustomImagesHUD:array message:@"拼命加载中..."];
            break;
        }
        case 14:
        {
            [XWHUDManager showGifImagesHUD:@"loading@2x" message:@"GIF加载中..."];
            break;
        }
        default:
            break;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(hideMthod) userInfo:nil repeats:NO];
}

- (void)hideMthod {
    [XWHUDManager hide];
}

@end
