//
//  Logger.swift
//  SwiftLogger
//
//  Created by Sauvik Dolui on 03/05/2017.
//  Copyright © 2016 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import Foundation

/// Enum which maps an appropiate symbol which added as prefix for each log message
///
/// - error: Log type error
/// - info: Log type info
/// - debug: Log type debug
/// - verbose: Log type verbose
/// - warning: Log type warning
/// - severe: Log type severe
enum LogEvent: String {
    case e = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}


/// Wrapping Swift.print() within DEBUG flag
///
/// - Note: *print()* might cause [security vulnerabilities](https://codifiedsecurity.com/mobile-app-security-testing-checklist-ios/)
///
/// - Parameter object: The object which is to be logged
///
func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
    Swift.print(object)
    #endif
}

class Log {
    
    static var dateFormat = "yyyy-MM-dd HH:mm:ssSSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    // MARK: - Loging methods
    
    
    /// Logs error messages on console with prefix [‼️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    ///   - inClass: Name of the class from where the logging is done
    class func e( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function, inClass: AnyObject = Log.self) {
        logEvent(event: LogEvent.e, object: object, filename: filename, line: line, column: column, funcName: funcName, inClass: inClass)
    }
    
    /// Logs info messages on console with prefix [ℹ️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    ///   - inClass: Name of the class from where the logging is done
    class func i ( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function, inClass: AnyObject = Log.self) {
        logEvent(event: LogEvent.i, object: object, filename: filename, line: line, column: column, funcName: funcName, inClass: inClass)
    }
    
    /// Logs debug messages on console with prefix [💬]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    ///   - inClass: Name of the class from where the logging is done
    class func d( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function, inClass: AnyObject = Log.self) {
        logEvent(event: LogEvent.d, object: object, filename: filename, line: line, column: column, funcName: funcName, inClass: inClass)
    }
    
    /// Logs messages verbosely on console with prefix [🔬]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    ///   - inClass: Name of the class from where the logging is done
    class func v( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function, inClass: AnyObject = Log.self) {
        logEvent(event: LogEvent.v, object: object, filename: filename, line: line, column: column, funcName: funcName, inClass: inClass)
    }
    
    /// Logs warnings verbosely on console with prefix [⚠️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    ///   - inClass: Name of the class from where the logging is done
    class func w( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function, inClass: AnyObject = Log.self) {
        logEvent(event: LogEvent.w, object: object, filename: filename, line: line, column: column, funcName: funcName, inClass: inClass)
    }
    
    /// Logs severe events on console with prefix [🔥]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    ///   - inClass: Name of the class from where the logging is done
    class func s( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function, inClass: AnyObject = Log.self) {
        logEvent(event: LogEvent.s, object: object, filename: filename, line: line, column: column, funcName: funcName, inClass: inClass)
    }
    
    
    /// Extract the file name from the file path
    ///
    /// - Parameter filePath: Full file path in bundle
    /// - Returns: File Name with extension
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    /// A general logging method that is called by different logging event public methods
    ///
    /// - Parameters
    ///   - event: The logging event
    ///   - object: Object or message to be logged
    ///   - filename: File name from where the logging is done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    ///   - inClass: Name of the class from where the logging is done
    private class func logEvent(event: LogEvent, object: Any, filename: String, line: Int, column: Int, funcName: String, inClass: AnyObject) {
        if isLoggingEnabled {
            let className = inClass === Log.self ? "" : String(describing: type(of: inClass)).components(separatedBy: ".").last
            print("\(Date().toString()) \(event.rawValue)[\(sourceFileName(filePath: filename))] \(className ?? ""):\(line) \(column) \(funcName) -> \(object)")
        }
    }
}

internal extension Date {
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
}
