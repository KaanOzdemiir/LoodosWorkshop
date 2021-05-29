//
//  RxEvent.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//

import RxBus

struct RxEvent {
    struct loodosTextFeched: BusEvent {
        let text: String
    }
}
