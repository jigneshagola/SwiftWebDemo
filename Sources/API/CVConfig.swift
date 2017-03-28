//
//  CVConfig.swift
//  Craftsvilla
//
//  Created by Arpitha KR on 18/02/16.
//  Copyright © 2016 Craftsvilla. All rights reserved.
//

import Foundation

struct CVColorCodeMap{
    var code: String?
    var name: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.name = jsonDict["name"] as? String
        self.code = jsonDict["code"] as? String
    }
}

struct CVImageSizeDetails {
    var large: String?
    var thumb: String?
    var original: String?
    var small: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.large = jsonDict["large"] as? String
        self.thumb = jsonDict["thumb"] as? String
        self.original = jsonDict["original"] as? String
        self.small = jsonDict["small"] as? String
    }
}

struct CVCountryCode {
    var countryId: String?
    var countryPhoneCode: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.countryId = jsonDict["countryId"] as? String
        self.countryPhoneCode = jsonDict["countryPhoneCode"] as? String
    }
}

struct CVUrl {
    var productImage: String?
    var vendorImage: String?
    var products: String?
    var assetsImage: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.products = jsonDict["products"] as? String
        self.vendorImage = jsonDict["vendorImage"] as? String
        self.productImage = jsonDict["productImage"] as? String
        self.assetsImage = jsonDict["assetsImage"] as? String
    }
}

struct CVVersionStatus {
    var updateAvailable: Int?
    var isDeprecated: Int?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.updateAvailable = jsonDict["updateAvailable"] as? Int
        self.isDeprecated = jsonDict["isDeprecated"] as? Int
    }
}

class CVConfigDetails {
    var success: Int?
    var message: String?
    var colorCodeMapping: [String: String]? = [:]
    var sortedSizeList: [String]? = []
    var imageSizes: CVImageSizeDetails?
    var requestBaseUrl: String?
    var deals: String?
    var deal_isActive: Bool?
    var onboardingSkip: Bool?
    var urls: CVUrl?
    var liveCountries: [CVCountryCode]? = []
    var autoSuggestCharCount: Int?
    var versionStatus: CVVersionStatus?
    var defaultViewMode: String?
    var backgroundImageUrl: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.success = jsonDict["s"] as? Int
        self.message = jsonDict["m"] as? String
        
        if(self.success == 1){
            if let appSettings = jsonDict["d"] as? Dictionary<String,AnyObject>{
                if let feedData = appSettings["appSettings"] as? Dictionary<String,AnyObject>{
                    self.backgroundImageUrl = feedData["backgroundImageUrl"] as? String
                if let colors = feedData["color"] as? Array<Dictionary<String, AnyObject>> {
                    for color in colors {
                        let colorCodeMapping = CVColorCodeMap(jsonDict: color)
                        if(colorCodeMapping.name != nil && colorCodeMapping.code != nil) {
                            self.colorCodeMapping![colorCodeMapping.name!] = colorCodeMapping.code
                        }
                    }
                }
                    self.defaultViewMode = feedData["defaultViewMode"] as? String
                if let sizes = feedData["sizeChart"] as? [String] {
                    for size in sizes {
                        self.sortedSizeList?.append(size)
                    }
                }
                
                if let imageSize = feedData["imageSize"] as? Dictionary<String, AnyObject> {
                    self.imageSizes = CVImageSizeDetails(jsonDict: imageSize)
                }
                
                self.requestBaseUrl = feedData["requestBaseUrl"] as? String
                    if let deals = feedData["deals"] as? Dictionary<String, AnyObject> {
                        self.deals = deals["deals"] as? String
                        self.deal_isActive = deals["isActive"] as? Bool
                    }
                self.onboardingSkip = feedData["onboardingSkip"] as? Bool
                if let urls = feedData["urls"] as? Dictionary<String, AnyObject> {
                    self.urls = CVUrl(jsonDict: urls)
                }
                
                if let liveCountries = feedData["liveCountries"] as? [Dictionary<String, AnyObject>] {
                    for country in liveCountries {
                        let country_data = CVCountryCode(jsonDict: country)
                        self.liveCountries?.append(country_data)
                    }
                }
                
                self.autoSuggestCharCount = feedData["autoSuggestCharCount"] as? Int
                
                if let versionStatus = feedData["versionStatus"] as? Dictionary<String, AnyObject> {
                    self.versionStatus = CVVersionStatus(jsonDict: versionStatus)
                }
            }
        }
        }
    }
}


