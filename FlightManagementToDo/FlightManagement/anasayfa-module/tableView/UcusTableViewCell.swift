//
//  UcusTableViewCell.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import UIKit

class UcusTableViewCell: UITableViewCell {

    @IBOutlet weak var planeImageView: UIImageView!
    @IBOutlet weak var varisLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var ucusTuruLabel: UILabel!
    @IBOutlet weak var kabinMemuruLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
