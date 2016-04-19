//
//  TextOperateHelper.m
//  CoreData2
//
//  Created by tunsuy on 12/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "TextOperateHelper.h"

@implementation TextOperateHelper

+ (CGFloat)calculateHeight:(NSString *)textStr {
    CGSize showSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-kTextMargin*2, MAXFLOAT);
    NSDictionary *attributesDic = @{NSFontAttributeName: [UIFont systemFontOfSize:kCreateDataViewControllerFontSize]};
    CGRect rect = [textStr boundingRectWithSize:showSize options:NSStringDrawingTruncatesLastVisibleLine attributes:attributesDic context:nil];
    
    return rect.size.height;
}

@end
