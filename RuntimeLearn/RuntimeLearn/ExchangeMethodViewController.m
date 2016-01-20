//
//  ExchangeMethodViewController.m
//  RuntimeLearn
//
//  Created by minggo on 16/1/19.
//  Copyright © 2016年 minggo. All rights reserved.
//

#import "ExchangeMethodViewController.h"
#import "XiaoMing.h"
#import <objc/runtime.h>

@interface ExchangeMethodViewController ()
- (IBAction)changeAnswer:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property(nonatomic,retain) XiaoMing *xiaoMing;
@end

@implementation ExchangeMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.xiaoMing = [XiaoMing new];
    NSString *firstName = [self.xiaoMing firstSay];
    NSLog(@"XiaoMing:My name is %@",firstName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)answer{
    
    Method m1 = class_getInstanceMethod([self.xiaoMing class], @selector(firstSay));
    Method m2 = class_getInstanceMethod([self.xiaoMing class], @selector(secondSay));
    
    method_exchangeImplementations(m1, m2);
    NSString *secondName = [self.xiaoMing firstSay];
    
    self.nameTf.text = secondName;
    NSLog(@"XiaoMing:My name is %@",secondName);
}


- (IBAction)changeAnswer:(id)sender {
    [self answer];
}

@end
