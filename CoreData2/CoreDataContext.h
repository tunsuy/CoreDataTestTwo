//
//  CoreDataContext.h
//  CoreData2
//
//  Created by tunsuy on 14/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataContext : NSObject

+ (void)saveContext:(NSManagedObjectContext *)context;

@end
