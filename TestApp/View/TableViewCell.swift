//
//  TableViewCell.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/12.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let cellHeight: CGFloat = 70.0

    @IBOutlet weak private var userImage: UIImageView!
    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var date: UILabel!
    @IBOutlet weak private var message: UILabel!
    @IBOutlet weak var delete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
        // Initialization code
        self.accessoryType  = .none
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state.
    }
    
    func setCell(_ model: Post)  {
        print("setCell")
        name.text = model.user.login
        message.text = model.body
        date.text = model.created_at
        userImage.image = getImageByUrl(url: model.user.avatar_url)
        if (model.id == 0) {
            delete.isHidden = false
        } else {
            delete.isHidden = true
        }
    }
    
    func getImageByUrl(url: String) -> UIImage {
        if (url == "") {
            return UIImage(named: "user_image")!
        }
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)!
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage(named: "user_image")!
    }
}
