//
//  ToolModel.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

struct ToolModel: IdentifiableType, Equatable {
    
    var image: String
    var name: String
    var description: String
    var startHidden: Bool = false
    
    let firstFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    let secondFont = UIFont.systemFont(ofSize: 13, weight: .light)
    
    init(image: String,
         name: String,
         description: String) {
        self.image = image
        self.name = name
        self.description = description
    }
    
    var identity: String {
        return name + description + image
    }
    
    static func == (lhs: ToolModel, rhs: ToolModel) -> Bool {
        return lhs.identity == rhs.identity
    }
    
    func getSize() -> CGSize {
        let cellW = UIScreen.main.bounds.width - 16 - 16
        let width = cellW * (1 - 0.17) - 16 - 16 - 16
        let nameH = name.height(withConstrainedWidth: width, font: firstFont)
        let descH = description.height(withConstrainedWidth: width, font: secondFont)
        return CGSize(width: cellW, height: 16 + 16 + 10 + descH + nameH)
    }
    
}
