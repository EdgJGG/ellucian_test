<%--
/*******************************************************************************
Copyright 2009-2021 Ellucian Company L.P. and its affiliates.
*******************************************************************************/
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="headerAttributes" content=""/>
    <title><g:message code="student.title"/>
    <g:if test="${personDisplay.bioInformation.confidential}">
        <g:message code="student.profile.confidential"/>
    </g:if>
    </title>

    <meta name="layout" content="bannerSelfServicePage"/>
    <meta name="menuEndPoint" content="${request.contextPath}/ssb/menu"/>
    <meta name="menuBaseURL" content="${request.contextPath}/ssb"/>
    %{--<meta name="menuDefaultBreadcrumbId" content=""/>--}%

    <script type="text/javascript">
        /*configuration - should this be moved to external js file? */

        function htmlDecode(s) {
            return $('<div>').html(s).text();
        }

        var isDetachedWindow = '${navigation.isDetachedWindow}',
                headerInfo = {};
        headerInfo.pageTitle = '<g:message code="student.title"/> -  ${personDisplay.personDisplayName} (${personDisplay.bannerId})';

        <g:if test="${personDisplay.bioInformation.confidential}">
        headerInfo.pageTitle = '<g:message code="student.title"/> -  ${personDisplay.personDisplayName} (${personDisplay.bannerId}) <g:message code="student.profile.confidential"/>';
        </g:if>

        var breadCrumbInfo = {};

        <g:each var="crumb" in="${navigation.breadCrumbs.crumbs}">
        if ("${crumb.url}".split("?")[0] === location.href.split("?")[0]) {
            breadCrumbInfo["${crumb.display}"] = "";
        } else {
            breadCrumbInfo["${crumb.display}"] = "${crumb.url}";
        }
        </g:each>

        headerInfo.breadcrumb = breadCrumbInfo;
        document.getElementsByName('headerAttributes')[0].content = JSON.stringify(headerInfo);

        var banner8SSOUrlBase = '${navigation.banner8SSOUrl}',
                degreeWorksURL = '${navigation.degreeWorksUrl}',
                personDisplayBannerId = '${personDisplay.bannerId}',
                hoursOn = '${curriculumConfiguration.find{ it.config == "hours" }}',
                gpaOn = '${curriculumConfiguration.find{ it.config == "gpa" }}',
                holdsOn = '${curriculumConfiguration.find{ it.config == "holds" }}',
                holdsReasonOn = '${curriculumConfiguration.find{ it.config == "holdsReason" }}',
                holdsOriginatorOn = '${curriculumConfiguration.find{ it.config == "holdsOriginator" }}',
                holdsAmountOwedOn = '${curriculumConfiguration.find{ it.config == "holdsAmountOwed" }}',
                holdsAffectedOn = '${curriculumConfiguration.find{ it.config == "holdsAffected" }}',
                emptyHolds = '<g:message code="student.profile.holds.emptyHolds"/>',
                rootContext = "${request.contextPath}",
                studentId = "${personDisplay.bannerId}",
                normalAdditionalLinks = {};

        <g:each var="additionalLink" in="${navigation.additionalLinks}">
        <g:if test="${additionalLink.type != "Banner8"}">
        normalAdditionalLinks[${additionalLink.index}] = htmlDecode("${additionalLink.url}");
        </g:if>
        </g:each>

        var secEdConfig = '${navigation.priorEducationAndTesting.secondaryEducation["columns"]}',
                secondaryEdGridColumns = secEdConfig.replace('[', '').replace(']', '').split(','),
                postSecEdConfig = '${navigation.priorEducationAndTesting.postSecondaryEducation["columns"]}',
                postSecondaryEdGridColumns = postSecEdConfig.replace('[', '').replace(']', '').split(','),
                testScoreConfig = '${navigation.priorEducationAndTesting.testScores["columns"]}',
                testScoreGridColumns = testScoreConfig.replace('[', '').replace(']', '').split(','),
                facultyCardEnabled = false,
                registrationNoticesEnabled = false,
                secondaryEducationEnabled = false,
                postSecondaryEducationEnabled = false,
                testScoresEnabled = false;

        <g:if test="${navigation.configuration.find{ it.config == "facultyCardEnabled" } != null}">
        facultyCardEnabled = true;
        </g:if>
        <g:if test="${components.configuration.find{ it.config == "registrationNoticesEnabled" } != null}">
        registrationNoticesEnabled = true;
        </g:if>
        <g:if test="${navigation.configuration.find{ it.config == "secondaryEducationEnabled" } != null}">
        secondaryEducationEnabled = true;
        </g:if>
        <g:if test="${navigation.configuration.find{ it.config == "postSecondaryEducationEnabled" } != null}">
        postSecondaryEducationEnabled = true;
        </g:if>
        <g:if test="${navigation.configuration.find{ it.config == "testScoresEnabled" } != null}">
        testScoresEnabled = true;
        </g:if>

        function openInNewWindow(additionalLinkIndex) {
            window.open(normalAdditionalLinks[additionalLinkIndex], "studentprofileadditionalwindow")
        }

        function open9XInternalLinks(uri) {
            window.open(uri);
        }
    </script>
    <g:set var="appName" value="${System.properties['BANNERXE_APP_NAME']}"/>
    <g:if test="${appName.equals('StudentSelfService') || appName == null || appName.equals('default')}">
       %{-- <r:require modules="studentProfileJS, glyphicons, bootstrap"/>--}%
        <g:if test="${message(code: 'default.language.direction') == 'rtl'}">
            %{--<r:require modules="studentProfileRTL, studentNotesRTL"/>--}%
            <asset:stylesheet src="modules/studentProfileRTL-mf.css"/>
            <asset:stylesheet src="modules/studentNotesRTL-mf.css"/>
        </g:if>
        <g:else>
            %{--<r:require modules="studentProfile, studentNotes"/>--}%
            <asset:stylesheet src="modules/studentProfile-mf.css"/>
            <asset:stylesheet src="modules/studentNotes-mf.css"/>
        </g:else>
    </g:if>

    <g:else>
        <%
            response.sendError(404) /* pageNotFoundError */
        %>
    </g:else>

    <g:bannerMessages/>

