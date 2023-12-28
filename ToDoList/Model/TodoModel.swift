//
//  TodoModel.swift
//  ToDoList
//
//  Created by Hieu Le on 12/28/23.
//

import Foundation

enum TodoStatus: String, CaseIterable {
    case pending
    case completed
}

struct TodoModel: Identifiable, Hashable {
    let id: Int
    let title: String
    let date: Date
    let status: TodoStatus
}

func createDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.timeZone = TimeZone.current
    let calendar = Calendar.current
    return calendar.date(from: components)!
}
