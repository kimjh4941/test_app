//
//  AddViewController.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/11.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import UIKit

// AddDelegate
protocol AddDelegate {
    //「投稿する」ボタン押下時、呼ばれるCallBack
    func postAdded(post: Post)
}

// AddViewControllerクラス
class AddViewController: UIViewController {
    // ユーザー名
    @IBOutlet private weak var name: UITextField!
    // メッセージ
    @IBOutlet private weak var message: UITextView!
    // AddDelegate
    public var addDelegate: AddDelegate?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddViewController#viewDidLoad")
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Event
    
    //「投稿する」ボタン押下時、呼ばれるCallBack
    @IBAction func postButtonPushed() {
        print("AddViewController#postButtonPushed")
        let post: Post = Post(id: 0,
                              user: User(login: name.text ?? "", avatar_url: ""),
                              body: message.text,
                              created_at: DateUtil.stringFromDate(date: Date(), format: "yyyy-MM-dd HH:mm:ss"),
                              updated_at: DateUtil.stringFromDate(date: Date(), format: "yyyy-MM-dd HH:mm:ss"))
        addDelegate?.postAdded(post: post)
        self.navigationController?.popViewController(animated: true)
    }
}
