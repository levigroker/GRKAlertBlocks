//
//  UIAlertView+GRKAlertBlocks.m
//
//  Created by Levi Brown on 11/17/13.
//  Copyright (c) 2013 Levi Brown <mailto:levigroker@gmail.com>
//  This work is licensed under the Creative Commons Attribution 3.0
//  Unported License. To view a copy of this license, visit
//  http://creativecommons.org/licenses/by/3.0/ or send a letter to Creative
//  Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041,
//  USA.
//
//  The above attribution and the included license must accompany any version
//  of the source code. Visible attribution in any binary distributable
//  including this work (or derivatives) is not required, but would be
//  appreciated.
//

#import "UIAlertView+GRKAlertBlocks.h"
#import <objc/runtime.h>

@interface GRKAlertDelegate : NSObject

@property (nonatomic,strong) NSMutableDictionary *blocksByIndex;

@end

@implementation GRKAlertDelegate

- (NSMutableDictionary *)blocksByIndex
{
    if (!_blocksByIndex)
    {
        _blocksByIndex = [NSMutableDictionary dictionary];
    }
    return _blocksByIndex;
}

- (void)setHandler:(void(^)(UIAlertView *alert))handler forIndex:(NSInteger)index
{
    if (handler)
    {
        [self.blocksByIndex setObject:[handler copy] forKey:[NSNumber numberWithInteger:index]];
    }
    else
    {
        [self.blocksByIndex removeObjectForKey:[NSNumber numberWithInteger:index]];
    }
}

- (void(^)(UIAlertView *alert))handlerForIndex:(NSInteger)index
{
    void(^handler)(UIAlertView *alert) = NULL;
    
    if (_blocksByIndex)
    {
        handler = [self.blocksByIndex objectForKey:[NSNumber numberWithInteger:index]];
    }
    
    return handler;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    void(^handler)(UIAlertView *alert) = [self handlerForIndex:buttonIndex];
    if (handler)
    {
        handler(alertView);
    }
}

@end

@implementation UIAlertView (GRKAlertBlocks)

+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    GRKAlertDelegate *delegate = [[GRKAlertDelegate alloc] init];
    //Associate our delegate ojbject with the alert object to keep it in memory for the life of the alert
    objc_setAssociatedObject(alert, &delegate, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    alert.delegate = delegate;
    alert.title = title;
    alert.message = message;
    
    return alert;
}

- (void)addButtonWithTitle:(NSString *)title handler:(void(^)(UIAlertView *alert))hander
{
    NSInteger buttonIndex = [self addButtonWithTitle:title];
    
    if (buttonIndex == 0)
    {
        //Default the "cancel" button to the first button
        self.cancelButtonIndex = 0;
    }
    
    if ([self.delegate isKindOfClass:GRKAlertDelegate.class])
    {
        GRKAlertDelegate *delegate = self.delegate;
        [delegate setHandler:hander forIndex:buttonIndex];
    }
}

@end