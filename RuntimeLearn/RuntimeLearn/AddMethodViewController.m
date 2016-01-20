//
//  AddMethodViewController.m
//  RuntimeLearn
//
//  Created by minggo on 16/1/19.
//  Copyright © 2016年 minggo. All rights reserved.
//

#import "AddMethodViewController.h"
#import "XiaoMing.h"

@interface AddMethodViewController ()
- (IBAction)addAnswer:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cityTf;
@property(nonatomic,retain) XiaoMing *xiaoMing;
@end

@implementation AddMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.xiaoMing = [XiaoMing new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)answer{
    class_addMethod([self.xiaoMing class], @selector(guess), (IMP)guessAnswer, "v@:");
    if ([self.xiaoMing respondsToSelector:@selector(guess)]) {
        //Method method = class_getInstanceMethod([self.xiaoMing class], @selector(guess));
        [self.xiaoMing performSelector:@selector(guess)];
        
    } else{
        NSLog(@"Sorry,I don't know");
    }
    self.cityTf.text = @"GuangTong";
}

void guessAnswer(id self,SEL _cmd){
   
    NSLog(@"He is from GuangTong");
    
}

- (IBAction)addAnswer:(id)sender {
    [self answer];
}
@end
