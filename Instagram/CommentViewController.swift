//
//  CommentViewController.swift
//  Instagram
//
//  Created by MikaYamashita on 2020/11/25.
//  Copyright © 2020 mika.yamashita. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var CaptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var commentData = [String]()
    var captionData:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.CaptionLabel.text = captionData
    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentData.count
    }

    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = commentData[indexPath.row]

        return cell
    }
    
    //ヘッダ(上の線)
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.gray // 色
        return view
    }

    //ヘッダの高さ(上の線の幅)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 1 //高さ
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
