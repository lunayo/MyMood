//
//  main.m
//  MyMood
//
//  Created by Lunayo on 08/01/2013.
//  Copyright (c) 2013 Lunayo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, (const char **)argv);
}
