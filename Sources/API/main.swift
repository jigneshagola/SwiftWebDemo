import Kitura
import LoggerAPI
import KituraRequest
import SwiftyJSON
import Foundation
import Model
import HeliumLogger

HeliumLogger.use()

// setup routes
let router = Router()
//router.get("/") { _, response, next in
//    response.status(.OK).send(json: JSON(["hello" : "world"]))
//    next()
//}


router.all("/*", middleware: BodyParser())

router.get("/post", handler: handlePostRequest)


Kitura.addHTTPServer(onPort: 8090, with:router)

Kitura.run()
