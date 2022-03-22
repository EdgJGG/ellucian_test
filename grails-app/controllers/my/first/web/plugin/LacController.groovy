package net.hedtech.my.first.web.plugin

import net.hedtech.my.first.web.plugin.Stvnat
import grails.converters.JSON
import net.hedtech.my.first.web.plugin.RetrieveComunaService
import net.hedtech.my.first.web.plugin.Comuna

// import net.hedtech.banner.general.utility.PreferredNameService




    class LacController{

        def RetrieveComunaService retrieveComunaService

        def index(){
            render('Hola mundo desde lac controller')
        }

        def paso1(){

            // def modelComnuna = [comuna: retrieveComunaService.fetchComunas()]
            // System.out.println("model comuna ->"+ modelComnuna.stream().findFirst().isPresent());

            // List<Comuna> list = new ArrayList<Comuna>()
            // list.add(new Comuna("1", "Hola"))
            // list.add(new Comuna("2", "Mundo"))

            // System.out.println("*** Paso1 - parte 1\n\n\n" + list);
            // System.out.println("model comuna desde controller"+ modelComnuna);
            // render (view: 'estudiante/datos', model : [comuna: modelComnuna])
            render (view: 'estudiante/datos')
            // render (view: 'estudiante/datos', model : [comuna: list])
            // System.out.println("*** Paso1 - parte 2\n\n\nEntramos a fetch comunas?");
            // System.out.println(retrieveComunaService.fetchComunas());
  
        }

        def getComunas(){
            render (view: 'estudiante/pago')
            // def modelComnuna = [comuna: retrieveComunaService.fetchComunas()]

            // render modelComnuna as JSON
        }
        
        def paso2(){
            // render (view: 'estudiante/financiamiento')
            def modelComnuna = retrieveComunaService.fetchComunas()
            // modelComnuna = [comuna: ]

            render modelComnuna as JSON
        }

        def paso3(){
            render (view: 'estudiante/pago')
        }
        
        def paso4(){
            render (view: 'estudiante/confirm')
        }

        def countries(){
            // render (view: Stvnat.findAll() as JSON)
            render Stvnat.findAll() as JSON

            // def model = [ terms:terms]
   
            // def comuna1 = Stvnat.findAll()
            // render (view: 'estudiante/datos', model: [comuna1:comuna1] )
   
        }

    }

    


