//: Playground - noun: a place where people can play

import UIKit


var result: String = ""

//let dd = [
//    "z": 54.9000000000009,
//    "y": [
//        "l": "COD Available",
//        "a": [
//            "Red",
//            "Black",
//            "White"
//        ],
//        "n": "Above 50%",
//        "d": [
//            [
//                "z": "2000",
//                "min": "1000"
//            ]
//        ]
//    ],
//    "pageId": 1,
//    "perPage": 10,
//    "a": [
//        "discountedPriceOrder": "High to Low",
//        "NewestSort": "Newest",
//        "priceOrder": "High to Low",
//        "a": "Popular"
//    ]
//]

//let dict =  [
//    "z": [
//        100.01,
//        10015,
//        10064,
//        10004
//    ],
//    "filters": [
//        "codProducts": "COD Available",
//        "color": [
//            "Red",
//            "Black",
//            "White"
//        ],
//        "discountedPrice": "Above 50%",
//        "price": [
//            [
//                "max": "2000",
//                "min": "1000"
//            ]
//        ]
//    ],
//    "pageId": 1,
//    "perPage": 10,
//    "sorts": [
//        "discountedPriceOrder": "High to Low",
//        "NewestSort": "Newest",
//        "priceOrder": "High to Low",
//        "relevance": "Popular"
//    ]
//]
/**
  Returns json string whish is alphabetically sorted
  This fuction is called recursively util we lend to basic key value (where value is premitive data type)
  if value is not premitive data type then call save fuction agian
 
 -Parameter Dictionary which you want to covert to json String
 
*/


//
//func sortDict(dict:Dictionary<String, AnyObject>) -> String {
//    
//    //Sort key array and form json from sorted key array
//    let sortedKeyArray = dict.keys.sort()
//    
//    result = result + "{"
//    
//    for (index,key) in sortedKeyArray.enumerate() {
//        
//        
//        result = result  + "\"" + key  + "\"" + ":"
//        
//        let val = dict[key]
//        
//        //If value is key value
//        if val is Dictionary<String, AnyObject> {
//            result = sortDict(val as! Dictionary<String, AnyObject>)
//        }
//        //If value if arrya of key value
//        else if val is Array<Dictionary<String, AnyObject>> {
//            result = result + "["
//            for ele in val as! Array<Dictionary<String, AnyObject>> {
//                result = sortDict(ele)
//            }
//            result = result + "]"
//        }
//        //If value is array if String
//        else if val is Array<String> {
//            let sorted = (val as! [String]).sort()
//            
//            result = result + "["
//            var cnt: Int = 0
//            
//            for element in sorted {
//                if( cnt < sorted.count - 1) {
//                    result = result +  "\"" + element + "\"" + ","
//                }
//                else {
//                    result = result + "\"" + element + "\""
//                }
//                cnt  = cnt + 1
//            }
//            result = result + "]"
//        }
//        //If value is arrya of int or float
//        else if val is Array<Int> || val is Array<Float> {
//            
//            var sorted:Array<AnyObject> = Array()
//            
//            if val is Array<Int> { sorted = (val as! [Int]).sort() }
//            else if val is Array<Float> {sorted = (val as! [Float]).sort() }
//            
//            result = result + "["
//            var cnt: Int = 0
//            for element in sorted {
//                if( cnt < sorted.count - 1) {
//                    result = result + String(element) + ","
//                }
//                else {
//                    result = result + String(element)
//                }
//                cnt  = cnt + 1
//            }
//            result = result + "]"
//        }
//            
//        else if val is String {
//            result = result + "\""  + (val as! String) + "\""
//        }
//        else if val == nil {
//            result = result + "null"
//        } else if let value = val {
//            if value.description.containsString(".") {
//                result = result + String(val as! Double)
//            } else {
//                result = result + String(val as! Int)
//            }
//        }
//        if(index < (sortedKeyArray.count - 1)) {
//            result = result + ","
//        }
//        
//    }
//    return  result + "}"
//}
//
//let a:[Int] = [Int]()
//let n = a.max()

let array1 = [1,3,1,1].sorted()
let array2 = [1,1,1,3].sorted()

let a = zip(array1, array2).enumerated().filter() {$1.0 == $1.1}.map{$1.0}

print(a)

func getString() -> String {
    return "g"
}

func getValue(<type>) {
    
}
switch 1 {
case 1:
    getValue(value: getString)
case 1:
    getValue(value: getString)
default:
    
}
