//
//  AddViewController.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/11.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import UIKit

protocol AddDelegate {
    func postAdded(post: Post)
}

class AddViewController: UIViewController {

    @IBOutlet weak private var name: UITextField!
    
    @IBOutlet weak private var message: UITextView!
    
    var addDelegate: AddDelegate?
    
//    var postViewModel: PostViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddViewController viewDidLoad")
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
    
    @IBAction func postButtonPushed() {
        print("AddViewController postButtonPushed")
//        // storyboardのインスタンス取得（別のstoryboardの場合）
//        let addStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        // 遷移先ViewControllerのインスタンス取得
//        let viewController = addStoryboard.instantiateViewController(withIdentifier: "main") as! ViewController
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        print("date: " + formatter.string(from: date))

        let post = Post(id: 0, user: User(login: name.text ?? "", avatar_url: ""),
                        body: message.text,
                        created_at: formatter.string(from: date),
                        updated_at: formatter.string(from: date))

//        print("test: " + viewController.test)
        
        addDelegate?.postAdded(post: post)
        self.navigationController?.popViewController(animated: true)
    }
}
