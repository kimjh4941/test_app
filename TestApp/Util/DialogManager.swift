//
//  DialogManager.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/13.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import Foundation
import UIKit

// DialogのManagerクラス
class DialogManager {
    // インスタンス
    static let shared = DialogManager()

    // コンストラクター
    private init() {
        // コードなし
    }
    
    // Alertを表示する
    func showAlert(viewController: UIViewController,
                       title: String,
                       message: String,
                       completionHandler: (() -> ())? = nil) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            completionHandler?()
        })
        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
