//
//  Router.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/10.
//

import UIKit

final class Router {
    static let shared = Router()
    private init(){}
    
    
    func showAddView(from: TableViewController, selectedModel: Model) {
        //storyboardからAddCellViewControllerを呼ぶ
        let vc = AddCellViewController.makeFromStoryboard()
        vc.configure(model: selectedModel)
        vc.delegate = from
        show(from: from, next: vc)
    }
    
    
}

private extension Router {
  func show(from: UIViewController, next: UIViewController, animated: Bool = true) {
    if let nav = from.navigationController {
      nav.pushViewController(next, animated: animated)

    } else {
      from.present(next, animated: animated, completion: nil)
    }
  }
}
