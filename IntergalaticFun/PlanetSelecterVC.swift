//
//  PlanetSelecterVC.swift
//  IntergalaticFun
//
//  Created by 薮本崇仁 on 2019/11/23.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class PlanetSelecterVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var planets = ["sun", "mercury", "venus", "mars", "jupiter", "saturn", "uranus", "neptune", "earth-night", "moon"]
    var planetToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 全てのセルの区切り線を消去
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    // セルの個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    // セルに値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath) as? PlanetCell {
            cell.configureCell(planet: planets[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // タップされたセル（planet）を取得
        planetToPass = planets[indexPath.row]
        // toPlanetに遷移
        performSegue(withIdentifier: "toPlanet", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let planetVC = segue.destination as? PlanetViewerVC {
            planetVC.planet = planetToPass
        }
    }
}
