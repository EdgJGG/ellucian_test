var app = angular.module("uiCatalogAngular");
app.controller("checkboxCtrl",['$scope', function($scope) {
    $scope.checkId1 = "Enable";
    $scope.checkModel1 = true;
    $scope.checkValue1 = "checkBox1";
    $scope.checkLabel1 = $.i18n.prop('checkbox.label.enable');

    $scope.checkId2 = "Disable";
    $scope.checkModel2 = false;
    $scope.checkValue2 = "checkBox2";
    $scope.checkLabel2 = $.i18n.prop('checkbox.label.disable');

    $scope.checkId3 = "NoLabel";
    $scope.checkModel3 = false;
    $scope.checkValue3 = "checkBox3";
    $scope.checkLabel3 = "NoLabel";

    $scope.checkId4 = "DiffLabel";
    $scope.checkModel4 = false;
    $scope.checkValue4 = "checkBox4";
    $scope.checkLabel4 = $.i18n.prop('checkbox.label.differnt-aria-label');

    $scope.checkId5 = "Dirtycheckbox";
    $scope.checkModel5 = false;
    $scope.checkValue5 = "checkBox5";
    $scope.checkLabel5 = "";
    $scope.checkAriaLabelDirty = $.i18n.prop('checkbox.label.dirty');

    $scope.checkId6 = "Selected-Disable";
    $scope.checkModel6 = true;
    $scope.checkValue6 = "checkBox6";
    $scope.checkLabel6 = $.i18n.prop('checkbox.label.selected-disabled');

    $scope.cleanButtonLabel= $.i18n.prop('button.label.clean-button');

    $scope.cleanCheckbox  = function(){
        window.notificationCheckboxTest = "";
        $scope.dirtyform.$setPristine();
        $scope.dirtyform.$setUntouched();
        $scope.checkModel5 = false;
    };
}]);
