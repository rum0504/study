//
//  CommentViewController.swift
//  study
//
//  Created by 齊藤愛華 on 2020/01/11.
//  Copyright © 2020 com.lifeistech. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var nichijiLabel: UITextField!
    @IBOutlet var jikanLabel: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveDate: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nichijiLabel.text = saveDate.object(forKey: "title") as? String
        jikanLabel.text = saveDate.object(forKey: "title2") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
        nichijiLabel.delegate = self
        jikanLabel.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo() {
        
        //UserDefaultsに書き込み
        saveDate.set(nichijiLabel.text, forKey: "title")
        saveDate.set(jikanLabel.text, forKey: "title2")
        saveDate.set(contentTextView.text, forKey: "content")
        
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
                        UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: { action in
                                //ボタンが押された時の動作
                                self.navigationController?.popViewController(animated: true)
                                print("OKボタンが押されました！")
                                }
        )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
