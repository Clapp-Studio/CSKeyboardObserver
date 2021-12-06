//
//  KeyboardEvent.swift
//  tutor
//
//  Created by George on 03.12.2021.
//

import Foundation
import UIKit

public enum KeyboardEvent {
    case willShow
    case didShow
    case willHide
    case didHide
}

extension KeyboardEvent {
    public static let all: [KeyboardEvent] = [.willShow, .didShow, .willHide, .didHide]

    func getNotificationName() -> Notification.Name {
        switch self {
        case .willShow:
            return UIResponder.keyboardWillShowNotification
        case .didShow:
            return UIResponder.keyboardDidShowNotification
        case .willHide:
            return UIResponder.keyboardWillHideNotification
        case .didHide:
            return UIResponder.keyboardDidHideNotification
        }
    }
}
