//
//  MMMenuLet.h
//  MyMood
//
//  Created by Lunayo on 09/01/2013.
//  Copyright (c) 2013 Lunayo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMenuLet : NSObject {
    NSMenuItem *_menuItem;
    IBOutlet NSMenu *_menu;
    
    NSStatusItem *_statusItem;
    NSImage *_menuIcon;
}


@end
