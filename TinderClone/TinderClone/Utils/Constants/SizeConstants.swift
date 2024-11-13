//
//  SizeConstants.swift
//  TinderClone
//
//  Created by Victor Codonho on 12/11/24.
//

import SwiftUI

struct SizeConstants {
    
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
