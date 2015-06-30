angular.module('player.ArtistController', [])
    .controller('ArtistController', ['$scope', 'DataService', function($scope, DataService) {
        DataService.getArtists(function(data){
        	$scope.artists = data;

        	$scope.artists.forEach(function(artist){
        		DataService.getArtistImage(artist.name, function(img){
        			console.log(img);
        			artist.img = img;
        		});
        	});
        });
    }]);