struct CVParameterMappingData {
    var multiple_delimiter: String?
    var range_delimiter: String?
    var api_key: String?
    var type: String?
    var options_map: Dictionary<String, AnyObject>? = [:]
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.api_key = jsonDict["api_key"] as? String
        self.type = jsonDict["type"] as? String
        self.multiple_delimiter = jsonDict["multiple_delimiter"] as? String
        self.range_delimiter = jsonDict["range_delimiter"] as? String
        if let options_map = jsonDict["options_map"] as? Dictionary<String, AnyObject> {
            self.options_map = options_map
        }
    }
}

//struct CVParameterMapping {
//    var perPage: CVParameterMappingData?
//    var pageId: CVParameterMappingData?
//    var catId: CVParameterMappingData?
//    var color: CVParameterMappingData?
//    var price: CVParameterMappingData?
//    var feedId: CVParameterMappingData?
//    var MID: CVParameterMappingData?
//    var discount: CVParameterMappingData?
//    var discountedPriceOrder: CVParameterMappingData?
//    var priceOrder: CVParameterMappingData?
//    
//    init(jsonDict: Dictionary<String, AnyObject>) {
//        if let perPage = jsonDict["perPage"] as? Dictionary<String, AnyObject> {
//            self.perPage = CVParameterMappingData.init(jsonDict: perPage)
//        }
//        if let pageId = jsonDict["pageId"] as? Dictionary<String, AnyObject> {
//            self.pageId = CVParameterMappingData.init(jsonDict: pageId)
//        }
//        if let catId = jsonDict["catId"] as? Dictionary<String, AnyObject> {
//            self.catId = CVParameterMappingData.init(jsonDict: catId)
//        }
//        if let color = jsonDict["color"] as? Dictionary<String, AnyObject> {
//            self.color = CVParameterMappingData.init(jsonDict: color)
//        }
//        if let price = jsonDict["price"] as? Dictionary<String, AnyObject> {
//            self.price = CVParameterMappingData.init(jsonDict: price)
//        }
//        if let feedId = jsonDict["feedId"] as? Dictionary<String, AnyObject> {
//            self.feedId = CVParameterMappingData.init(jsonDict: feedId)
//        }
//        if let MID = jsonDict["MID"] as? Dictionary<String, AnyObject> {
//            self.MID = CVParameterMappingData.init(jsonDict: MID)
//        }
//        if let discount = jsonDict["discount"] as? Dictionary<String, AnyObject> {
//            self.discount = CVParameterMappingData.init(jsonDict: discount)
//        }
//        if let discountedPriceOrder = jsonDict["discountedPriceOrder"] as? Dictionary<String, AnyObject> {
//            self.discountedPriceOrder = CVParameterMappingData.init(jsonDict: discountedPriceOrder)
//        }
//        if let priceOrder = jsonDict["priceOrder"] as? Dictionary<String, AnyObject> {
//            self.priceOrder = CVParameterMappingData.init(jsonDict: priceOrder)
//        }
//    }
//}

struct CVDynamicAttributeParser {
    var replaceSpace: String?
    var word: String?
    var multiple_delimiter: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.replaceSpace = jsonDict["replace_space"] as? String
        self.word = jsonDict["word"] as? String
        self.multiple_delimiter = jsonDict["multiple_delimiter"] as? String
    }
}

struct CVParameterData{
    var key_value_delimiter: String?
    var door: String?
    var param_delimiter: String?
    var parameter_mapping: Dictionary<String, CVParameterMappingData> = [:]
    var dynamic_attribute_parser: CVDynamicAttributeParser?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.key_value_delimiter = jsonDict["key_value_delimiter"] as? String
        self.door = jsonDict["door"] as? String
        self.param_delimiter = jsonDict["param_delimiter"] as? String
        
        if let dynamic_dict = jsonDict["dynamic_attribute_parser"] as? Dictionary<String, AnyObject> {
            self.dynamic_attribute_parser = CVDynamicAttributeParser(jsonDict: dynamic_dict)
        }
        
