//
//  HomeViewController.swift
//  Weather
//
//  Created by kaphkz on 09.04.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var weatherImage: UIImageView!
    @IBOutlet private weak var todayLabel: UILabel!
    @IBOutlet private weak var tempatureLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var humidityPercLabel: UILabel!
    
    let lat: Double = 43.22
    let lon: Double = 76.85
    let exclude: Exclude = .minutely
    let units: Units = .metric
    let lang: Language = .en
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params: [String: Any] = [
            "lat": lat,
            "lon": lon,
            "exclude": exclude,
            "units": units,
            "lang": lang,
            "appid": Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
        ]
        
        let APIService = APIService()
        APIService.fetchWeatherData(params: params) { result in
            dump(result)
        }
    }
    
    

}

