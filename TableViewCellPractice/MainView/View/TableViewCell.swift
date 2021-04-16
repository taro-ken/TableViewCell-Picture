//
//  TableViewCell.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/01.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var pictureImage: UIImageView!
    @IBOutlet private weak var menuName: UILabel!
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
       // pictureImage.image = nil
        menuName.text = nil
    }
    
    
    func configure(contents: Model) {
        
        //pictureImage.image = UIImage.init()
        menuName.text = contents.menu.joined()
    }
    
    
}

