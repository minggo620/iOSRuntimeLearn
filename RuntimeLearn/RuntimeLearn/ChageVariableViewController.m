//
//  ChageVariableViewController.m
//  RuntimeLearn
//
//  Created by minggo on 16/1/19.
//  Copyright © 2016年 minggo. All rights reserved.
//

#import "ChageVariableViewController.h"
#import "XiaoMing.h"

@interface ChageVariableViewController ()
- (IBAction)changeName:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property(nonatomic,retain) XiaoMing *xiaoMing;
@end

@implementation ChageVariableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.xiaoMing = [XiaoMing new];
    self.xiaoMing.englishName = @"XiaoMing";
    
    NSLog(@"XiaoMing first answer is %@",self.xiaoMing.englishName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)answer{
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([self.xiaoMing class], &count);
    for (int i = 0; i<count; i++) {
        Ivar var = ivar[i];
        const char *varName = ivar_getName(var);
        NSString *name = [NSString stringWithUTF8String:varName];
        
        if ([name isEqualToString:@"_englishName"]) {
            object_setIvar(self.xiaoMing, var, @"Minggo");
            break;
        }
    }
    NSLog(@"XiaoMing first answer is %@",self.xiaoMing.englishName);
    self.nameTf.text = self.xiaoMing.englishName;
}

- (IBAction)changeName:(id)sender {
    [self answer];
}
@end
