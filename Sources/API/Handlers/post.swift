import Kitura
import LoggerAPI
import SwiftyJSON
import KituraRequest
import Foundation


var result:Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()


func handlePostRequest(request: RouterRequest, response: RouterResponse, next: ()->Void) -> Void {
    
    
    KituraRequest.request(.GET, "https://appapi2.craftsvilla.com/1/public/config/dynamicURLRoutes")
        .response {
            _, _, data, _ in
            if data != nil {
                var dynamicUrlRoutes:CVDynamicUrlRoutes?
                
                do {
                    let dataDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                    dynamicUrlRoutes = CVDynamicUrlRoutes(jsonDict: dataDict!)
                    
                } catch let error as NSError {
                    print(error)
                }
                
                
                KituraRequest.request(.GET, "https://appapi2.craftsvilla.com/1/public/merchandising/menu")
                    .response {
                        _, _, responseMenu, _ in
                        if responseMenu != nil {
                            let json = JSON(data: responseMenu!)
                           
                            let menu = json["d"]["menu"]
                            
                            for (index,subJson):(String, JSON) in menu {
                                let targetJason = subJson["target"]
                                if let url:String = targetJason["url"].string {
                                    if url.characters.count > 0 {
                                        let result = doesDoorExist(url:url,dynamicUrlRoutes:dynamicUrlRoutes!)
                                        if result.0 == true {
                                            print("Huva re");
                                        } else {
                                            print("nahi Huva re");
                                        }
                                    }
                                }
                            }
                        } else {
                            print("false")
                        }
                    response.status(.OK).send("DOne")
            }
        }
    }
    next()
}




func doesDoorExist(url: String,dynamicUrlRoutes: CVDynamicUrlRoutes) -> (Bool,String?,CVUrlRoute?) {
    print("Huva re");
    if  url != "" {
        let endpoint = url.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let dynamicRules = dynamicUrlRoutes
        
        for rule in (dynamicRules.routes)! {
            if matchesForRegexInText(regex:rule.regex!, text: endpoint).count > 0 {
                
                print("URL: \(url)")
                print("Regex: \(rule.regex)")
                
                print("Door is \(rule.door)")
                if let door = rule.door {
                    return (true,door,rule)
                }
            }
        }
        
    }
    return (false,nil,nil)
    
}


func matchesForRegexInText(regex: String, text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        let results = regex.matches(in:text,
                                            options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substring(with:$0.range)}
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

//func makeModelClass(dict: JSON , className : String ) {
//    var resultString: String =  "class " + className + " {\n"
//    for (key, value) in dict {
//        var val = ""
//        switch (value.type) {
//        case .string :
//              val = "var " + key + ": String" + "\n"
//        case .number :
//              val = "var " + key + ": Number" + "\n"
//        case .dictionary :
//            makeModelClass(dict: dict[key], className: key)
//             val = "var " + key  + ": " + key + "\n"
//        case .array :
//             var line: String? = readLine()
//             print("enter input string")
//             print(line)
//             while(true) {
//                if line != nil {
//                    break
//                }
//             }
//             val = makeClassFromArray(array: dict[key], className: key) + "\n"
//        default:
//            break
//        }
//        resultString = resultString + val
//}
//    resultString = resultString + "} \n"
//    print(resultString)
//}
//
//func makeClassFromArray(array: JSON, className: String) -> String {
//    var val = ""
//    for (key,value) in array {
//        print(value.type)
//        val = "var " + className
//        switch (value.type) {
//        case .string :
//            val = val + ": [String]" + "\n"
//        case .number :
//            val = val + ": [Number]" + "\n"
//        case .dictionary :
//            makeModelClass(dict: value, className: "dict1")
//            val = val + ": [" + "dict1" + "]\n"
//        case .array :
//            makeClassFromArray(array: array[key], className: "arr1")
//            val = val + ": " + "[arr1]" + "\n"
//        default:
//            break
//        }
//        break
//    }
//    return val
//}
//
//func makeProperties() {
//    
//}
//
//func initializeProperties() {
//    
//}
