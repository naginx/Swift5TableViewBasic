//
//  ViewController.swift
//  Swift5TableViewBasic
//
//  Created by nagisa miura on 2020/04/15.
//  Copyright © 2020 nagisa miura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var textArray = [String]()

    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    /// セクションの数を指定
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    /// セクションの中のセルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // 追加した文字列の数
        return textArray.count
    }
    
    /// セル構築時に呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 選択時のハイライトを消す
        cell.selectionStyle = .none
        // textArrayの中のテキストごとに、各セルのテキストラベルへ反映
        cell.textLabel?.text = textArray[indexPath.row]
        // imageViewの実行
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
    }
    
    /// セル選択時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        // nextVCにタップされた番号の文字列を渡す
        nextVC.todoString = textArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    /// セルの高さを決める
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return view.frame.size.height / 6
    }
    
    /// キーボードのリターン押下時に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textArray.append(textField.text!)
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData()
        
        return true
    }
}
