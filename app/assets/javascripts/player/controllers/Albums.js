angular.module('player.AlbumController', [])
    .controller('AlbumController', ['$scope', 'DataService', function($scope, DataService) {
        DataService.getAlbums(function(data){
        	$scope.albums = data;

        	$scope.albums.forEach(function(album){
        		DataService.getAlbumImage(album.name, album.artist.name || '', function(img){
        			console.log(img);
        			album.img = img;
        		});
        	});
        });
    }]);
