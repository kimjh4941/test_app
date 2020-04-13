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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var bottomConstraints: NSLayoutConstraint!
    
    var addDelegate: AddDelegate?
    
    var saveOffset:CGFloat?
    
//    var postViewModel: PostViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddViewController viewDidLoad")
        // Do any additional setup after loading the view.
        
        // Keyboard Notification Add
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Keyboard Notification Remove
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
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
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("show Keyboard")

        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let btn = addBtn else { return }

        let keyboardHeight = keyboardFrame.cgRectValue.height
        let keyboardTopLine = view.frame.height - keyboardHeight

        let bottomLine = btn.frame.origin.y + btn.frame.height
        let displayBottom = bottomLine - scrollView.contentOffset.y

        if displayBottom > keyboardTopLine {
            let sub = displayBottom - keyboardTopLine
            saveOffset = sub
            let offset = CGPoint(x: scrollView.contentOffset.x, y: self.scrollView.contentOffset.y + sub)

            scrollView.setContentOffset(offset, animated: true)
            bottomConstraints.constant = keyboardHeight
        }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        print("Hide Keyboard")
        
        var offset:CGPoint = CGPoint(x: 0, y: 0)
        if scrollView.contentOffset.y - (saveOffset ?? 0) < 0 {
            offset = CGPoint(x: self.scrollView.contentOffset.x, y: 0)
        }else if scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height - bottomConstraints.constant) {
            offset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y)
        }else {
            offset = CGPoint(x: scrollView.contentOffset.x, y: self.scrollView.contentOffset.y - (saveOffset ?? 0))
        }

        saveOffset = nil
        bottomConstraints.constant = 0
        scrollView.setContentOffset(offset, animated: true)
        
        view.endEditing(true)
    }
}
