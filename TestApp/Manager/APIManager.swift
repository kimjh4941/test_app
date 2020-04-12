//
//  APIManager.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/11.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

//https://api.github.com/repos/tristanhimmelman/ObjectMapper/issues/comments

//// 共通で利用するプロトコル
//protocol APIClient {
//    var url: String { get }
//    func getRequest(_ parameters: [String : String]) -> DataRequest
//}

class APIManager {

    static let shared = APIManager()

    private init() {

    }

    // Wikipedia APIのエンドポイント
    let url = "https://api.github.com/repos/tristanhimmelman/ObjectMapper/issues/comments"
    
//    func getPostList() -> Observable<[Post]> {
//        // APIへのリクエストを1度だけ送信して結果に応じた処理をする
//        return Observable<[Post]>.create(observer: { Disposable in
//            AF.request(self.url, method: .get).responseJSON  { response in
//                            debugPrint(response)
//                            switch response.result {
//                                // APIからのレスポンスの取得成功時
//                                case .success(let response):
//                                    let posts = try? JSONDecoder().decode([Post].self, from: response as! Data)
//                                    singleEvent(.success(posts!))
//                                    // onNextに渡す
//                                    observer.onNext(.success(posts!))
//                                    // 完了
//                                    observer.onCompleted()
//                                // APIからのレスポンスの取得失敗時
//                                case .failure(let error):
//                                    observer
//                                    singleEvent(.error(error))
//                            }
//                        }
//            return Disposables.create()
//        })
//    }
}
