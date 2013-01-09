--
--  MMAppDelegate.applescript
--  MyMood
--
--  Created by Lunayo on 09/01/2013.
--  Copyright (c) 2013 Lunayo. All rights reserved.
--

script MMAppDelegate
	property parent : class "NSObject"
    property _timer : class "NSTimer"
    property _webView : missing value
    property _aNotification : missing value
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
        tell _webView to setMainFrameURL_("http://douban.fm/radio")
        _timer's scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(5, me, "timerDidFire:", missing value, true)
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate_
    
    on timerDidFire_(theTimer)
        
        set adiumIsRunning to false
        tell application "System Events"
            try
                first process whose bundle identifier is "com.adiumX.adiumX"
                set adiumIsRunning to true
            end try
        end tell
        
        set messagesIsRunning to false
        tell application "System Events"
            try
                first process whose bundle identifier is "com.apple.iChat"
                set messagesIsRunning to true
            end try
        end tell
        
        set skypeIsRunning to false
        tell application "System Events"
            try
                first process whose bundle identifier is "com.skype.skype"
                set skypeIsRunning to true
            end try
        end tell
        
        tell application "Google Chrome"
            tell window 1
                tell tab 1
                    set moodMessage to ""
                    execute javascript "document.title"
                    if moodMessage is not title then
                        set moodMessage to title
                        
                        if messagesIsRunning then
                            try
                                set mood to " \"♫  " & moodMessage & "\""
                                set aScript to "tell application id \"com.apple.iChat\"
                                set status message to " & mood & "
                            end tell" as text
                            run script aScript
                        end try
                    end if
                    
                    if adiumIsRunning then
                        try
                            set mood to " \"♫  " & moodMessage & "\""
                            set aScript to "tell application id \"com.adiumX.adiumX\"
                            set set the status message of every account to " & mood & "
                        end tell" as text
                        run script aScript
                    end try
                end if
                
                
                if skypeIsRunning then
                    try
                        set mood to " \"SET PROFILE MOOD_TEXT (music)  " & moodMessage & " \" "
                        set aScript to "tell application id \"com.skype.skype\"
                        send command " & mood & " script name \"MyMood\"
                    end tell" as text
                    run script aScript
                end try
            end if
            
        end if
    end tell
end tell
end tell
end timerDidFire_

end script