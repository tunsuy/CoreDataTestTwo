
//
//  CoreDataContext.m
//  CoreData2
//
//  Created by tunsuy on 14/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "CoreDataContext.h"

@implementation CoreDataContext

+ (void)saveContext:(NSManagedObjectContext *)context {
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error: %@, %@", error, [error userInfo]);
    }
}

@end
