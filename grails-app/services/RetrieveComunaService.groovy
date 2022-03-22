package net.hedtech.my.first.web.plugin

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper

// import GeneralCommonUtility

@Transactional
// class ViewRetrievedNation{
class RetrieveComunaService
{
    
    def  GeneralSqlJsonService generalSqlJsonService
    

    public def fetchComunas() {

        // System.out.println("*** Entrando a FetchComunas() \n\n\n");
        def result
        // def terms = Stvnat.findAll()
        def comunasListJson = generalSqlJsonService.executeProcedure('baninst1_ss9.bwzkerns.p_GetComuna', null, false, true)
        // System.out.println("*** comunasListJson -> \n"+ comunasListJson);
        def comunasInfoList = getComunasList(comunasListJson) //switch on / off
        // if (comunasInfoList.size()) {
        //     result = getSurveyResultMap(true, null, comunasInfoList)
        // }
        
        return comunasInfoList
    }



    // private getSurveyResultMap(success, error, surveys) {
    //     return [
    //             success: success,
    //             error  : error,
    //             surveys: surveys
    //     ]
    // }


    public def getComunasList(parentJson) {
        //System.out.println("\n\n\n Entrando a Servicio 1:getComunasList(parentJson) \n");
        def prueba = "[{'CODE': '0902'',''DESC': 'ALFREDO BAQUERIZO MORENO (JUJ)'},{'CODE': '0902','DESC':'ALFREDO BAQUERIZO MORENO (JUJ)'}]"

        //System.out.println("Impresion prueba desde service"+ prueba)
         List<Comuna> listaComunas = new ArrayList<Comuna>()

        

        def comunasInfoList = []
        def comunasJson = parentJson?.begin_55
        //System.out.println("comunasJson -> \n\n\n" + comunasJson);

        // if (comunasJson?.surveys_available == 'Y') {
        def listJson = comunasJson?.loop_56
        // System.out.println("listJson -> \n\n\n " + listJson);    

        listJson?.each { comunasList ->
            def rolesList = comunasList.loop_56

            // System.out.println( comunasInfo)
                def comunasInfo = [
                        comunaCode: comunasList.iRec_CODE,
                        comunaDesc: comunasList.iRec_DESCR
                ]
                // System.out.println("\nComunas info ->\n")
                comunasInfoList.push(comunasInfo)
            //    System.out.println( comunasInfo)

        }
        // }
            // System.out.println("model comuna ->"+ modelComnuna.stream().findFirst());




         return comunasInfoList
        //System.out.println("comunasInfoList\n\n\n" + comunasInfoList)
        //  System.out.println("Termina Servicio 1:getComunasList(parentJson) \n");


    }

    // private checkRole(rolesList) {
    //     boolean hasRole
    //     rolesList?.each { role ->
    //         if (GeneralCommonUtility.checkUserRole(role)) {
    //             hasRole = true
    //             return true
    //         }
    //     }
    //     hasRole
    // }
}
