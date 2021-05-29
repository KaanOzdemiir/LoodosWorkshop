//
//  String+Extension.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Foundation

extension String{
    var boolValue: Bool{
        return self == "1" || self == "true" || self == "True" || self == "TRUE"
    }
}
