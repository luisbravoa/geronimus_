angular.module('player.AppController', [])
    .controller('AppController', ['$scope', function($scope) {
    	var player = new Player();


    	$('#player-side').append(player.element);

    	$scope.play = function(song){
        	console.log(song);
        	player.setSong('1/' + song.file);
        	player.play();
        }
    }]);