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
    var titleText = ""
    var titleText2 = ""
    var contentText = ""
    
    
    
    
    var saveDate: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nichijiLabel.text = titleText
        jikanLabel.text = titleText2
        contentTextView.text = contentText
        nichijiLabel.delegate = self
        jikanLabel.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo() {
        
        //保存
        save()
        //UserDefaultsに書き込み
//        saveDate.set(nichijiLabel.text, forKey: "title")
//        saveDate.set(jikanLabel.text, forKey: "title2")
//        saveDate.set(contentTextView.text, forKey: "content")
//
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
    
    func save() {
        let nichiji = nichijiLabel.text
        let jikan = jikanLabel.text
        let content = contentTextView.text
        
        saveDate.register(defaults: ["hinichi":[]])
        saveDate.register(defaults: ["time":[]])
        saveDate.register(defaults: ["contents":[]])
        var nichijiLabelArray = saveDate.object(forKey: "hinichi") as! [String]
        var jikanLabelArray = saveDate.object(forKey: "time") as! [String]
        var contentTextViewArray = saveDate.object(forKey: "contents") as! [String]
        
        nichijiLabelArray.append(nichiji!)
        jikanLabelArray.append(jikan!)
        contentTextViewArray.append(content!)
        
        saveDate.set(nichijiLabelArray, forKey: "hinichi")
        saveDate.set(jikanLabelArray, forKey: "time")
        saveDate.set(contentTextViewArray, forKey: "contents")
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
