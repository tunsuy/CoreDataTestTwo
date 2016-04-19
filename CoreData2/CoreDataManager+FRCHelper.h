//
//  CoreDataManager+FRCHelper.h
//  CoreData2
//
//  Created by tunsuy on 15/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager (FRCHelper)

- (NSInteger)numberOfSectionsWithModelName:(NSString *)modelName;
- (NSInteger)numberOfRowsWithModelName:(NSString *)modelName inSection:(NSInteger)section;
- (id)objectWithModelName:(NSString *)modelName atIndexPath:(NSIndexPath *)indexPath;

@end
