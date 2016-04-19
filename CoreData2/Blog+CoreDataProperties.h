//
//  Blog+CoreDataProperties.h
//  CoreData2
//
//  Created by tunsuy on 13/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Blog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Blog (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSDate *date;

@end

NS_ASSUME_NONNULL_END
