angular.module('player.AppController', [])
    .controller('AppController', ['$scope', function($scope) {
    	var player = new Player();


    	$('#player-side').append(player.element);

    	$scope.play = function(song){
        	console.log(song);
        	player.setSong(song.user_id + '/' + song.file);
        	player.play();
        }
    }]);