        if let param_mapping = jsonDict["parameter_mapping"] as? Dictionary<String, AnyObject> {
            if let perPage = param_mapping["perPage"] as? Dictionary<String, AnyObject> {
                parameter_mapping["perPage"] = CVParameterMappingData(jsonDict: perPage)
            }
            if let pageId = param_mapping["pageId"] as? Dictionary<String, AnyObject> {
                parameter_mapping["pageId"] = CVParameterMappingData(jsonDict: pageId)
            }
            if let catId = param_mapping["catId"] as? Dictionary<String, AnyObject> {
                parameter_mapping["catId"] = CVParameterMappingData(jsonDict: catId)
            }
            if let color = param_mapping["color"] as? Dictionary<String, AnyObject> {
                parameter_mapping["color"] = CVParameterMappingData(jsonDict: color)
            }
            if let price = param_mapping["price"] as? Dictionary<String, AnyObject> {
                parameter_mapping["price"] = CVParameterMappingData(jsonDict: price)
            }
            if let feedId = param_mapping["feedid"] as? Dictionary<String, AnyObject> {
                parameter_mapping["feedid"] = CVParameterMappingData(jsonDict: feedId)
            }
            if let MID = param_mapping["MID"] as? Dictionary<String, AnyObject> {
                parameter_mapping["MID"] = CVParameterMappingData(jsonDict: MID)
            }
            if let discount = param_mapping["discount"] as? Dictionary<String, AnyObject> {
                parameter_mapping["discount"] = CVParameterMappingData(jsonDict: discount)
            }
            if let userType = param_mapping["userType"] as? Dictionary<String, AnyObject> {
                parameter_mapping["userType"] = CVParameterMappingData(jsonDict: userType)
            }
            if let pageType = param_mapping["pageType"] as? Dictionary<String, AnyObject> {
                parameter_mapping["pageType"] = CVParameterMappingData(jsonDict: pageType)
            }
            if let discountedPriceOrder = param_mapping["discountedPriceOrder"] as? Dictionary<String, AnyObject> {
                parameter_mapping["discountedPriceOrder"] = CVParameterMappingData(jsonDict: discountedPriceOrder)
            }
            if let priceOrder = param_mapping["priceOrder"] as? Dictionary<String, AnyObject> {
                parameter_mapping["priceOrder"] = CVParameterMappingData(jsonDict: priceOrder)
            }
            
            if let priceOrder = param_mapping["q"] as? Dictionary<String, AnyObject> {
                parameter_mapping["q"] = CVParameterMappingData(jsonDict: priceOrder)
            }
            
        }
    }
}

struct CVUrlRoute {
   
    var regex: String?
    var range_delimiter: String?
    var door: String?
    var multiple_delimiter: String?
    var params_delimiter: [String] = []
    var param_data: CVParameterData?
    var id_reg_ex: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.regex = jsonDict["regex"] as? String
        self.door = jsonDict["door"] as? String
        self.id_reg_ex = jsonDict["id_reg_ex"] as? String
        self.range_delimiter = jsonDict["range_delimiter"] as? String
        self.multiple_delimiter = jsonDict["multiple_delimiter"] as? String
        if let params_delimiter = jsonDict["params_delimiter"] as? [String] {
            for params in params_delimiter {
                self.params_delimiter.append(params)
            }
        }
        if let parameterData = jsonDict["data"] as? Dictionary<String, AnyObject> {
            self.param_data = CVParameterData(jsonDict: parameterData)
        }
    }

}

class CVDynamicUrlRoutes {
    var success: Int?
    var message: String?
    var routes: [CVUrlRoute]? = []
    
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        
        if let success = jsonDict["s"] as? Int {
            self.success = success
            self.message = jsonDict["m"] as? String
            if(success == 1) {
                if let feedData = jsonDict["d"] as? [Dictionary<String, AnyObject>] {
                    for data in feedData {
                        let route = CVUrlRoute(jsonDict: data)
                        self.routes?.append(route)
                    }
                }
            }
        }
    }
}

struct CVRules{
    var utm_medium: String?
    var utm_source: String?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        self.utm_medium = jsonDict["utm_medium"] as? String
        self.utm_source = jsonDict["utm_source"] as? String
    }
}

struct CVRulesData{
    var push: CVRules?
    var GoogleDisplayAds: CVRules?
    var GoogleSearchAds: CVRules?
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        if let push = jsonDict["Push"] as? Dictionary<String,AnyObject>{
            self.push = CVRules(jsonDict: push)
        }
        if let displayAds = jsonDict["Google Display Ads"] as? Dictionary<String,AnyObject>{
            self.GoogleDisplayAds = CVRules(jsonDict: displayAds)
        }
        if let searchAds = jsonDict["Google Search Ads"] as? Dictionary<String,AnyObject>{
            self.GoogleSearchAds = CVRules(jsonDict: searchAds)
        }
    }
}

class CVTrackingRules {
    var success: Int?
    var message: String?
    var marketingTrackingData: [CVRulesData]? = []
    
    init(jsonDict: Dictionary<String, AnyObject>) {
        
        if let success = jsonDict["s"] as? Int {
            self.success = success
            self.message = jsonDict["m"] as? String
            if(success == 1) {
                if let feedData = jsonDict["d"] as? [Dictionary<String, AnyObject>] {
                    for data in feedData {
                        let trackingData = CVRulesData(jsonDict: data)
                        self.marketingTrackingData?.append(trackingData)
                    }
                }
            }
        }
    }
    
}
