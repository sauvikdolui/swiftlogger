//
//  Logger.swift
//  SwiftLogger
//
//  Created by Sauvik Dolui on 03/05/2017.
//  Copyright © 2016 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import Foundation

// Enum for showing the type of Log Types
enum LogEvent:String {
    case error="Error Description"
    case info="Info Messgae"
    case debug="Debug Description"
    case verbose="Verbose"
    case warning="Warning Description"
    case severe="Severe Description"
}
// Date formats to choose the desired format
enum DateFormat:String
{
    case format_yyyyMMdd_hhmmssSSS = "yyyy-MM-dd hh:mm:ssSSS"
    /*variables used for defining date structure in project*/
    case  format_MMddyyyyHHmm = "MM-dd-yyyy HH:mm"
    case  format_MMMddyyyyhhmmaaa = "MMM dd, yyyy hh:mm aaa"
    case format_MMMddyyyyhhmma = "MMM dd, yyyy hh:mm a"
    case format_HHmmss = "HH:mm:ss"
    case format_hhmmaaa = "hh:mm aaa"
    case format_hhmmaa = "hh:mm aa"
    case format_yyyyMMdd = "yyyy-MM-dd"
    case format_dd = "dd"
    case format_EEEE = "EEEE"
    case format_MMMM = "MMMM"
    case format_yyyyMMddhhmmss = "yyyy-MM-dd HH:mm:ss"
    case format_EEEEMMMddyyyy = "EEEE, MMM dd,yyyy"
    case format_ddMMyyyy = "dd-MM-yyyy"
    case format_MMMdd_yyyy = "MMM dd, yyyy"
    case format_hhmma = "hh:mm a"
    case format_MMMMdd = "MMMM dd"
    case format_yyyy = "yyyy"
    case format_d = "d"
    case format_MM_dd_yyyy = "MM/dd/yyyy"
    case format__d_ = " d "
    case format_MMMddyyyy = "MMM dd,yyyy"
    case format_MMddyyyy = "MM-dd-yyyy"
    case format_ddyyyymm = "dd-yyyy-MM"
    case format_yyyyMMddHHmm = "yyyy-MM-dd HH:mm"
  
}

class Logger {
   static var dateFormatter: (DateFormat)->DateFormatter = {
       
        let formatter = DateFormatter()
        formatter.dateFormat = $0.rawValue
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    class func printDebugInfo(debugMessage: String="",
                   event: LogEvent,
                   withdateFormat:DateFormat=DateFormat.format_yyyyMMdd_hhmmssSSS,
                   printData:Any?=nil,
                   fileName: String = #file,
                   line: Int = #line,
                   column: Int = #column,
                   funcName: String = #function) {
        
        #if DEBUG
            print("\(event.rawValue):----\nDate :- \(Date().toString(withFormatter: withdateFormat))\nFunction Name :- \(funcName)\nLine number :- \(line)\nColumn Number :- \(column)\nFileName :- \(sourceFileName(filePath: fileName))\nFile Path :- \(fileName)")
            if debugMessage.count > 0 || debugMessage != ""
            {
                print("Message :- \(debugMessage)-----\n")
            }
            if let _ = printData
            {
                print("Data--------\n\(printData!)")
            }
        #endif
    }
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}
internal extension Date {
    func toString(withFormatter formater:DateFormat) -> String {
        return Logger.dateFormatter(formater).string(from: self as Date)
    }
}
