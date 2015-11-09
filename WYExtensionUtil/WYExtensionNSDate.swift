//
//  WYExtensionNSDate.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension NSDate {
    
    class func dateFromTimestampString(timestamp: String) -> NSDate! {
        let time = Int(timestamp)!
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(time))
        return date
    }
    
    class func currentLocalTimestamp() -> String! {
        let timezone = NSTimeZone.systemTimeZone()
        return currentTimestamp(timezone: timezone)
    }
    
    class func currentGreenwichTimestamp() -> String! {
        let timezone = NSTimeZone(name: "Europe/London")!
        return currentTimestamp(timezone: timezone)
    }
    
    class func currentTimestamp(timezone timezone: NSTimeZone) -> String! {
        let date = NSDate()
        return timestamp(date: date, timezone: timezone)
    }
    
    class func timestamp(date date: NSDate, timezone: NSTimeZone) -> String! {
        let interval = NSTimeInterval(timezone.secondsFromGMTForDate(date))
        let localeDate = date.dateByAddingTimeInterval(interval)
        let timestamp = NSString.localizedStringWithFormat("%ld", Int64(localeDate.timeIntervalSince1970))
        return String(timestamp)
    }
    
    class var currentDateStringWithoutTimeZoneString: String {
        return dateToString(NSDate(), dateFormat: "yyyy-MM-dd HH:mm:ss")
    }
    
    static func dateToString(date: NSDate, dateFormat: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = NSLocale(localeIdentifier: NSCalendarIdentifierGregorian)
        return formatter.stringFromDate(date)
    }
    
    func isToday() -> Bool {
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.stringFromDate(self) == format.stringFromDate(NSDate())
    }
    
    func isYestoday() -> Bool {
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.stringFromDate(self) == format.stringFromDate(NSDate().dateByAddingTimeInterval(-24*60*60))
    }
    
    func getAstro() -> String {
        let m = Int(self.getMonth())
        let d = Int(self.getDay())
        var s = ["Capricorn","Aquarius","Pisces","Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpio","Sagittarius","Capricorn"]
        var arr = [20,19,21,21,21,22,23,23,23,23,22,22]
        let index = m! - (d < (arr[m!-1]) ? 1 : 0)
        return "\(s[index])座"
    }
    
    func getAge() -> Int {
        if self.getMonth() < NSDate().getMonth() || (self.getMonth() == NSDate().getMonth() && self.getDay() <= NSDate().getDay()){
            return Int(NSDate().getYear())! - Int(self.getYear())!
        }else{
            return Int(NSDate().getYear())! - Int(self.getYear())!-1
        }
    }
    
    
    func getYear() -> String {
        let format = NSDateFormatter()
        format.dateFormat = "yyyy"
        return format.stringFromDate(self)
    }
    
    func getMonth() -> String {
        let format = NSDateFormatter()
        format.dateFormat = "MM"
        return format.stringFromDate(self)
    }
    
    func getDay() -> String {
        let format = NSDateFormatter()
        format.dateFormat = "dd"
        return format.stringFromDate(self)
    }
    
    func showTimeWithMonthDate() -> String {
        let format = NSDateFormatter()
        format.dateFormat = "MM-dd"
        return format.stringFromDate(self)
    }
    
    func noticeTime() -> String{
        let format = NSDateFormatter()
        if self.isToday() {
            format.dateFormat = "HH:mm"
        } else if self.isYestoday(){
            format.dateFormat = "Yesterday HH:mm"
        } else {
            format.dateFormat = "MM-dd"
        }
        return format.stringFromDate(self)
    }
    
    func dateToYearMonthdate() -> String {
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.stringFromDate(self)
    }
    
    func dateIsWeek() -> Int {
        let interval = self.timeIntervalSince1970
        let days = Int(interval / 86400)
        return (days - 3) % 7
    }
    
    func timeAgoSinceDate() -> String {
        let calendar = NSCalendar.currentCalendar()
        let unitFlags: NSCalendarUnit = [NSCalendarUnit.Minute, NSCalendarUnit.Hour, NSCalendarUnit.Day, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Second]
        let now = NSDate()
        let earliest = now.earlierDate(self)
        let latest = (earliest == now) ? self: now
        let components: NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: [])
        
        if (components.year >= 2) {
            return "\(components.year)y"
        } else if (components.year >= 1) {
            return "1y"
        } else if (components.month >= 2) {
            return "\(components.month * 4)w"
        } else if (components.month >= 1) {
            return "4w"
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear)w"
        } else if (components.weekOfYear >= 1) {
            return "1w"
        } else if (components.day >= 2) {
            return "\(components.day)d"
        } else if (components.day >= 1) {
            return "1d"
        } else if (components.hour >= 2) {
            return "\(components.hour)h"
        } else if (components.hour >= 1) {
            return "1h"
        } else if (components.minute >= 2) {
            return "\(components.minute)m"
        } else if (components.minute >= 1) {
            return "1m"
        } else if (components.second >= 3) {
            return "\(components.second)s"
        } else {
            return "now"
        }
    }
    
    
    class func getStringFromDate(date: NSDate, format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(date)
    }

    class func getDateFromString(date: String, format: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.dateFromString(date) {
            return date
        } else {
            return NSDate(timeIntervalSince1970: 0)
        }
    }
    
}


