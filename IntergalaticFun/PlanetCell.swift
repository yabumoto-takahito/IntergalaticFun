//
//  PlanetCell.swift
//  IntergalaticFun
//
//  Created by 薮本崇仁 on 2019/11/23.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    @IBOutlet weak var planetImg: UIImageView!
    @IBOutlet weak var planetTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        planetImg.layer.cornerRadius = 10
    }
    
    func configureCell(planet: String) {
        planetTitle.text = planet.capitalized
        planetImg.image = UIImage(named: planet)
    }
}
