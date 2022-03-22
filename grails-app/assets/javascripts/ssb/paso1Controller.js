'use strict';

app.controller('paso1Controller', ['$scope', '$http',  function ($scope, $http){

    $scope.varHolaMundo = "Hello World From my first Controller!!";
    $scope.listaDePersonas = [];
    $scope.comunas = [];
    $scope.curriculums = [];


    this.$onInit = function () {

        $http.get('http://localhost:8080/Lac/paso2')
            .then(function (response) {
                $scope.comunas = response.data;
            });
    }
}]);