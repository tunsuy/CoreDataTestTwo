//
//  Blog+Operation.h
//  CoreData2
//
//  Created by tunsuy on 13/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "Blog.h"
#import "CoreDataManagerProtocol.h"

@interface Blog (Operation)<CoreDataManagerProtocol>

+ (void)createUserData:(NSDictionary *)userData withCallBack:(id)callBack;

@end
