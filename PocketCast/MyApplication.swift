//
//  MyApplication.swift
//  PocketCast
//
//  Created by Morten Just Petersen on 4/14/15.
//  Copyright (c) 2015 Morten Just Petersen. All rights reserved.
//

import Cocoa

@objc(MyApplication)
class MyApplication: NSApplication {

    override init() {
        println("overriden, boom")
        super.init()
    }

    override func sendEvent(theEvent: NSEvent) {
        var overridden=false

        var asd:NSEventSubtype;

        let shouldHandleMediaKeyLocally = !SPMediaKeyTap.usesGlobalMediaKeyTap()

        if (shouldHandleMediaKeyLocally
            && theEvent.type == NSEventType.SystemDefined
            && Int32(theEvent.subtype.rawValue) == SPSystemDefinedEventMediaKeys) {
                if let delegate = self.delegate as? AppDelegate {
                    delegate.mediaKeyTap(nil, receivedMediaKeyEvent: theEvent)
                }

        }

        super.sendEvent(theEvent)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}