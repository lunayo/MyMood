//
//  MMMenuLet.m
//  MyMood
//
//  Created by Lunayo on 09/01/2013.
//  Copyright (c) 2013 Lunayo. All rights reserved.
//

#import "MMMenuLet.h"

@implementation MMMenuLet

-(void)dealloc {
    [_statusItem release];
    [super dealloc];
}

- (void)awakeFromNib {
    _statusItem = [[[NSStatusBar systemStatusBar]
                    statusItemWithLength:NSVariableStatusItemLength]
                   retain];
    [_statusItem setHighlightMode:YES];
    [_statusItem setEnabled:YES];
    [_statusItem setMenu:_menu];
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"MenuIcon" ofType:@"png"];
    _menuIcon= [[NSImage alloc] initWithContentsOfFile:path];
    [_statusItem setTitle:@""];
    [_statusItem setImage:_menuIcon];
    [_menuIcon release];
}


@end
