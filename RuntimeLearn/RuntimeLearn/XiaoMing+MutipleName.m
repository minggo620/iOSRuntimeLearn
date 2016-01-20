//
//  XiaoMing+MutipleName.m
//  RuntimeLearn
//
//  Created by minggo on 16/1/20.
//  Copyright © 2016年 minggo. All rights reserved.
//

#import "XiaoMing+MutipleName.h"
#import <objc/runtime.h>

@implementation XiaoMing (MutipleName)

char cName;

-(void)setChineseName:(NSString *) chineseName{
    objc_setAssociatedObject(self, &cName, chineseName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)chineseName{
    return objc_getAssociatedObject(self, &cName);
}

@end
