//
//  ViewController.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/01.
//

import UIKit

final class TableViewController: UIViewController {
    
    private let CELL_NIB_NAME = "TableViewCell"
    private let CELL_ID = "TableViewCell"
    
    private var models:[Model] = []
        
    
    private var selectedModel: Model = Model.init(menu: [])
    
    static func makeFromStoryboard() -> TableViewController {
        let vc = UIStoryboard.tableViewController
        return vc
      }
    
    
    
    @IBAction  func add(_ sender: Any) {
        Router.shared.showAddView(from: self, selectedModel: selectedModel)
        
    }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cellNIB = UINib(nibName: CELL_NIB_NAME, bundle: nil)
            tableView.register(cellNIB, forCellReuseIdentifier: CELL_ID)
            
            tableView.delegate = self
            tableView.dataSource = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let user = models[indexPath.row]
        cell.configure(contents: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
extension TableViewController: UITableViewDelegate {
    
}


extension TableViewController: AddCellViewControllerDelegate {
    func selected(model: Model) {
     models.append(model)
      //   tableView.reloadData()
    }
    
}
