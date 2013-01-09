--
--  MMAppDelegate.applescript
--  MyMood
--
--  Created by Lunayo on 09/01/2013.
--  Copyright (c) 2013 Lunayo. All rights reserved.
--

script MMAppDelegate
	property parent : class "NSObject"
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script