//
//  ViewController.m
//  NetworkTest
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 anran. All rights reserved.
//

#import "ViewController.h"
#import "HttpManager.h"

@interface ViewController ()<NSURLSessionDataDelegate>

@property(nonatomic,copy)NSString *etag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    [btn setTitle:@"AFNetworking" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnClicked {
    NSString *urlString = @"https://192.168.1.115:84/miracle/changelogin.action";
    NSMutableDictionary *user = [NSMutableDictionary dictionary];
    
    [user setObject:@"18325752695" forKey:@"phone"];
    
    [user setObject:@"123456" forKey:@"psw"];
    HttpManager *httpManager = [HttpManager shareHttpManager];
    [httpManager post:urlString withParameters:user success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failure");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
