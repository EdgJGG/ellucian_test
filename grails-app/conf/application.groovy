/** *****************************************************************************
 Copyright 2014-2018 Ellucian Company L.P. and its affiliates.
 ****************************************************************************** */

//Added for integration tests to run in plugin level
grails.config.locations = [
        BANNER_APP_CONFIG: "banner_configuration.groovy"
]

grails.databinding.useSpringBinder=true

app.name = "FirstAppSelfService"
server.'contextPath' = '/FirstAppSelfService'

app.platform.version = "9.37.1"
app.appId = "SSS"

server.port = 8090
spring.jmx.enabled = false

grails.project.groupId = "net.hedtech" // used when deploying to a maven repo

grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [html: ['text/html', 'application/xhtml+xml'],
        xml: ['text/xml', 'application/xml', 'application/vnd.sungardhe.student.v0.01+xml'],
        text: 'text/plain',
        js: 'text/javascript',
        rss: 'application/rss+xml',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        all: '*/*',
        json: ['application/json', 'text/json'],
        form: 'application/x-www-form-urlencoded',
        multipartForm: 'multipart/form-data'
]

//dataOrigin = "Banner"

// The default codec used to encode data with ${}
grails.views.default.codec = "html" // none, html, base64  **** Charlie note: Setting this to html will ensure html is escaped, to prevent XSS attack ****
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"

grails.converters.domain.include.version = true
grails.converters.json.date = "javascript"
grails.converters.json.pretty.print = true

banner {
    sso {
        authenticationProvider = 'default'
        authenticationAssertionAttribute = 'udcId'
    }
}

//ssbEnabled = true
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = false

// enable GSP preprocessing: replace head -> g:captureHead, title -> g:captureTitle, meta -> g:captureMeta, body -> g:captureBody
grails.views.gsp.sitemesh.preprocess = true

dataSource {
    // configClass = GrailsAnnotationConfiguration.class
    dialect = "org.hibernate.dialect.Oracle10gDialect"
    loggingSql = false
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory'
    //hbm2ddl.auto = null
    show_sql = false
    packagesToScan="net.hedtech.**.*"
    flush.mode = AUTO
    dialect = "org.hibernate.dialect.Oracle10gDialect"
    config.location = [
            //"classpath:hibernate-banner-general-utility.cfg.xml",
            //"classpath:hibernate-banner-general-validation-common.cfg.xml",
            //"classpath:hibernate-banner-general-person.cfg.xml",
            //"classpath:hibernate-banner-general-common.cfg.xml"
            ]
}

formControllerMap = [
  'lac'                                : ['SELFSERVICE'] 
]

// Uncomment and edit the following lines to start using Grails encoding & escaping improvements

/* remove this line 
// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside null
                scriptlet = 'none' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}
remove this line */

environments {
    development {
        dataSource {
            url = "jdbc:oracle:thin:@34.195.130.157:1521/LAC"
            driverClassName = "oracle.jdbc.OracleDriver"
            username = "ban_ss_user"
            password = "u_pick_it"

        }
    }
    test {
        dataSource {
            url = "jdbc:oracle:thin:@34.195.130.157:1521/LAC"
            driverClassName = "oracle.jdbc.OracleDriver"
            username = "ban_ss_user"
            password = "u_pick_it"

        }
    }
    production {
        dataSource {
            url = "jdbc:oracle:thin:@34.195.130.157:1521/LAC"
            driverClassName = "oracle.jdbc.OracleDriver"
            username = "ban_ss_user"
            password = "u_pick_it"
        }
    }
}
