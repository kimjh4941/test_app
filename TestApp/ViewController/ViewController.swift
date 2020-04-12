//
//  ViewController.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/11.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, AddDelegate {
    
    @IBOutlet weak private var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    private let postViewModel = PostViewModel(postModel: PostModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController viewDidLoad")
        postViewModel.getPosts()
        
        // 一覧データをUITableViewにセットする処理
        postViewModel.posts.asObservable().bind(to: tableView.rx.items) { (tableView, row, post) in
            print("posts bind post: ", post)
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            cell.setCell(post)
            cell.delete.tag = row
            return cell
        }.disposed(by: disposeBag)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ViewController prepare")
        if segue.identifier == "add" {
            let nextView = segue.destination as! AddViewController
            nextView.addDelegate = self
        }
    }
    
    @IBAction func deleteButtonPushed(_ sender: UIButton) {
        print("ViewController deleteButtonPushed: ", sender.tag)
        postViewModel.posts.remove(at: sender.tag)
    }
        
    func postAdded(post: Post) {
        print("ViewController postAdded: ", post)
        postViewModel.posts.insert(post, at: 0)
//        postViewModel.posts.accept([post] + postViewModel.posts.value)
    }
}
