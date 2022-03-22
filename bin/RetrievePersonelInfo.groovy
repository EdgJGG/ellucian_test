// package net.hedtech.my.first.web.plugin

// import grails.gorm.transactions.Transactional
// import groovy.json.JsonSlurper

// // @Transactional
// class RetrievePersonelInfo {

//     def generalSqlJsonService

//     def getAcademicTranscriptOptions(Boolean isFaculty = false) {

//         // String procedureName = isFaculty ? 'baninst1_ss9.bwlkftrn.p_viewtermtran' : 'baninst1_ss9.bwskotrn.P_ViewTermTran'
//         // def surveyListJson = generalSqlJsonService.executeProcedure('baninst1_ss9.bwzkerns.p_GetComuna')
//         String procedureName = 'baninst1_ss9.bwzkerns.p_GetComuna'

//         try {
//             return generalSqlJsonService.executeProcedure(procedureName)
//         } catch (ApplicationException ae) {
//             log.error "Exception in getComuna ${ae}"
//             return handleApplicationException(ae)
//         }
//     }

//     private 



// }