//
//  StoryboardSet.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/10.
//

import UIKit

extension UIStoryboard {
  static var tableViewController: TableViewController {
    UIStoryboard.init(name: "TableView", bundle: nil).instantiateInitialViewController() as! TableViewController
  }

static var addCellViewController: AddCellViewController {
      UIStoryboard.init(name: "AddCell", bundle: nil).instantiateInitialViewController() as! AddCellViewController
    }
    
    
    
}
