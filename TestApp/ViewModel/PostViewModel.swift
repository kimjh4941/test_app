//
//  ViewModel.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/11.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class PostViewModel {

    private var disposeBag = DisposeBag()
    
    private var targetPage = 0

    let isLoading = BehaviorRelay<Bool>(value: false)
    let isError = BehaviorRelay<Bool>(value: false)
    let posts = BehaviorRelay<[Post]>(value: [])
    
    let postModel: PostModel
    
    init(postModel: PostModel) {
        self.postModel = postModel
    }
    
    func getPosts() {
        print("PostViewModel#getPosts")
        isLoading.accept(true)
        isError.accept(false)
        
        postModel.getPostList().subscribe(
            // JSON取得が成功した場合の処理
            onSuccess: { posts in
                debugPrint(posts)
                self.posts.accept(posts)
                print("posts.value", self.posts.value)
                self.isLoading.accept(false)
            },

            // JSON取得が失敗した場合の処理
            onError: { error in
                self.isError.accept(true)
                self.isLoading.accept(false)
                print("Error: ", error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
    func add(post: Post) {
        print("PostViewModel#add")
        self.posts.accept([])
        print("PostViewModel posts", [post])
    }
}
