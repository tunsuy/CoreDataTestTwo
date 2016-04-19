//
//  CoreDataManager+FRCHelper.m
//  CoreData2
//
//  Created by tunsuy on 15/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "CoreDataManager+FRCHelper.h"

@interface CoreDataManager()

//@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation CoreDataManager (FRCHelper)



- (NSInteger)numberOfSectionsWithModelName:(NSString *)modelName {
    NSFetchedResultsController *fetchedResultsController = [CoreDataManagerInstance fetchedResultsControllerWithModelName:modelName];
    return [[fetchedResultsController sections] count];
}

- (NSInteger)numberOfRowsWithModelName:(NSString *)modelName inSection:(NSInteger)section {
    NSFetchedResultsController *fetchedResultsController = [CoreDataManagerInstance fetchedResultsControllerWithModelName:modelName];
    if (fetchedResultsController.sections.count <= section) {
        return 0;
    }
    id<NSFetchedResultsSectionInfo> sectionInfo = [fetchedResultsController.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (id)objectWithModelName:(NSString *)modelName atIndexPath:(NSIndexPath *)indexPath {
    NSFetchedResultsController *fetchedResultsController = [CoreDataManagerInstance fetchedResultsControllerWithModelName:modelName];
    return [fetchedResultsController objectAtIndexPath:indexPath];
    
}

@end
