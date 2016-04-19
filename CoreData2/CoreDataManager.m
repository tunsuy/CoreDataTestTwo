//
//  FetchedResultsController.m
//  CoreData2
//
//  Created by tunsuy on 12/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "CoreDataManager.h"

#define kFetchBatchSize 200

static NSString *const fetchCacheName = @"Blog";

@interface CoreDataManager()<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation CoreDataManager

- (instancetype)init {
    if (self = [super init]) {
        _appDelegate = [[AppDelegate alloc] init];
    }
    return self;
}

+ (instancetype)shareInstance {
    static CoreDataManager *coreDataManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        coreDataManager = [[CoreDataManager alloc] init];
    });
    return coreDataManager;
}

- (NSFetchedResultsController *)fetchedResultsControllerWithModelName:(NSString *)modelName {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:modelName inManagedObjectContext:context];
    request.entity = entity;
    request.fetchBatchSize = kFetchBatchSize;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    request.sortDescriptors = @[sort];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:fetchCacheName];
            fetchedResultsController.delegate = self;
    
    return fetchedResultsController;
}

//- (instancetype)initWithModelName:(NSString *)modelName {
//    self = [super init];
//    if (self) {
//        NSFetchRequest *request = [[NSFetchRequest alloc] init];
//        
//        NSEntityDescription *entity = [NSEntityDescription entityForName:modelName inManagedObjectContext:self.appDelegate.managedObjectContext];
//        request.entity = entity;
//        request.fetchBatchSize = kFetchBatchSize;
//        
//        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
//        request.sortDescriptors = @[sort];
//        
//        NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.appDelegate.managedObjectContext sectionNameKeyPath:nil cacheName:fetchCacheName];
//        fetchedResultsController.delegate = self;
//        self.fetchedResultsController = fetchedResultsController;
//        
//        NSError *error = nil;
//        if (![self.fetchedResultsController performFetch:&error]) {
//            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//            abort();
//        }
//        
//    }
//    return self;
//}
//
//- (instancetype)init {
//    return [self initWithModelName:nil];
//}

@end