</head>

<body>

<div id="getCoursePopup" data-endpoint='${createLink(uri: '/ssb/studentProfile/sectionDetailsPopup')}'></div>

<div id="getFacultyCard" data-endpoint='${createLink(uri: '/ssb/facultyCard/retrieveData')}'></div>

<div id="getStudentCard" data-endpoint='${createLink(uri: '/ssb/studentCard/retrieveData')}'></div>

<div id="getPersonImage" data-endpoint='${createLink(uri: '/ssb/studentPicture/picture')}'></div>

<div id="getFacultyImage" data-endpoint='${createLink(uri: '/ssb/facultyPicture/picture')}'></div>

<div id="getGpaAnHours"
     data-endpoint='${createLink(controller: "studentProfile", action: "viewGPAHoursList", params: [studentId: "${personDisplay.bannerId}"])}'></div>

<div id="getStandingAndNotices"
     data-endpoint='${createLink(controller: "studentProfile", action: "viewRegistrationNotices")}'></div>

<div id="getHoldsAccess" data-endpoint='${createLink(controller: "studentHolds", action: "checkPinFromUser")}'></div>

<div id="getHolds" data-endpoint='${createLink(controller: "studentHolds", action: "getHoldsCountCacheHolds")}'></div>

<div id="showHolds" data-endpoint='${createLink(controller: "studentHolds", action: "showHolds")}'></div>

<div id="releaseHolds" data-endpoint='${createLink(controller: "studentHolds", action: "releaseHolds")}'></div>

<div id="changeTerm" data-endpoint='${createLink(controller: "studentProfile", action: "changeTerm")}'></div>

<div id="studentProfile" data-endpoint='${createLink(controller: "studentProfile", action: "studentProfile")}'></div>

<div id="registeredCourses"
     data-endpoint="${createLink(action: "viewRegisteredCourseList", controller: "studentProfile")}"></div>
<g:if test="${navigation.configuration.find { it.config == "studentNotesEnabled" } != null}">
    <div id="getStudentNotesData" data-endpoint='${createLink(controller: "studentNotes", action: "getNotes")}'></div>

    <div id="getStudentNotesConfig"
         data-endpoint='${createLink(controller: "studentNotes", action: "getConfiguration")}'></div>

    <div id="saveNewNote" data-endpoint='${createLink(controller: "studentNotes", action: "save")}'></div>

    <div id="saveEdit" data-endpoint='${createLink(controller: "studentNotes", action: "edit")}'></div>

    <div id="viewNote" data-endpoint='${createLink(controller: "studentNotes", action: "viewNote")}'></div>
</g:if>


