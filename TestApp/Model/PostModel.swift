//
//  Model.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/11.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class PostModel {
//    // wikipedia Wikipedia APIでの検索結果をObservableで扱えるようにするためのメソッド
//    func getPostList(_ parameters: [String:String]) -> Observable<[UserInfo]> {
//        // [Result]型のObservableオブジェクトを生成
//        return Observable<[UserInfo]>.create { (observer) -> Disposable in
//            // Wikipedia APIへHTTPリクエストを送信
//            let request = APIManager.shared.getRequest(parameters).responseJSON { response in
//                // 結果にエラーがあればonErrorに渡して処理を終える
//                if let error = response.error {
//                    observer.onError(error)
//                }
//                guard let data = response.data else { return }
//                let users: [UserInfo] = try! JSONDecoder().decode([UserInfo].self, from: data)
//                print(users)
//                // onNextに渡す
//                observer.onNext(users)
//                // 完了
//                observer.onCompleted()
//            }
//            return Disposables.create {
//                request.cancel()
//            }
//        }
//    }
//
    
    // Wikipedia APIのエンドポイント
    let url = "https://api.github.com/repos/tristanhimmelman/ObjectMapper/issues/comments?sort=created&direction=desc"
    
    func getPostList() -> Single<[Post]> {
        // APIへのリクエストを1度だけ送信して結果に応じた処理をする
        return Single<[Post]>.create(subscribe: { singleEvent in
            AF.request(self.url, method: .get).response  { response in
                            debugPrint(response)
                            switch response.result {
                                // APIからのレスポンスの取得成功時
                                case .success(let response):
                                    let posts = try? JSONDecoder().decode([Post].self, from: response!)
                                    singleEvent(.success(posts!))
                                // APIからのレスポンスの取得失敗時
                                case .failure(let error):
                                    singleEvent(.error(error))
                            }
                        }
            return Disposables.create()
        })
    }
}
