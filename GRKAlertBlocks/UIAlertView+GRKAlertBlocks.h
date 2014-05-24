//
//  UIAlertView+GRKAlertBlocks.h
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

#import <UIKit/UIKit.h>

@interface UIAlertView (GRKAlertBlocks)

/**
 Create an instance of a UIAlert with the given title and message.
 @param title The alert title.
 @param message The alert message body.
 */
+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message;

/**
 Sequentially adds a button to the alert with the given button title and optional handler block.
 @param title The title of the button being added.
 @param handler A block to be executed in the event the added button is used to dismiss the alert. This can be `nil` if no additional handling is needed.
 @note The first button added will be considered the "cancel" button. In the event the alert is canceled by the OS the handler block will be called. To prevent this behavior simply use the `cancelButtonIndex` property to set the index to -1 (the `UIAlert` default).
 */
- (void)addButtonWithTitle:(NSString *)title handler:(void(^)(UIAlertView *alert))handler;

@end