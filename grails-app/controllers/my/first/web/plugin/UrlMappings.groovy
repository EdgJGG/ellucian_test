package net.hedtech.my.first.web.plugin

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        
    "/lac/menu" {
        controller = "Lac"
        action = [GET: "paso2", POST: "create"]
    }
        // "/paso1" {
        //     controller = 'LacController'
        //     action = [GET: 'paso1']
        // }

        // "/identityDocumentDashboard/dashboard" (redirect: [uri: '/ssb/dashboard'])

         "/api"(
            controller:"LacController", action:"getComunas", method: "GET"
         )

        // "/paso2"(
        //    controller:"LacController", action:"paso2"
        // )
        
        
        
        //"/**"(controller: "LacController", action:"paso1")
        
        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
