//
//  BaseOperateCoreData.h
//  CoreData2
//
//  Created by tunsuy on 13/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseOperateCoreData : NSObject

+ (void)insertDatabasesWithModelName:(NSString *)modelName userData:(NSDictionary *)dataDic;

@end
