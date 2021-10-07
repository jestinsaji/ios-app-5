//
//  ViewController.swift
//  Task5
//
//  Created by Apps Team Mac book Air on 05/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        get_mock_test_series_questions(completion::)
    }
    func get_mock_test_series_questions(completion : @escaping (Json4Swift_Base) -> ())  {
        let url = "http://51.161.9.211:6013/api/list_support_cast"
                
        let   token="cH8nzU6a8htDCgPWvdKwdRbyNMYwz6xkemp6Gqj-3Z5.0nIzMjOxIjO0ADI1ATLwETLxIDMyIiOiUWbpRXZ0FGZiwiI0MjMxAUdq5WQiojIkJ3b3N3chBnIsEDOxojIkl2XyV2c1Jye.9JiN1IzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye"
        let caregiver_id=181
        let poststring="token=\(token) & caregiver_id=\(caregiver_id)"
            
        
        print("poststring,\(poststring)")
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
//        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = poststring.data(using: String.Encoding.utf8)
    
            let task=URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
                
                if error != nil{
                    print("There is Error here- \(error!.localizedDescription)")
                    return
                }
                let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                print("respnsedate,\(String(describing: responsestring))")
//                    do {
//
//
//                        let decoder = JSONDecoder()
//                        let model = try decoder.decode(Json4Swift_Base.self, from:
//                            data!) //Decode JSON Response Data
//                        print(model)
//                        //completion(model)
//
//
//                    } catch let error as NSError {
//                        print("There is Error- \(error.localizedDescription)")
//                    }
            }
            task.resume()
        }
        
  
        
}

