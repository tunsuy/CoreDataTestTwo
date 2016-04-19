//
//  CoreDataManagerProtocol.h
//  CoreData2
//
//  Created by tunsuy on 13/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CoreDataManagerProtocol <NSObject>

- (void)insertExistObj:(id)obj withUserData:(NSDictionary *)userData;

@end
