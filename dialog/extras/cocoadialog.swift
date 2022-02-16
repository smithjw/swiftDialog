//
//  cocoadialog.swift
//  dialog
//
//  Created by Bart Reardon on 16/2/2022.
//

import Foundation


struct CDOptions {
    
    // dialog types
    
    static let CDmsgbox = "msgbox"
    static let CDokmsgbox = "ok-msgbox"
    static let CDyesnomsgbox = "yesno-msgbox"
    static let CDinputbox = "inputbox"
    static let CDstandardinputbox = "standard-inputbox"
    static let CDsecueinputbox = "secue-inputbox"
    static let CDprogressbar = "progressbar"
    static let CDdropdown = "dropdown"
    static let CDstandarddropdown = "standard-dropdown"
    static let CDfileselect = "fileselect"
    static let CDfilesave = "filesave"
    static let CDbubble = "bubble"
    
    
    // icon types
    static let CDIcon_cocoadialog   = (argument: String("cocoadialog"),     SFSymbol: String("cursorarrow.square"))
    static let CDIcon_atom          = (argument: String("atom"),            SFSymbol: String("atom"))
    static let CDIcon_computer      = (argument: String("computer"),        SFSymbol: String("desktopcomputer"))
    static let CDIcon_document      = (argument: String("document"),        SFSymbol: String("doc.text"))
    static let CDIcon_find          = (argument: String("find"),            SFSymbol: String("magnifyingglass"))
    static let CDIcon_finder        = (argument: String("finder"),          SFSymbol: String(""))
    static let CDIcon_firewire      = (argument: String("firewire"),        SFSymbol: String(""))
    static let CDIcon_folder        = (argument: String("folder"),          SFSymbol: String("folder.fill"))
    static let CDIcon_gear          = (argument: String("gear"),            SFSymbol: String("gearshape.fill"))
    static let CDIcon_globe         = (argument: String("globe"),           SFSymbol: String("globe"))
    static let CDIcon_hazard        = (argument: String("hazard"),          SFSymbol: String("exclamationmark.triangle.fill"))
    static let CDIcon_heart         = (argument: String("heart"),           SFSymbol: String("heart.fill"))
    static let CDIcon_hourglass     = (argument: String("hourglass"),       SFSymbol: String("hourglass"))
    static let CDIcon_info          = (argument: String("info"),            SFSymbol: String("info.circle.fill"))
    static let CDIcon_ipod          = (argument: String("ipod"),            SFSymbol: String("ipod"))
    static let CDIcon_person        = (argument: String("person"),          SFSymbol: String("person.fill"))
    static let CDIcon_sound         = (argument: String("sound"),           SFSymbol: String("speaker.wave.3.fill"))
    static let CDIcon_x             = (argument: String("x"),               SFSymbol: String("x.circle.fill"))

    
    // Global Options
    
    //‑‑title "text for title"    Sets the window's title
    static let CDstringOutput        = (long: String("string‑output"),      short: String(""),         value : String(""), present : Bool(false))
    static let CDnoNewline           = (long: String("no‑newline"),         short: String(""),         value : String(""), present : Bool(false))
    // --width
    // --height
    
    // msgbox
    static let CDinformativeText    = (long: String("informative‑text"),    short: String(""),         value : String(""), present : Bool(false))
    static let CDicon               = (long: String("icon"),                short: String(""),         value : String(""), present : Bool(false))
    static let CDfloat              = (long: String("float"),               short: String(""),         value : String(""), present : Bool(false))
    static let CDtimeout            = (long: String("timeout"),             short: String(""),         value : String(""), present : Bool(false))
    static let CDbutton1            = (long: String("button1"),             short: String(""),         value : String(""), present : Bool(false))
    static let CDbutton2            = (long: String("button2"),             short: String(""),         value : String(""), present : Bool(false))
    static let CDbutton3            = (long: String("button3"),             short: String(""),         value : String(""), present : Bool(false))
 
    // ok-msgbox
    // same as msgbox except the buttons are set to OK and Cancel for button1 and button2
    
    // yesno-msgbox
    // same as msgbox except the buttons are set to yes, no and cancel for button1, button 2 and button 3
    static let nocancel             = (long: String("no‑cancel"),           short: String(""),         value : String(""), present : Bool(false))
    
    // inputbox
    // same as msgbox - implies a single --textarea
    static let noshow               = (long: String("no‑show"),             short: String(""),         value : String(""), present : Bool(false))

    // standard-inputbox
    // same as inputbox except the buttons are set to OK and Cancel for button1 and button2
    
    // secure-inputbox
    // secure-standard-inputbox
    // alias for running an inputbox or secure-standard-inputbox with the --no-show option
    
    // fileselect
    // provides a file selection window
    // NOT IMPLEMENTED
    
