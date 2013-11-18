//
//  GRKViewController.m
//  GRKAlertBlocksTestApp
//
//  Created by Levi Brown on 11/17/13.
//  Copyright (c) 2013 Levi Brown. All rights reserved.
//

#import "GRKViewController.h"
#import "UIAlertView+GRKAlertBlocks.h"

@interface GRKViewController ()

- (IBAction)stockAlertAction;
- (IBAction)grokinAlertAction;

@end

@implementation GRKViewController

- (IBAction)stockAlertAction
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tile" message:@"Message" delegate:self cancelButtonTitle:@"Foo" otherButtonTitles:@"Bar 0", nil];
    [alert show];
}

- (IBAction)grokinAlertAction
{
    UIAlertView *alert = [UIAlertView alertWithTitle:@"Title" message:@"Message"];
    [alert addButtonWithTitle:@"Foo" handler:^{
        NSLog(@"Foo!");
    }];
    [alert addButtonWithTitle:@"Bar" handler:^{
        NSLog(@"Bar!");
    }];
    [alert show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"alert dismissed with button index %d", buttonIndex);
}

@end
