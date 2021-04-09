//
//  TableViewCell.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/01.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var pctureImage: UIImageView!
    @IBOutlet private weak var menuName: UILabel!
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
        pctureImage.image = nil
        menuName.text = nil
    }
    
    
    func configure(contents: CellModel) {
        
        if let pictureImagestr = contents.image {
        
        }
        
        menuName.text = contents.menu
    
        
    }
    
    
}

