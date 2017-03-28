import Kitura
import LoggerAPI
import SwiftyJSON
import KituraRequest

func createBookHandler(request: RouterRequest, response: RouterResponse, next: ()->Void) -> Void {
    Log.info("Handling a post to /books")

    response.status(.OK)
    

    next()
}
