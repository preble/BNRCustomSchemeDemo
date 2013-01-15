//
//  AppDelegate.m
//  BNRCustomSchemeDemo
//
//  Created by Adam Preble on 1/15/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic) NSString *text; // NSTextField's value is bound to this property.
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSAppleEventManager *eventManager = [NSAppleEventManager sharedAppleEventManager];
	[eventManager setEventHandler:self
					  andSelector:@selector(handleGetURLEvent:withReplyEvent:)
					forEventClass:kInternetEventClass
					   andEventID:kAEGetURL];
	self.text = @"Ready! Open a URL like bnr-custom://hello in Safari to test.\n--\n";
}

- (void)handleGetURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
	NSString *urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
	NSURL *url = [NSURL URLWithString:urlString];
	
	self.text = [self.text stringByAppendingFormat:@"%@ %@\n", [NSDate date], url];
}

@end
