angular.module('player.SongController', [])
    .controller('SongController', ['$scope', '$http', 'DataService',  function($scope, $http, DataService) {
        DataService.getSongs(function(data){
        	$scope.songs = data;
        })


    }]);

