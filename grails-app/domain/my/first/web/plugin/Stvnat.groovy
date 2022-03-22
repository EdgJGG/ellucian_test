package net.hedtech.my.first.web.plugin

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import org.hibernate.SQLQuery
import org.hibernate.Session
import javax.persistence.*

@Entity
@Table(name = "STVNATN")
@ToString(includeNames = true, ignoreNulls = true)
@EqualsAndHashCode(includeFields = true)

class Stvnat {


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_SURROGATE_ID IS SURROGATE ID: Immutable unique key;
    */
    @Id
    @Column(name = "STVNATN_SURROGATE_ID")
    long id


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_CODE IS This field identifies the nation code referenced in the Gen. Person,            Admissions, Gen. Student, and Student Billing Modules.;
    */
    @Column(name = "STVNATN_CODE")
    String stvnatnCode


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_NATION IS This field specifies the nation/country associated with the nation code.;
    */
    @Column(name = "STVNATN_NATION")
    String stvnatnNation


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_ACTIVITY_DATE IS This field identifies the most recent date a record was created or updated.;
    */
    @Column(name = "STVNATN_ACTIVITY_DATE")
    java.util.Date lastModified


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_VERSION IS VERSION: Optimistic lock token.;
    */
    @Column(name = "STVNATN_VERSION")
    long version


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_CAPITAL IS This field is not currently in use.;
    */
    @Column(name = "STVNATN_CAPITAL")
    String stvnatnCapital


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_AREA IS This field is not currently in use.;
    */
    @Column(name = "STVNATN_AREA")
    Integer stvnatnArea


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_POPULATION IS This field is not currently in use.;
    */
    @Column(name = "STVNATN_POPULATION")
    Integer stvnatnPopulation


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_EDI_EQUIV IS EDI/SPEEDE country code that equates to the nation code.  Refer to the SPEEDE Implementation Guide, Appendix B, data element 26 for valid values.;
    */
    @Column(name = "STVNATN_EDI_EQUIV")
    String stvnatnEdiEquiv


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_LMS_EQUIV IS LMS (IA Plus) nation (country) code that equates to this Banner nation code. Translation to this LMS code occurs during the LMS transaction feed from Banner FA.;
    */
    @Column(name = "STVNATN_LMS_EQUIV")
    String stvnatnLmsEquiv

    @Column(name = "STVNATN_POSTAL_MASK")
    String stvnatnPostalMask

    @Column(name = "STVNATN_TELE_MASK")
    String stvnatnTeleMask


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_STATSCAN_CDE IS Statistics Canadian specific code. ;
    */
    @Column(name = "STVNATN_STATSCAN_CDE")
    String stvnatnStatscanCde


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_SCOD_CODE_ISO IS ISO CODE:  The three character International Standards Organization (ISO) Code associated with the user defined nation code.;
    */
    @Column(name = "STVNATN_SCOD_CODE_ISO")
    String stvnatnScodCodeIso


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_SSA_REPORTING_EQUIV IS Social Security Administration country code that equates to the nation code.  Refer to the Magnetic Media Reporting and Electronic Filing (MMREF-1) Guide, Appendix C, for valid values.;
    */
    @Column(name = "STVNATN_SSA_REPORTING_EQUIV")
    String stvnatnSsaReportingEquiv


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_SEVIS_EQUIV IS SEVIS EQUIVALENCY: SEVIS code for nation;
    */
    @Column(name = "STVNATN_SEVIS_EQUIV")
    String stvnatnSevisEquiv


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_USER_ID IS USER ID: The user ID of the person who inserted or last updated this record.;
    */
    @Column(name = "STVNATN_USER_ID")
    String lastModifiedBy


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_DATA_ORIGIN IS DATA ORIGIN: Source system that created or updated the data.;
    */
    @Column(name = "STVNATN_DATA_ORIGIN")
    String dataOrigin


    /**
    * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_VPDI_CODE IS VPDI CODE: Multi-entity processing code.;
    */
    @Column(name = "STVNATN_VPDI_CODE")
    String vpdiCode


    // /**
    // * COMMENT ON COLUMN SATURN.STVNATN.STVNATN_GUID IS GUID: Global Unique Identifier to uniquely identify the record of a resource for integration.;
    // */
    // @Column(name = "STVNATN_GUID")
    // String stvnatnGuid



    static constraints = {
        id( nullable: false, maxSize: 19)
        stvnatnCode( nullable: false, maxSize: 5)
        stvnatnNation( nullable: false, maxSize: 30)
        lastModified( nullable: false)
        version( nullable: false, maxSize: 19)
        stvnatnCapital( nullable: true, maxSize: 20)
        stvnatnArea( nullable: true, maxSize: 22)
        stvnatnPopulation( nullable: true, maxSize: 22)
        stvnatnEdiEquiv( nullable: true, maxSize: 2)
        stvnatnLmsEquiv( nullable: true, maxSize: 2)
        stvnatnPostalMask( nullable: true, maxSize: 15)
        stvnatnTeleMask( nullable: true, maxSize: 15)
        stvnatnStatscanCde( nullable: true, maxSize: 5)
        stvnatnScodCodeIso( nullable: true, maxSize: 3)
        stvnatnSsaReportingEquiv( nullable: true, maxSize: 2)
        stvnatnSevisEquiv( nullable: true, maxSize: 2)
        lastModifiedBy( nullable: true, maxSize: 30)
        dataOrigin( nullable: true, maxSize: 30)
        vpdiCode( nullable: true, maxSize: 6)
        // stvnatnGuid( nullable: true, maxSize: 36)
    }


}


