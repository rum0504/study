//
//  ShowViewController.swift
//  study
//
//  Created by 齊藤愛華 on 2020/01/11.
//  Copyright © 2020 com.lifeistech. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    var nichijiText: String!
    var jikanText: String!
    var contentText: String!
    
    //倉庫にアクセスする
    let saveDate: UserDefaults = UserDefaults.standard
    
    //日時を表示させる為の配列
    var nichijiLabelArray = [String]()
    
    //時間を表示させる為の配列
    var jikanLabelArray = [String]()
    
    //コメントを表示させる為の配列
    var contentTextViewArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableViewのデータソースメソッドはViewControllerクラスに描くよという設定
        self.tableView.dataSource = self
        
        //TableViewのdelegateメソッドはViewControllerメソッドに書くよという設定
        self.tableView.delegate = self
        
        //nichijiTextを取り出す
        nichijiText = saveDate.object(forKey: "title") as? String
        //jikanTextを取り出す
        jikanText = saveDate.object(forKey: "title2") as? String
        //contentTextを取り出す
        contentText = saveDate.object(forKey: "content") as? String
        
        //if saveDate.object(forKey: "hinichi") == nil {
      //  }else {
           // nichijiLabelArray = saveDate.object(forKey: "hinichi") as! [String]
           // jikanLabelArray = saveDate.object(forKey: "time") as! [String]
           // contentTextViewArray = saveDate.object(forKey: "contents") as! [String]
       // }
    
        nichijiLabelArray.append(nichijiText)
        jikanLabelArray.append(jikanText)
        contentTextViewArray.append(contentText)
        
        saveDate.set(nichijiLabelArray, forKey: "hinichi")
        saveDate.set(jikanLabelArray, forKey: "time")
        saveDate.set(contentTextViewArray, forKey: "contens")
        
        print(nichijiLabelArray,jikanLabelArray)
        
        
        

        // Do any additional setup after loading the view.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nichijiLabelArray.count
    }
    
    //ID付きのセルを取得してセル付属のテキストラベルに「テスト」と表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomCell
        print(nichijiLabelArray[indexPath.row])
        cell?.nichijiLabel.text = nichijiLabelArray[indexPath.row]
        cell?.jikanLabel.text = jikanLabelArray[indexPath.row]
        
        return cell!
    }
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("(\(indexPath.row))番目の行が選択されました")
        
        //セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        //別の画面に遷移
        performSegue(withIdentifier: "toComment", sender: indexPath.row)
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
