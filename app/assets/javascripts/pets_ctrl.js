(function () {
  "use strict";

  angular.module("app").controller("petsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/pets.json").then(function(response) {
        $scope.pets = response.data;
      });
      
    }