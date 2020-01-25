//
//  ShowViewController.swift
//  study
//
//  Created by 齊藤愛華 on 2020/01/11.
//  Copyright © 2020 com.lifeistech. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //storyboardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableViewのデータソースメソッドはViewControllerクラスに描くよという設定
        table.dataSource = self
        
        //TableViewのdelegateメソッドはViewControllerメソッドに書くよという設定
        table.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //ID付きのセルを取得してセル付属のテキストラベルに「テスト」と表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
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
