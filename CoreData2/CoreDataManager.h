//
//  FetchedResultsController.h
//  CoreData2
//
//  Created by tunsuy on 12/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CoreDataManager : NSObject

//@property (nonatomic, readonly, strong) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)shareInstance;
- (NSFetchedResultsController *)fetchedResultsControllerWithModelName:(NSString *)modelName;


//- (instancetype)initWithModelName:(NSString *)modelName;

@end
