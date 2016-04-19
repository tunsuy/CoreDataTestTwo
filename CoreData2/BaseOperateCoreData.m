//
//  BaseOperateCoreData.m
//  CoreData2
//
//  Created by tunsuy on 13/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "BaseOperateCoreData.h"
#import "CoreDataManagerProtocol.h"
#import "CoreDataContext.h"

@implementation BaseOperateCoreData

+ (void)insertDatabasesWithModelName:(NSString *)modelName userData:(NSDictionary *)dataDic{
    AppDelegate *appDelegate = [[AppDelegate alloc] init];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSFetchedResultsController *fetchedResultsController = [CoreDataManagerInstance fetchedResultsControllerWithModelName:modelName];
    NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
    
    id obj = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    if (!obj) {
        return;
    }
    
    if (!dataDic) {
        return;
    }
    
    __weak id<CoreDataManagerProtocol> protocolObj= obj;
    if ([protocolObj respondsToSelector:@selector(insertExistObj:withUserData:)]) {
        [protocolObj insertExistObj:obj withUserData:dataDic];
    }
    
    [CoreDataContext saveContext:context];
}

@end
