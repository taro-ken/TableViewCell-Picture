//
//  AddCellViewController.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/02.
//

import UIKit

protocol AddCellViewControllerDelegate: AnyObject {
  func selected(model: Model)
}

final class AddCellViewController: UIViewController {
    
    static func makeFromStoryboard() -> AddCellViewController {
        let vc = UIStoryboard.addCellViewController
        return vc
      }
    
    //前の画面で選択されたモデル
    private var model: Model?
    //前の画面へ通知するためのdelegate
    weak var delegate: AddCellViewControllerDelegate?
    func configure(model: Model) {
      self.model = model
    }
    
    
    private var menus = Model.init(menu: ["肩","胸","背中","腕","足","腹","有酸素","休み"])
  
    
    
    @IBAction func set(_ sender: Any) {
        func selected(model: Model) {
           //modelをTableViewController(前の画面へ渡す)
           delegate?.selected(model: model)
       }
        self.dismiss(animated: true, completion: nil)
    }
    
        
    
    
    
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            // デフォルトの画像を表示する
            imageView.image = UIImage(named: "no_image.png")
        }
    }
    
    @IBOutlet private weak var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func selectPicture(_ sender: UIButton) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let picturepickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            picturepickerView.sourceType = .photoLibrary
            // デリゲート
            picturepickerView.delegate = self
            // ビューに表示
            self.present(picturepickerView, animated: true)
        }
    }
    
    // カメラ機能
    @IBAction private func selectCamera(_ sender: UIButton) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let picturepickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            picturepickerView.sourceType = .camera
            // デリゲート
            picturepickerView.delegate = self
            // ビューに表示
            self.present(picturepickerView, animated: true)
        }
    }
    

    @IBAction private func deletePicture(_ sender: UIButton) {
        // アラート表示
        showAlert()
    }

    /// アラート表示
    private func showAlert() {
        let alert = UIAlertController(title: "確認",
                                      message: "画像を削除してもいいですか？",
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler:{(action: UIAlertAction) -> Void in
                                        // デフォルトの画像を表示する
                                        self.imageView.image = UIImage(named: "no_image.png")
        })
        let cancelButton = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)

        // アラートにボタン追加
        alert.addAction(okButton)
        alert.addAction(cancelButton)

        // アラート表示
        present(alert, animated: true, completion: nil)
    }
}
    
extension AddCellViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 選択した写真を取得する
        let image = info[.originalImage] as! UIImage
        // ビューに表示する
        imageView.image = image
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
}
extension AddCellViewController: UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menus.menu.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return menus.menu[row]
    }
    
}

extension AddCellViewController : UIPickerViewDataSource {
    
}


