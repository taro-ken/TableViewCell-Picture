//
//  TableViewCell.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/01.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var pctureImage: UIImageView!
    @IBOutlet private weak var numberName: UILabel!
    @IBOutlet private weak var menuName: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pctureImage.image = nil
        numberName.text = nil
        menuName.text = nil
    }
    
    
    func configure(contents: CellModel) {
        menuName.text = contents.menu
        numberName.text = contents.number
        
    }
    
    
}

