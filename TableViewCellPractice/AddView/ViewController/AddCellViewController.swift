//
//  AddCellViewController.swift
//  TableViewCellPractice
//
//  Created by 木元健太郎 on 2021/04/02.
//

import UIKit

class AddCellViewController: UIViewController {
    
    var list = AddModel.init()
    
    
    
    @IBOutlet weak var pictureView: UIView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
}
    
    
    
extension AddCellViewController: UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.List.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return list.List[row]
    }
    
}

extension AddCellViewController : UIPickerViewDataSource {
    
}


extension AddCellViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// UIImagePickerController カメラを起動する
        /// - Parameter sender: "UIImagePickerController"ボタン
        @IBAction func addPicture(_ sender: Any) {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            // UIImagePickerController カメラを起動する
            present(picker, animated: true, completion: nil)
        }

        /// シャッターボタンを押下した際、確認メニューに切り替わる
        /// - Parameters:
        ///   - picker: ピッカー
        ///   - info: 写真情報
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            // "写真を使用"を押下した際、写真アプリに保存する
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            self.view.addSubview(UIImage)
            // UIImagePickerController カメラが閉じる
            self.dismiss(animated: true, completion: nil)
        }
    }