    // filesave
    // provides a file save window
    // NOT IMPLEMENTED
    
    // textbox
    // This is a text box with a large text area.
    // NOT IMPLEMENTED
    
    // progressbar
    static let percent              = (long: String("percent"),             short: String(""),         value : String(""), present : Bool(false))
    static let indeterminate        = (long: String("indeterminate"),       short: String(""),         value : String(""), present : Bool(false))
    static let stoppable            = (long: String("stoppable"),           short: String(""),         value : String(""), present : Bool(false))
    
    // dropdown
    // same as msgbox - implies --selectvalues
    static let items                = (long: String("items"),               short: String(""),         value : String(""), present : Bool(false))
    static let pulldown             = (long: String("pulldown"),            short: String(""),         value : String(""), present : Bool(false))
    static let exitonchange         = (long: String("exit‑onchange"),       short: String(""),         value : String(""), present : Bool(false))
    
    // standard-dropdown
    // same as dropdown except the buttons are set to OK and Cancel for button1 and button2
}


public func convertFromCocoaDialogSyntax() {
    // read the cocoadialog syntax from the command line and populate the appropriate dialog values
    
    
    
}

/// Cocoadialog options

/*
 
Global Options
 
     ‑‑title "text for title"    Sets the window's title
     ‑‑string‑output    Makes yes/no/ok/cancel buttons return values as "Yes", "No", "Ok", or "Cancel" instead of integers. When used with custom button labels, returns the label you provided.
     ‑‑no‑newline    By default, return values will be printed with a trailing newline. This will suppress that behavior. Note that when a control returns multiple lines this will only suppress the trailing newline on the last line.
     ‑‑width integer    Sets the width of the window. It's not advisable to use this option without good reason, and some controls won't even respond to it. The automatic size of most windows should suffice.
     ‑‑height integer    Sets the height of the window. It's not advisable to use this option without good reason, and some controls won't even respond to it. The automatic size of most windows should suffice.
     ‑‑debug    If you are not getting the results you expect, try turning on this option. When there is an error, it will print ERROR: followed by the error message.
     ‑‑help    Gives a list of options and a link to this page.
 
 
msgbox
 
     ‑‑text "main text message"    This is the main, bold message text.
     ‑‑informative‑text "extra informative text to be displayed"    This is the extra, smaller message text.
     ‑‑icon stockIconName    The name of the stock icon to use. This is incompatible with --icon-file
     Default is no icon.
     ‑‑icon‑file "/full/path/to/icon file"    The full path to the custom icon image you would like to use. Almost every image format is accepted. This is incompatible with the --icon option.
     ‑‑float    Float on top of all windows.
     ‑‑timeout numSeconds    The amount of time, in seconds, that the window will be displayed if the user does not click a button.
     Does not time out by default.
     ‑‑button1 "label for button 1"    required. This is the right-most button.
     ‑‑button2 "label for button 2"    This is the middle button.
     ‑‑button3 "label for button 3"    This is the left-most button. This will not be displayed if there is no --button2 label specified.
 
 
ok-msgbox
 
     ‑‑text "main text message"    This is the main, bold message text.
     ‑‑informative‑text "extra informative text to be displayed"    This is the extra, smaller text.
     ‑‑no‑cancel    Don't show a cancel button, only "Ok".
     ‑‑icon stockIconName    The name of the stock icon to use. This is incompatible with --icon-file
     Default is no icon.
     ‑‑icon‑file "/full/path/to/icon file"    The full path to the custom icon image you would like to use. Almost every image format is accepted. This is incompatible with the --icon option.
     ‑‑float    Float on top of all windows.
     ‑‑timeout numSeconds    The amount of time, in seconds, that the window will be displayed if the user does not click a button.
     Does not time out by default.
 
 
yesno-msgbox
 
     ‑‑text "main text message"    This is the main, bold message text.
     ‑‑informative‑text "extra informative text to be displayed"    This is the extra, smaller text.
     ‑‑no‑cancel    Don't show a cancel button.
     ‑‑icon stockIconName    The name of the stock icon to use. This is incompatible with --icon-file
     Default is no icon.
     ‑‑icon‑file "/full/path/to/icon file"    The full path to the custom icon image you would like to use. Almost every image format is accepted. This is incompatible with the --icon option.
     ‑‑float    Float on top of all windows.
     ‑‑timeout numSeconds    The amount of time, in seconds, that the window will be displayed if the user does not click a button.
     Does not time out by default.
 
inputbox
 
     ‑‑text "initial text"    This is the initial text in the input box.
     ‑‑informative‑text "extra informative text to be displayed"    This is the text for the label above the input box.
     ‑‑button1 "label for button 1"    required. This is the right-most button.
     ‑‑button2 "label for button 2"    This is the middle button.
     ‑‑button3 "label for button 3"    This is the left-most button. This will not be displayed if there is no --button2 label specified.
     ‑‑float    Float on top of all windows.
     ‑‑timeout numSeconds    The amount of time, in seconds, that the window will be displayed if the user does not click a button.
     Does not time out by default.
     ‑‑no‑show    This makes it a secure inputbox. Instead of what the user types, only dots will be shown.
 
standard-inputbox
 
     ‑‑text "initial text"    This is the initial text in the input box.
     ‑‑informative‑text "extra informative text to be displayed"    This is the text for the label above the input box.
     ‑‑no‑cancel    Don't show a cancel button.
     ‑‑float    Float on top of all windows.
     ‑‑timeout numSeconds    The amount of time, in seconds, that the window will be displayed if the user does not click a button.
     Does not time out by default.
     ‑‑no‑show    This makes it a secure inputbox. Instead of what the user types, only dots will be shown.
 

secue-inputbox
     This is an alias for running an inputbox with the --no-show option
 
 
progressbar
 
     ‑‑text "initial text to display"    This is the text that will be initially displayed.
     ‑‑percent number    Initial percentage, between 0 and 100, for the progress bar
     ‑‑indeterminate    This option makes the progress bar an animated "barbershop pole" (for lack of better description). It does not indicate how far the operations you're performing have progressed; it just shows that your application/script is busy. You can still update the text of the label when writing to cocoadialog's stdin - and it doesn't matter what percentage you feed it.
     ‑‑float    Float on top of all windows.
     ‑‑stoppable
 
 
dropdown
 
     ‑‑text "text"    This is the text for the label above the dropdown box.
     ‑‑items list of values    required. These are the labels for the options provided in the dropdown box. list of values should be space separated, and given as multiple arguments (ie: don't double quote the entire list. Provide it as you would multiple arguments for any shell program). The first item in the list is always selected by default.
     Example: cocoadialog dropdown --text "Favorite OS?" --items "GNU/Linux" "OS X" Windows Amiga "TI 89" --button1 "Ok"
     ‑‑pulldown    Sets the style to a pull-down box, which differs slightly from the default pop-up style. The first item remains visible. This option probably isn't very useful for a single-function dialog such as those cocoadialog provides, but I've included it just in case it is. To see how their appearances differ, just try them both.
     ‑‑button1 "label for button 1"    required. This is the right-most button.
     ‑‑button2 "label for button 2"    This is the middle button.
     ‑‑button3 "label for button 3"    This is the left-most button. This will not be displayed if there is no --button2 label specified.
     ‑‑exit‑onchange    Makes the program exit immediately after the selection changes, rather than waiting for the user to press one of the buttons. This makes the return value for the button 4 (for both regular output and with --string-output).
     ‑‑float    Float on top of all windows.
     ‑‑timeout numSeconds    The amount of time, in seconds, that the window will be displayed if the user does not click a button.
     Does not time out by default.
 
 
standard-dropdown
 
     ‑‑text "text"    This is the text for the label above the dropdown box.
     ‑‑items list of values    required. These are the labels for the options provided in the dropdown box. list of values should be space separated, and given as multiple arguments (ie: don't double quote the entire list. Provide it as you would multiple arguments for any shell program). The first item in the list is always selected by default.
     Example: cocoadialog dropdown --text "Favorite OS?" --items "GNU/Linux" "OS X" Windows Amiga "TI 89" --button1 "Ok"
     ‑‑pulldown    Sets the style to a pull-down box, which differs slightly from the default pop-up style. The first item remains visible. This option probably isn't very useful for a single-function dialog such as those cocoadialog provides, but I've included it just in case it is. To see how their appearances differ, just try them both.
     ‑‑exit‑onchange    Makes the program exit immediately after the selection changes, rather than waiting for the user to press one of the buttons. This makes the return value for the button 4 (for both regular output and with --string-output).
     ‑‑no‑cancel    Don't show a cancel button.
     ‑‑float    Float on top of all windows.
     ‑‑timeout numSeconds    The amount of time, in seconds, that the window will be displayed if the user does not click a button.
     Does not time out by default.
 
 
 
 UNSUPPORTED WITHOUT ADDITIONAL WORK (i.e. no 1:1 relatopnship with existing Dialog functionality)
 
fileselect
 
     ‑‑text "main text message"    This is the text displayed at the top of the fileselect window.
     ‑‑select‑directories    Allow the user to select directories as well as files. Default is to disallow it.
     ‑‑select‑only‑directories    Allows the user to select only directories.
     ‑‑packages‑as‑directories    Allows the user to navigate into packages as if they were directories, rather than selecting the package as a file.
     ‑‑select‑multiple    Allow the user to select more than one file. Default is to allow only one file/directory selection.
     ‑‑with‑extensions list of extensions    Limit selectable files to ones with these extensions. list of extensions should be space separated, and given as multiple arguments (ie: don't double quote the list).
     Example: cocoadialog fileselect --with-extensions .c .h .m .txt
     The period/dot at the start of each extension is optional.
     ‑‑with‑directory directory    Start the file select window in directory. The default value is up to the system, and will usually be the last directory visited in a file select dialog.
     ‑‑with‑file file    Start the file select window with file already selected. By default no file will be selected. This must be used with --with-directory. It should be the filename of a file within the directory.
 
filesave
 
     ‑‑text "main text message"    This is the text displayed at the top of the filesave window.
     ‑‑packages‑as‑directories    Allows the user to navigate into packages as if they were directories, rather than selecting the package as a file.
     ‑‑no‑create‑directories    Prevents the user from creating new directories.
     ‑‑with‑extensions list of extensions    Limit selectable files (including files the user creates) to ones with these extensions. list of extensions should be space separated, and given as multiple arguments (ie: don't double quote the list).
     Example: cocoadialog filesave --with-extensions .c .h .m .txt
     The period/dot at the start of each extension is optional.
     ‑‑with‑directory directory    Start the file save window in directory. The default value is up to the system, and will usually be the last directory visited in a file dialog.
     ‑‑with‑file file    Start the file save window with file already selected. By default no file will be selected. This must be used with --with-directory. It should be the filename of a file within the directory.
 
 
bubble
 
     ‑‑timeout numSeconds    The amount of time, in seconds, that the bubble(s) will be displayed. Clicking them will make them closer sooner.
     Unlike other dialogs, bubbles time out by default.
     Default value is 4.
     ‑‑no‑timeout    Don't time out. By default the bubbles will time out after 4 seconds. With this option enabled, they will stay visible until the user clicks them.
     ‑‑alpha alphaValue    The alpha value (controls transparency) for the bubble(s). A number between 0 and 1.
     Default is 0.95.
     ‑‑x‑placement placement    This can be left, right, or center.
     ‑‑y‑placement placement    This can be top, bottom, or center.
     Options for a single bubble:
     ‑‑text "body of the bubble"    required. The body text of the bubble.
     ‑‑title "title of the bubble"    required. The title of the bubble.
     ‑‑icon stockIconName    The name of the stock icon to use. This is incompatible with --icon-file
     Default is cocoadialog
     ‑‑icon‑file "/full/path/to/icon file"    The full path to the custom icon image you would like to use. Almost every image format is accepted. This is incompatible with the --icon option.
     ‑‑text‑color colorHexValue    The color of the text on the bubble in 6 character hexadecimal format (like you use in html). Do not prepend a "#" to this value. Examples: "000000" for black, or "ffffff" for white.
     The default is determined by your system, but should be 000000.
     ‑‑border‑color colorHexValue    The color of the border in 6 character hexadecimal format (like you use in html). Do not prepend a "#" to this value. Examples: "000000" for black, or "ffffff" for white.
     The default is 808080.
     ‑‑background‑top colorHexValue    The color of the top of the background gradient in 6 character hexadecimal format (like you use in html). Do not prepend a "#" to this value. Examples: "000000" for black, or "ffffff" for white.
     The default is B1D4F4.
     ‑‑background‑bottom colorHexValue    The color of the bottom of the background gradient in 6 character hexadecimal format (like you use in html). Do not prepend a "#" to this value. Examples: "000000" for black, or "ffffff" for white.
     The default is EFF7FD.
     Options for a multiple bubbles:
     ‑‑texts List of bodies for the bubbles    required. A list of body texts to use in the bubbles. Example: "This is bubble 1" bubble2 "and bubble 3"
     This must have the same number of items as the --titles list.
     ‑‑titles List of titles for the bubbles    required. A list of titles to use in the bubbles. Example: "Title for bubble 1" "And bubble2" "Bubble 3"
     This must have the same number of items as the --texts list.
     ‑‑icons List of stock icon names    The names of the stock icons to use. This is incompatible with --icon-files. If there are less icon names provided than there are bubbles, it will use the default for the remaining.
     Defaults are cocoadialog
     ‑‑icon‑files List of full paths to icon files    A list of files to use as icons. This is incompatible with --icons. If there are less icon files provided than there are bubbles, it will use the default for the remaining.
     Look at the Icons section to see how to mix custom icons with stock icons.
     ‑‑text‑colors List of hex colors    See the single bubble section for details.
     ‑‑border‑colors List of hex colors    See the single bubble section for details.
     ‑‑background‑tops List of hex colors    See the single bubble section for details.
     ‑‑background‑bottoms List of hex colors    See the single bubble section for details.
     ‑‑independent    This makes clicking one bubble not close the others. The default behavior is to close all bubbles when you click one.
 
 */
