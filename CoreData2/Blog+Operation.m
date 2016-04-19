//
//  Blog+Operation.m
//  CoreData2
//
//  Created by tunsuy on 13/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "Blog+Operation.h"
#import "BaseOperateCoreData.h"

@implementation Blog (Operation)

- (void)insertExistObj:(id)obj withUserData:(NSDictionary *)userData {
    if (![obj isKindOfClass:[Blog class]]) {
        return;
    }
    if (![userData isKindOfClass:[NSDictionary class]]) {
        return;
    }
    Blog *blogObj = obj;
    blogObj.content = userData[@"content"];
    NSDate *date = [NSDate date];
    blogObj.date = date;
}

+ (void)createUserData:(NSDictionary *)userData withCallBack:(id)callBack {
    [BaseOperateCoreData insertDatabasesWithModelName:@"Blog" userData:userData];
}

@end
