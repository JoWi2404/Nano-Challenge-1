//
//  Tab.swift
//  Nano Challenge 1
//
//  Created by Joey Wiryawan on 10/05/23.
//

import Foundation
import SwiftUI

//Raw value used for tab title
enum Tab: String, CaseIterable {
    case tab_length = "Testing"
    case tab_temp = "Temperature"
    case tab_currency = "Currency"
    
    
    // SF Symbol Image
    var systemImage: String {
        switch self {
        case .tab_length:
            return "ruler"
        case .tab_temp:
            return "drop.degreesign"
        case .tab_currency:
            return "dollarsign"
        }
    }
    
    //Return Current Index
    var index: Int{
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
