//
//  KeyboardObserver.swift
//  tutor
//
//  Created by George on 03.12.2021.
//

import Foundation
import UIKit

public class KeyboardObserver {
    private var delegate: KeyboardObserverDelegate?
    
    public init(delegate: KeyboardObserverDelegate? = nil) {
        self.delegate = delegate
    }
    
    public func startObserving(from delegate: KeyboardObserverDelegate? = nil, events: [KeyboardEvent] = KeyboardEvent.all) {
        if let _ = self.delegate {
            stopObserving()
        }
        
        if let delegate = delegate {
            self.delegate = delegate
            addObservers(events: events)
        }
    }
    
    public func stopObserving() {
        NotificationCenter.default.removeObserver(self)
        delegate = nil
    }
    
    private func addObservers(events: [KeyboardEvent]) {
        events.forEach { [unowned self] event in
            
            var selector: Selector?
            
            switch event {
            case .willShow:
                selector = #selector(keyboardWillShow(notification:))
            case .didShow:
                selector = #selector(keyboardDidShow(notification:))
            case .willHide:
                selector = #selector(keyboardWillHide(notification:))
            case .didHide:
                selector = #selector(keyboardDidHide(notification:))
            }
            
            if let selector = selector {
                NotificationCenter.default.addObserver(self, selector: selector, name: event.getNotificationName(), object: nil)
            }
        }
    }

    @objc private func keyboardWillShow(notification: NSNotification?) {
        guard let keyboardFrame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        delegate?.onKeyboardWillShow(keyboardHeight: keyboardHeight)
    }
    
    @objc private func keyboardDidShow(notification: NSNotification?) {
        guard let keyboardFrame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        delegate?.onKeyboardDidShow(keyboardHeight: keyboardHeight)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification?) {
        delegate?.onKeyboardWillHide()
    }
    
    @objc private func keyboardDidHide(notification: NSNotification?) {
        delegate?.onKeyboardDidHide()
    }
}
