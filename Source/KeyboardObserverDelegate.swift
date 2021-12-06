//
//  KeyboardEventDelegate.swift
//  tutor
//
//  Created by George on 03.12.2021.
//

import Foundation
import UIKit

public protocol KeyboardObserverDelegate {
    func onKeyboardWillShow(keyboardHeight: CGFloat)
    func onKeyboardWillHide()
    func onKeyboardDidShow(keyboardHeight: CGFloat)
    func onKeyboardDidHide()
}

public extension KeyboardObserverDelegate {
    func onKeyboardWillShow(keyboardHeight: CGFloat) {
        print("KeyboardObserverDelegate: OnKeyboardWillShow not implemented")
    }

    func onKeyboardWillHide() {
        print("KeyboardObserverDelegate: onKeyboardWillHide not implemented")
    }

    func onKeyboardDidShow(keyboardHeight: CGFloat) {
        print("KeyboardObserverDelegate: onKeyboardDidShow not implemented")
    }

    func onKeyboardDidHide() {
        print("KeyboardObserverDelegate: onKeyboardDidHide not implemented")
    }
}
