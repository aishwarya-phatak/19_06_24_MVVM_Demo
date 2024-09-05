//
//  ProductTableViewCell.swift
//  19_06_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 05/09/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    
    //didSet and willSet --> propertyObservers
    var product : Product?{
        didSet{
            productConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func productConfiguration(){
        self.productIdLabel.text = product?.id.codingKey.stringValue
        self.productTitleLabel.text = product?.title
    }
}
