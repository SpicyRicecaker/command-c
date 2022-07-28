//
//  main.swift
//  ibook-lens
//
//  Created by SpicyRicecaker on 7/26/22.
//

import Foundation
import Cocoa

func commandC () {
    let commandKeyDownEvent = CGEvent(keyboardEventSource: nil, virtualKey: CGKeyCode(55), keyDown: true)
    commandKeyDownEvent?.flags = CGEventFlags.maskCommand
    let cKeyDownEvent = CGEvent(keyboardEventSource: nil, virtualKey: CGKeyCode(8), keyDown: true)
    cKeyDownEvent?.flags = CGEventFlags.maskCommand

    commandKeyDownEvent?.post(tap: CGEventTapLocation.cghidEventTap)
    cKeyDownEvent?.post(tap: CGEventTapLocation.cghidEventTap)

    let commandKeyUpEvent = CGEvent(keyboardEventSource: nil, virtualKey: CGKeyCode(55), keyDown: false)
    commandKeyUpEvent?.flags = CGEventFlags.maskCommand
    let cKeyUpEvent = CGEvent(keyboardEventSource: nil, virtualKey: CGKeyCode(8), keyDown: false)

    cKeyUpEvent?.flags = CGEventFlags.maskCommand

    commandKeyUpEvent?.post(tap: CGEventTapLocation.cghidEventTap)
    cKeyUpEvent?.post(tap: CGEventTapLocation.cghidEventTap)
}

let clipboard = NSPasteboard.general
let count = clipboard.changeCount

commandC()

 let time: Double = 1/60

while count == clipboard.changeCount {
    Thread.sleep(forTimeInterval: time)
}