<div id="content" role="main">
    <div id="title-panel" class="aurora-theme" role="heading" aria-level="1"></div>

    <div id="profile-info-notices" class="navbar navbar-inverse profile-nav" tabindex="-1">
        <div class="collapse navbar-collapse profile-collapse" id="bs-navbar-collapse" role="region">
            <ul class="nav navbar-nav profile-block" role="toolbar" id="profileBlock" tabindex="0">
                <h2 id="studentProfileInfo" class="sr-only" aria-hidden="true"><g:message code="student.profile.topnav.label.srOnly"/></h2>
                <li class="dropdown profile-item limit-width ${(persona == 'student' || persona == 'proxy') ? 'term-select-li' : ''}" role="application">
                    <span class="profile-label" id="studentProfileTerm">
                        <span id="profileTerm"><g:message code="student.profile.top.term"/></span>
                        <g:if test="${persona == 'student' || persona == 'proxy' || persona == 'globalproxy'}">
                            <span class="sr-only">${termDisplay.displayDate ? termDisplay.termDisDescLong : termDisplay.description}</span>
                            <select name="studentterms" id="studentterms" class="studentterms-select" aria-labelledby="profileTerm">
                                <g:each var="studentTerm" in="${studentTerms}">
                                    <option value="${studentTerm.code}" ${studentTerm.code == termDisplay.code ? 'selected' : ''}>
                                        ${studentTerm.description}<br/>
                                        <g:if test="${displayDateForStudents}">
                                            <span class="sm-italic-flyout-studentterms">${studentTerm.termDates}</span><br/>
                                        </g:if>
                                        <g:if test="${defaultTerm == studentTerm.code}"><br/>
                                            <span class="sm-italic-flyout-studentterms-current"><g:message code="student.profile.studentterms.defaultTerm"/></span>
                                        </g:if>
                                    </option>
                                </g:each>
                            </select>
                        </g:if>
                        <g:else>
                            <span class="profile-desc"
                                  id="studentterms-a" role="presentation">
                                ${termDisplay.displayDate ? termDisplay.termDisDescLong : termDisplay.description}
                            </span>
                        </g:else>
                    %{--
                    <g:if test="${persona == 'student' || persona == 'proxy'}">
                        <a href="#" id="studentterms" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false" aria-describedby="standingEnabled overallHours overallGpa">
                            <span class="profile-desc"
                                  title="${termDisplay.displayDate ? termDisplay.termDisDescLong : termDisplay.description}"
                                  id="studentterms-a">
                                <span class="sr-only"><g:message code="student.profile.top.term"/></span>${termDisplay.displayDate ? termDisplay.termDisDescLong : termDisplay.description}
                            </span>
                            <span class="caret"></span>
                        </a>
                    </g:if>
                    <g:else>
                        <span class="profile-desc"
                              title="${termDisplay.displayDate ? termDisplay.termDisDescLong : termDisplay.description}"
                              id="studentterms-a">
                            ${termDisplay.displayDate ? termDisplay.termDisDescLong : termDisplay.description}
                        </span>
                    </g:else>

                %{--if student, generate term items--}%
                    %{--
                    <g:if test="${persona == 'student' || persona == 'proxy'}">
                        <ul class="dropdown-menu scrollable-menu studentterms-flyout" id="studentterms-flyout">
                            <g:each var="studentTerm" in="${studentTerms}">
                                <g:if test="${displayDateForStudents}">
                                    <li class="studentterms-list ${studentTerm.code == termDisplay.code ? 'studentterms-selected' : ''} studentterms-panel"
                                        data-term="${studentTerm.code}" tabindex="0">${studentTerm.description}<br>
                                        <span class="sm-italic-flyout-studentterms">${studentTerm.termDates}</span><br>
                                        <g:if test="${defaultTerm == studentTerm.code}">
                                            <span class="sm-italic-flyout-studentterms-current">
                                                <g:message code="student.profile.studentterms.defaultTerm"/>
                                            </span>
                                        </g:if>
                                    </li>
                                </g:if>
                                <g:else>
                                    <li class="studentterms-list ${studentTerm.code == termDisplay.code ? 'studentterms-selected' : ''} studentterms-panel"
                                        data-term="${studentTerm.code}" tabindex="0">
                                        ${studentTerm.description}
                                        <g:if test="${defaultTerm == studentTerm.code}"><br>
                                            <span class="sm-italic-flyout-studentterms-current">
                                                <g:message code="student.profile.studentterms.defaultTerm"/></span>
                                        </g:if>
                                    </li>
                                </g:else>
                            </g:each>
                        </ul>
                    </g:if>
                    --}%
                    </span>
                </li>

            <%-- STANDING --%>
                <g:if test="${components.configuration.find { it.config == "standingEnabled" } != null}">
                    <li class="profile-item limit-width ellipsis" role="presentation">
                        <span class="profile-label" id="standingEnabled" aria-hidden="true">
                            <span><g:message code="student.profile.top.standing"/></span>
                            <span id="spp_academic_standing" class="profile-desc"></span>
                        </span>
                    </li>
                </g:if>

            <%-- OVERALL HOURS --%>
                <g:if test="${curriculumConfiguration.find { it.config == "hours" } != null}">
                    <li class="profile-item" role="presentation">
                        <span class="profile-label" id="overallHours" aria-hidden="true">
                            <span><g:message code="student.profile.top.overall.hours"/></span>
                            <span id="spp_overall_hours" class="profile-desc"></span>
                        </span>
                    </li>
                </g:if>

            <%-- OVERALL GPA --%>
                <g:if test="${curriculumConfiguration.find { it.config == "gpa" } != null}">
                    <li class="profile-item" role="presentation">
                        <span class="profile-label" id="overallGpa" aria-hidden="true">
                            <span><g:message code="student.profile.top.overall.gpa"/></span>
                            <span id="spp_overall_gpa" class="profile-desc"></span>
                        </span>
                    </li>
                </g:if>
            </ul>
        </div>

        <div class="profile-nonCollapse" role="navigation">
            <div class="navbar-noti profile-block">
            <%-- REGISTRATION NOTICES --%>
                <g:if test="${components.configuration.find { it.config == "registrationNoticesEnabled" } != null}">
                    <div class="dropdown show-bs profile-item" id="registered-notices">
                        <a class="dropdown-toggle profile-label" href="#"
                           id="registered-notices-a" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-controls="registered-notices-a-menu"  aria-labelledby="regNoticeLabel registration-notices-number" aria-describedby="regNoticeDetail">
                            <span id="regNoticeLabel"><g:message
                                    code="student.profile.top.registration.notices"/></span>
                            <span class="registration-notices-number" id="registration-notices-number">0</span>
                            <span class="sr-only"
                                  id="regNoticeDetail">${g.message(code: 'student.profile.regnotice.holds.details')}</span>
                        </a>
                        <ul id="registered-notices-a-menu" class="dropdown-menu scrollable-menu" role="menu" aria-labelledby="regNoticePanel" tabindex="-1">
                            <li role="presentation" class="divider">
                                <div id="registered" class="registered-flyout flyout" role="presentation">
                                    <ul class="top-panel-registered-list" role="presentation" id="regNoticePanel">
                                        <li class="registered-list registered-panel" id="needs_to_readmit_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <span class="student_status_yield"></span>
                                                <span class="sm-italic-flyout" id="spp_needs_to_readmit"></span>
                                            </a>
                                        </li>
                                        <li class="registered-list registered-panel" id="overall_academic_standing_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <span class="student_status_check" id="overall_academic_status_icon"></span>
                                                <g:message
                                                        code="student.profile.registration.notices.overallAcademicStanding"/>
                                                <div class="sm-italic-flyout-registered"
                                                     id="spp_student_overall_standing"></div>

                                                <div class="sm-italic-flyout-registered"
                                                     id="spp_student_overall_standing_permits"></div>
                                            </a>
                                        </li>
                                        <li class="registered-list registered-panel" id="combined_academic_standing_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <span class="student_status_yield"></span><g:message
                                                    code="student.profile.registration.notices.combinedAcademicStanding"/>
                                                <div class="sm-italic-flyout-registered"
                                                     id="spp_student_combined_standing"></div>

                                                <div class="sm-italic-flyout-registered"
                                                     id="spp_student_combined_standing_permits">
                                                    <g:message
                                                            code="student.profile.registration.notices.preventsRegistration"/>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="registered-list registered-panel" id="study_path_standing_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <span class="student_status_yield"></span>
                                                <g:message code="student.profile.registration.notices.studyPathStanding"/>
                                                <div class="sm-italic-flyout-registered" id="spp_study_path_standing"></div>
                                            </a>
                                        </li>
                                        <li class="registered-list registered-panel" id="student_status_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <span class="student_status_check" id="student_status_icon"></span>
                                                <g:message code="student.profile.registration.notices.status"/>
                                                <div class="sm-italic-flyout-registered" id="spp_student_reg_status"></div>

                                                <div class="sm-italic-flyout-registered"
                                                     id="spp_student_reg_status_permits"></div>
                                            </a>
                                        </li>
                                        <li class="registered-list registered-panel" id="enrollment_status_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <span class="student_status_check" id="enrollment_status_icon"></span>
                                                <g:message code="student.profile.registration.notices.enrollmentStatus"/>
                                                <div class="sm-italic-flyout-registered"
                                                     id="spp_student_enrollment_status_permits"></div>
                                            </a>
                                        </li>
                                        <li class="registered-list registered-panel" id="registration_pin_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <div class="registered-list large-padding-left">
                                                    <g:message code="student.profile.registration.notices.pinAssigned"/>
                                                </div>

                                                <div class="sm-italic-flyout-registered" id="spp_registration_pin"></div>
                                            </a>
                                        </li>
                                        <li class="registered-list registered-panel" id="time_tickets_li" role="none">
                                            <a href="#" role="menuitem" tabindex="-1">
                                                <div class="registered-list large-padding-left">
                                                    <g:message code="student.profile.registration.notices.timeTickets"/>
                                                </div>

                                                <div class="sm-italic-flyout-registered" id="spp_time_ticket"></div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </g:if>

            <%-- HOLDS --%>
                <g:if test="${curriculumConfiguration.find { it.config == "holds" } != null}">
                    <div class="dropdown profile-item" id="holds-dropdown">
                        <a href="#" id="student-holds-list" class="dropdown-toggle profile-label" data-toggle="dropdown"
                           aria-expanded="false" aria-haspopup="listbox" aria-describedby="holdsDetail">
                            <g:message code="student.profile.top.holds"/>
                            <span class="holds-number" id="holds-number">0</span>
                            <span class="sr-only" id="holdsDetail">${g.message(code: 'student.profile.regnotice.holds.details')}</span>
                        </a>
                        <ul class="dropdown-menu scrollable-menu" role="presentation" aria-live="assertive">
                            <li>
                                <div class="holds-flyout" id="holds-container">
                                    <script id="holdsConfig" type="text/x-handlebars-template">
                                    <g:render template="/studentHolds/studentHolds"/>
                                    </script>
                                </div>
                            </li>
                        </ul>
                    </div>
                </g:if>
            </div>

            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-navbar-collapse">
                    <span class="sr-only"><g:message code="student.profile.navigation"/></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
        </div>
    </div>

    <div class="container profile-container">
        <div class="row main-row">
            <%------ STUDENT SIDE NAV BAR ---------%>
            <div class="student-container col-xs-12 col-sm-2 col-md-2 col-lg-2 no-padding">
                <div class="row">
                    <%------ profile pic, etc ------%>
                    <div class="student-info-container profile-picture text-center col-xs-4 col-sm-12 col-md-12 col-lg-12">
                        <div class="student-info-photo">
                            <img class="img-responsive center-block student-picture"
                                 alt="<g:message code="student.profile.menu.photo.alt"/>"
                                 src="${createLink(uri: '/ssb/studentPicture/picture')}?bannerId=${personDisplay.bannerId}"/>
                        </div>
                        <g:if test="${personDisplay.bioInformation.confidential}">
                            <div class="confidential-container">
                                <div class="confidentialIndicator">
                                    <span class="shield-confidential"></span>

                                    <span class="student-confidential" id="confidentialLabel">
                                        <g:message code="student.profile.confidential"/>
                                    </span>
                                </div>
                            </div>
                        </g:if>

                        <g:if test="${navigation.configuration.find {
                            it.config == "studentCardEnabled"
                        } != null}">
                            <span class="student-name medium-padding center-block" aria-label="${g.message(code: 'student.profile.confidential')}">
                                <a href="#" class="popup-link" aria-label=" <g:message
                                        code="student.profile.popup.card.sr.help" args="[personDisplay.personDisplayName]"/>" aria-haspopup='true' tabindex="0"
                                   data-id="${personDisplay.bannerId}"
                                   data-term="${termDisplay.code}">${personDisplay.personDisplayName}</a></span>
                        </g:if>
                        <g:else>
                            <span class="student-name medium-padding center-block"
                                  aria-label="${g.message(code: 'student.profile.confidential')}">${personDisplay.personDisplayName}
                            </span>
                        </g:else>
                    </div>

                    <%------ side bar links ------%>
                    <div class="navigation-container col-xs-8 col-sm-12 col-md-12 col-lg-12">
                        <ul class="student-p-navigation-list">
                            <li class="dashboard-menu-default student-p-self-navigation-list-active"
                                aria-labelledby="dashboard">
                                <span class="student-p-self-navigation-item-active no-padding no-margin"
                                      id="dashboard">
                                    <a class="student-p-self-navigation-item-active curriculumAndCourses"
                                       href="#"><g:message code="student.profile.menu.dashboard"/></a>
                                </span>
                            </li>

                            <g:if test="${
                                (navigation.configuration.find { it.config == "secondaryEducationEnabled" } != null
                                        || navigation.configuration.find {
                                    it.config == "postSecondaryEducationEnabled"
                                } != null) && navigation.configuration.find {
                                    it.config == "testScoresEnabled"
                                } != null}">
                                <li class="dashboard-menu-default" aria-labelledby="prior_education_testing">
                                    <span class="student-p-self-navigation-item-inactive no-padding no-margin">
                                        <a class="student-p-self-navigation-item-inactive priorEdAndTesting"
                                           href="#" id="prior_education_testing"><g:message code="student.profile.menu.prior.testing"/></a>
                                    </span>
                                </li>
                            </g:if>
                            <g:elseif test="${
                                (navigation.configuration.find { it.config == "secondaryEducationEnabled" } != null
                                        || navigation.configuration.find {
                                    it.config == "postSecondaryEducationEnabled"
                                } != null) && navigation.configuration.find {
                                    it.config == "testScoresEnabled"
                                } == null}">
                                <li class="dashboard-menu-default" aria-labelledby="prior_education">
                                    <span class="student-p-self-navigation-item-inactive no-padding no-margin">
                                        <a class="student-p-self-navigation-item-inactive priorEdAndTesting"
                                           href="#" id="prior_education"><g:message code="student.profile.menu.prior"/></a>
                                    </span>
                                </li>
                            </g:elseif>
                            <g:elseif test="${
                                (navigation.configuration.find { it.config == "secondaryEducationEnabled" } == null
                                        && navigation.configuration.find {
                                    it.config == "postSecondaryEducationEnabled"
                                } == null) && navigation.configuration.find {
                                    it.config == "testScoresEnabled"
                                } != null}">
                                <li class="dashboard-menu-default" aria-labelledby="prior_testing">
                                    <span class="student-p-self-navigation-item-inactive no-padding no-margin">
                                        <a class="student-p-self-navigation-item-inactive priorEdAndTesting"
                                           href="#" id="prior_testing"><g:message code="student.profile.menu.testing"/></a>
                                    </span>
                                </li>
                            </g:elseif>
                        </ul>

                        <g:if test="${navigation.additionalLinks || navigation.configuration.find {
                            it.config == "degreeEvaluation"
                        } != null}">
                            <div class="dashboard-menu-default-links">

                                <span class="student-p-other-navigation-item-title no-margin hidden-xs medium-padding-bottom"
                                      id="additional_links" tabindex="-1" role="heading" aria-level="2">
                                    <g:message code="student.profile.menu.additionalLinks"/>
                                </span>


                                <div class="dropdown">

                                    <button type="button" class="btn btn-default no-border dropdown-toggle visible-xs"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                            id="dropdown-additional-links">
                                        <g:message code="student.profile.menu.additionalLinks"/><span
                                            class="caret"></span>
                                    </button>


                                    <ul class="dropdown-menu student-p-navigation-list">

                                        <g:if test="${navigation.configuration.find {
                                            it.config == "degreeEvaluation"
                                        } != null}">
                                            <g:if test="${navigation.useDegreeWorks}">
                                                <li class="student-p-other-navigation-list-default">
                                                    <a href="#"
                                                       class="student-p-other-navigation-item-default useDwLink"
                                                       data-id="${personDisplay.bannerId}"><g:message
                                                            code="student.profile.menu.degreeEvaluation"/></a>
                                                </li>
                                            </g:if>
                                            <g:else>
                                                <li class="student-p-other-navigation-list-default">
                                                      <a class="student-p-other-navigation-item-default"
                                                           href="#"
                                                            <g:if test="${persona == "student"}">
                                                                onClick="open9XInternalLinks('${createLink(uri: '/ssb/degreeEvaluation#!/home/' + termDisplay.code + '/tabs/curriculum')}'); return false;"
                                                            </g:if>
                                                            <g:else>
                                                                onClick="open9XInternalLinks('${createLink(uri: '/ssb/degreeEvaluation')}?studentId=${personDisplay.studentId}&termCode=${termDisplay.code}#!/home/${termDisplay.code}/tabs/curriculum'); return false;"
                                                            </g:else>
                                                           target="banner8link"><g:message code="student.profile.menu.degreeEvaluation"/>
                                                      </a>
                                                </li>
                                            </g:else>
                                        </g:if>

                                        <g:each var="additionalLink" in="${navigation.additionalLinks}">
                                            <li class="student-p-other-navigation-list-default">
                                                <g:if test="${additionalLink.type == 'Banner8'}">
                                                    <a class="student-p-other-navigation-item-default"
                                                       href="${createLink(uri: '/ssb/studentProfile/open8xDeepLink')}?bannerId=${personDisplay.bannerId}&termCode=${termDisplay.code}&forwardUrl=${additionalLink.url}"
                                                       target="banner8link">${additionalLink.description}</a>
                                                </g:if>
                                                <g:elseif test="${additionalLink.descriptionCode == 'student.profile.menu.academicTranscript'}">
                                                    <a class="student-p-other-navigation-item-default"
                                                       href="#"
                                                        <g:if test="${persona == "student"}">
                                                            onClick="open9XInternalLinks('${createLink(uri: '/ssb/academicTranscript')}'); return false;"
                                                        </g:if>
                                                        <g:else>
                                                            onClick="open9XInternalLinks('${createLink(uri: '/ssb/academicTranscript')}?studentId=${personDisplay.studentId}&termCode=${termDisplay.code}'); return false;"
                                                        </g:else>
                                                       target="banner8link">${additionalLink.description}</a>
                                                </g:elseif>
                                                <g:elseif test="${additionalLink.descriptionCode == 'student.profile.menu.vewApplicationToGraduate'}">
                                                    <a class="student-p-other-navigation-item-default"
                                                       href="#"
                                                        <g:if test="${persona == "student"}">
                                                            onClick="open9XInternalLinks('${createLink(uri: '/ssb/viewGraduationApplication')}'); return false;"
                                                        </g:if>
                                                        <g:else>
                                                            onClick="open9XInternalLinks('${createLink(uri: '/ssb/viewGraduationApplication')}?studentId=${personDisplay.studentId}&termCode=${termDisplay.code}'); return false;"
                                                        </g:else>
                                                       target="banner8link">${additionalLink.description}</a>
                                                </g:elseif>
                                                <g:elseif test="${additionalLink.descriptionCode == 'student.profile.menu.viewGrades'}">
                                                    <a class="student-p-other-navigation-item-default"
                                                       href="#"
                                                        <g:if test="${persona == "student"}">
                                                            onClick="open9XInternalLinks('${createLink(uri: '/ssb/studentGrades')}'); return false;"
                                                        </g:if>
                                                        <g:else>
                                                            onClick="open9XInternalLinks('${createLink(uri: '/ssb/studentGrades')}?bannerId=${personDisplay.studentId}&termCode=${termDisplay.code}'); return false;"
                                                        </g:else>
                                                       target="banner8link">${additionalLink.description}</a>
                                                </g:elseif>
                                                <g:else>
                                                    <a class="student-p-other-navigation-item-default"
                                                       href="#"
                                                       onClick="openInNewWindow('${additionalLink.index}');
                                                       return false;"
                                                       target="banner8link">${additionalLink.description}</a>
                                                </g:else>
                                            </li>
                                        </g:each>
                                    </ul>

                                </div>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>

            <div class="visible-xs clearfix"></div>

            <%------ STUDENT INFO / NOTES PANEL ---------%>
            <div class="notes-container col-xs-12 col-sm-4 col-md-4 col-lg-4 no-padding">
                <div id="studentProfilePanelMiddleColumn" role="presentation"
                     class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                    <div role="application">
                        <ul role="tablist" id="bioNotesList"
                            class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                            <li role="tab" class="ui-state-default ui-corner-top" aria-label="${g.message(code: 'student.profile.studentinformation.tab.srOnly')}">
                                <span class="no-margin tab-title" role="presentation" >
                                    <a href="#bioTab" id="bioHeader">
                                        <g:message code="student.profile.tab.heading.bioInformation"/>
                                    </a>
                                </span>
                            </li>
                            <g:if test="${navigation.configuration.find { it.config == "studentNotesEnabled" } != null}">
                                <li role="tab" id="notesEnabled"
                                    class="ui-state-default ui-corner-top" aria-label="${g.message(code: 'student.profile.notes.tab.srOnly')}">
                                    <span class="no-margin tab-title" role="presentation" >
                                        <a href="#notesTab" id="notesHeader">
                                            <g:message code="student.profile.tab.heading.notes"/>
                                            <span class="notes-number" id="notes-number">0</span>
                                        </a>
                                    </span>
                                </li>
                            </g:if>
                        </ul>
                    </div>

                    <div id="tabWrapper"
                         class="ui-layout-content top-panel-content ui-widget-content small-padding-top">
                        <div id="bioTab" role="tabpanel" tabindex="0">
                            <div id="student-information-tab">
                            <div role="presentation" class="row no-margin standard-padding-bottom">
                                <h2 class="sr-only"><g:message code="student.profile.studentinformation.tabpanel.srOnly"/></h2>

                                <h3 class="standard-padding-left no-margin title">
                                    <g:message code="student.profile.heading.bioInformation"/>
                                </h3>
                                <g:if test="${personDisplay.bioInformation.emailAddressNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.email"/></strong>
                                        <g:if test="${personDisplay.bioInformation.emailAddress == ""}">
                                            <span class="col-sm-6 col-xs-6"><g:message
                                                    code="student.profile.not.provided"/></span>
                                        </g:if>
                                        <g:else>
                                            <a aria-label="<g:message code="student.profile.menu.student.email.help"
                                                                      args="${[personDisplay.personDisplayName, personDisplay.bioInformation.emailAddress]}"/>"
                                               href="mailto:${personDisplay.bioInformation.emailAddress}"
                                               class="bioLinkClass col-sm-6 col-xs-6">${personDisplay.bioInformation.emailAddress}</a>
                                        </g:else>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.telephoneNumberNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.phone"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.telephoneNumber}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.sexNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.gender"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.sex}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.birthDateNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.birthDate"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.birthDate}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.ethnicity.descriptionNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.ethnicity"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.ethnicity.description}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.ethnicity.ethnicityCodeNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.ethnicity"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.ethnicity.ethnicityCode}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.ethnicity.raceDescriptionNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.race"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.ethnicity.raceDescription}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.citizenship.isCitizenNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.citizenshipStatus"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.citizenship.isCitizenDesc}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.citizenship.descriptionNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.citizenshipDescription"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.citizenship.description}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.bioInformation.emergencyContactNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.emergencyContact"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.emergencyContact?.displayName}</span>
                                    </div>

                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6 "><g:message
                                                code="student.profile.label.emergencyPhone"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.bioInformation.emergencyContact?.displayPhoneNumber}</span>
                                    </div>
                                </g:if>
                            </div>

                            <div class="row no-margin standard-padding-bottom">
                                <h3 id="generalInformation" tabIndex="0"
                                    title="${personDisplay.generalInformation.termRangeDescription}"
                                    class="standard-padding-left no-margin title"
                                    aria-label="${personDisplay.generalInformation.termRangeDescription}">
                                    <g:message code="student.profile.heading.generalInformation"/>
                                </h3>
                                <g:if test="${personDisplay.generalInformation.levelNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.level"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.level}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.classNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.class"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.class}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.statusNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.status"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.studentStatus}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.typeNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.type"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.studentType}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.residencyNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.residency"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.residency}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.campusNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.campus"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.campus}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.firstTermAttendedNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.firstTermAttended"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.firstTermAttended}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.matriculatedTermNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.matriculatedTerm"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.matriculatedTerm}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.lastTermAttendedNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.lastTermAttended"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.lastTermAttended}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.leaveOfAbsenceNotConfigured == null}">
                                    <div class="row no-margin">
                                        <strong class="col-sm-6 col-xs-6"><g:message
                                                code="student.profile.label.leaveOfAbsence"/></strong>
                                        <span class="col-sm-6 col-xs-6">${personDisplay.generalInformation.leaveOfAbsence}</span>
                                    </div>
                                </g:if>

                                <g:if test="${personDisplay.generalInformation.leaveOfAbsenceDatesNotConfigured == null}">
                                    <g:if test="${personDisplay.generalInformation.leaveOfAbsence != message(code: "student.profile.not.provided")}">
                                        <div class="row no-margin">
                                            <div class="col-sm-6 col-xs-6 col-sm-offset-6">
                                                <span>${personDisplay.generalInformation.leaveOfAbsenceStartDate}</span> - <span>${personDisplay.generalInformation.leaveOfAbsenceEndDate}</span>
                                            </div>
                                        </div>

                                    </g:if>
                                </g:if>
                            </div>

                            <div class="row no-margin standard-padding-bottom">
                            <!-- *********** grad info ***********-->
                                <g:if test="${navigation.configuration.find {
                                    it.config == "graduationInformationEnabled"
                                } != null}">
                                    <h3 id="gradInformation" title="" class="standard-padding-left no-margin title">
                                        <g:message code="student.profile.gradInfo.heading"/>
                                    </h3>
                                    <g:if test="${personDisplay.graduationInformation.applicationsNotConfigured == null}">
                                        <div class="row no-margin">
                                            <strong class="col-sm-6 col-xs-6"><g:message
                                                    code="student.profile.gradInfo.applications"/></strong>
                                            <g:if test="${personDisplay.graduationInformation.active == 0}">
                                                <span class="col-sm-6 col-xs-6"><g:message
                                                        code="student.profile.gradInfo.active.none"/></span>
                                            </g:if>
                                            <g:else>
                                                <g:if test="${personDisplay.graduationInformation.linkNotConfigured == null}">
                                                    <g:if test="${persona == "student"}">
                                                        <span class="col-sm-6 col-xs-6">
                                                            <a aria-label="<g:message
                                                                    code="student.profile.gradInfo.applications.label"
                                                                    args="${[personDisplay.graduationInformation.active]}"/>"
                                                               target="banner8link" class="graduationApplicationLink"
                                                               href="${createLink(uri: '/ssb/studentProfile/open8xDeepLink')}?bannerId=${personDisplay.bannerId}&termCode=${termDisplay.code}&forwardUrl=<g:message
                                                                       code="student.profile.gradInfo.student.url"
                                                                       args="${[navigation.banner8SSOUrl]}"/>"><g:message
                                                                    code="student.profile.gradInfo.active"
                                                                    args="${[personDisplay.graduationInformation.active]}"/></a>
                                                        </span>
                                                    </g:if>
                                                    <g:else>
                                                        <span class="col-sm-6 col-xs-6">
                                                            <a aria-label="<g:message
                                                                    code="student.profile.gradInfo.applications.label"
                                                                    args="${[personDisplay.graduationInformation.active]}"/>"
                                                               target="banner8link" class="graduationApplicationLink"
                                                               href="${createLink(uri: '/ssb/studentProfile/open8xDeepLink')}?bannerId=${personDisplay.bannerId}&termCode=${termDisplay.code}&forwardUrl=<g:message
                                                                       code="student.profile.gradInfo.advisor.url"
                                                                       args="${[navigation.banner8SSOUrl]}"/>"><g:message
                                                                    code="student.profile.gradInfo.active"
                                                                    args="${[personDisplay.graduationInformation.active]}"/></a>
                                                        </span>
                                                    </g:else>
                                                </g:if>
                                                <g:else>
                                                    <span class="col-sm-6 col-xs-6">
                                                        <g:message code="student.profile.gradInfo.active"
                                                                   args="${[personDisplay.graduationInformation.active]}"/>
                                                    </span>
                                                </g:else>
                                            </g:else>
                                        </div>
                                    </g:if>
                                    <g:if test="${personDisplay.graduationInformation}">
                                        <g:each var="entry" in="${personDisplay.graduationInformation.degree}"
                                                status="i">
                                            <g:if test="${personDisplay.graduationInformation.degreeNotConfigured == null}">
                                                <div class="row no-margin">
                                                    <strong class="col-sm-6 col-xs-6 "><g:message
                                                            code="student.profile.gradInfo.awarded"/></strong>
                                                    <span class="col-sm-6 col-xs-6">${entry.gradAwarded}</span>
                                                </div>
                                            </g:if>
                                            <g:if test="${personDisplay.graduationInformation.termNotConfigured == null}">
                                                <div class="row no-margin">
                                                    <strong class="col-sm-6 col-xs-6 "><g:message
                                                            code="student.profile.gradInfo.term"/></strong>
                                                    <span class="col-sm-6 col-xs-6">${entry.gradTerm}</span>
                                                </div>
                                            </g:if>
                                            <g:if test="${personDisplay.graduationInformation.dateNotConfigured == null}">
                                                <div class="row no-margin">
                                                    <strong class="col-sm-6 col-xs-6"><g:message
                                                            code="student.profile.gradInfo.date"/></strong>
                                                    <span class="col-sm-6 col-xs-6">${entry.gradDate}</span>
                                                </div>
                                            </g:if>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <span><g:message code="student.profile.gradInfo.none"/></span>
                                    </g:else>
                                </g:if>
                            </div>

                            <div class="row no-margin standard-padding-bottom">

                            <!-- ************* advisors *************-->
                                <g:if test="${navigation.configuration.find {
                                    it.config == "listAdvisorsEnabled"
                                } != null}">
                                    <h3 id="advisorInformation" title="" class="standard-padding-left no-margin title">
                                        <g:message code="student.profile.advisorList.heading"/>
                                    </h3>
                                    <g:if test="${personDisplay.advisorInformation}">
                                        <g:each var="advisor" in="${personDisplay.advisorInformation}">
                                            <div class="row no-margin">
                                                <strong class="col-sm-6 col-xs-6 advisorOutput">
                                                    <g:each var="fragment"
                                                            in="${advisor.typeString}">${fragment}</g:each>
                                                </strong>
                                                <g:if test="${navigation.configuration.find {
                                                    it.config == "facultyCardEnabled"
                                                } != null}">
                                                    <div class="facultyLinkWrapper col-sm-6 col-xs-6">
                                                        <span class="sr-only" aria-hidden="true" id="facultyLinkInfo"><g:message code="student.profile.popup.card.details"/></span>
                                                        <a href="#" class="facultyLinkClass"
                                                           aria-describedby="facultyLinkInfo"
                                                           aria-haspopup="true"
                                                           data-id="${advisor.bannerId}"
                                                           data-term="${advisor.term}">${advisor.nameString}</a>
                                                    </div>
                                                </g:if>
                                                <g:else>
                                                    <span class="facultyLinkWrapper col-sm-6 col-xs-6">${advisor.nameString}</span>
                                                </g:else>
                                            </div>

                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <span class="col-sm-12 col-xs-12"><g:message
                                                code="student.profile.advisorList.none"/></span>
                                    </g:else>
                                </g:if>
                            </div>
                            </div>
                        </div>

                        <g:if test="${navigation.configuration.find { it.config == "studentNotesEnabled" } != null}">
                            <div id="notesTab" role="tabpanel">
                                <div id="saveViewable"
                                     data-endpoint='${createLink(controller: "studentProfile", action: "renderCurriculumTemplate")}'></div>

                                <div class="row no-margin standard-padding-bottom medium-padding-top">
                                    <h2 class="sr-only" id="panelHelpText"><g:message code="student.profile.notes.tabpanel.srOnly"/></h2>
                                    <span class="sr-only" id="newNoteHelpText"><g:message code="student.profile.notes.tabkey.srOnly"/></span>

                                    <a id="newNoteLink" href="#" class="btn btn-default medium-margin-left" aria-labelledby="panelHelpText newNoteHelpText" tabindex="0">
                                        <span class="no-margin title inline-block title">
                                            + <g:message code="student.profile.notes.new"/>
                                        </span>
                                    </a>

                                    <div class="pull-right inline-block medium-padding-right">
                                        <label for="selectSortBy" class="sr-only"><g:message
                                                code="student.profile.sort.label"/></label>
                                        <select class="select-sort" id="selectSortBy">
                                            <option value="" disabled selected><g:message
                                                    code="student.profile.sort"/></option>
                                            <option value="date"><g:message
                                                    code="student.profile.sort.category.date"/></option>
                                            <option value="author"><g:message
                                                    code="student.profile.sort.category.author"/></option>
                                            <option value="category"><g:message
                                                    code="student.profile.sort.category.category"/></option>
                                        </select>
                                    </div>

                                    <div class="row no-margin medium-padding main-note clearBoth" id="notes-main"
                                         data-for="${personDisplay.bannerId}">
                                        <script id="notesConfig" type="text/x-handlebars-template">
                                        <g:render plugin="banner-student-common-ss-ui"
                                                  template="/studentNotes/studentNotes"/>
                                        </script>
                                    </div>
                                </div>
                            </div>

                        </g:if>

                    </div>
                </div>
            </div>

            <div class="visible-xs clearfix"></div>

            <%------ CURRICULUM PRIOR EDUCATION / TESTING PANEL---------%>
            <div class="cirriculum-container col-xs-12 col-sm-6 col-md-6 col-lg-6 no-padding">
                <div id="getCurriculumTemplate"
                     data-endpoint='${createLink(controller: "studentProfile", action: "renderCurriculumTemplate")}'></div>

                <div id="getPriorEducationAndTestingTemplate"
                     data-endpoint='${createLink(controller: "priorEducationAndTesting", action: "renderPriorEducationAndTestingTemplate")}'></div>

                <div id="getPinDialogTemplate"
                     data-endpoint='${createLink(controller: "priorEducationAndTesting", action: "renderPinDialogTemplate")}'></div>

                <div id="center-pane-data-curriculum" aria-hidden="false" tabindex="-1"></div>

                <div id="center-pane-data-prior" class="prior-container" aria-hidden="true" tabindex="-1"></div>

            </div>

            <div class="visible-xs clearfix"></div>
        </div>

    </div>

    <g:render template="/sectionDetails/sectionDetails" plugin="banner-student-common-ss-ui"/>
</div>
<span class="sr-only" id="reader-pause">.</span>

<asset:javascript src="modules/studentProfileJS-mf.js"/>
<asset:javascript src="modules/studentNotes-mf.js"/>

</body>
</html>
