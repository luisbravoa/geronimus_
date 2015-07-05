angular.module('player.DataService', [])
    .service('DataService', ['$http', function($http) {



        this.getSongs = function(success, fail) {
            $http.get('/songs').
            success(function(data, status, headers, config) {
            	success(data);    
            }).
            error(function(data, status, headers, config) {
                if(fail){
                	fail(data);	
                }
                
            });
        }


        this.getArtists = function(success, fail) {
            $http.get('/artists').
            success(function(data, status, headers, config) {
                success(data);    
            }).
            error(function(data, status, headers, config) {
                if(fail){
                    fail(data); 
                }
                
            });
        }

        this.getAlbums = function(success, fail) {
            $http.get('/albums').
            success(function(data, status, headers, config) {
                success(data);    
            }).
            error(function(data, status, headers, config) {
                if(fail){
                    fail(data); 
                }
                
            });
        }


        this.getTrackImage = function(song, success, fail){
        	$http.get('http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=3560007ae1982c970859a515efeb3174&artist=' + song.artist + '&track=' + song.title + '&format=json')
        	.success(function(data){
        		console.log(data);
        	})
        	.error(function(){

        	});
        }


        this.getArtistImage = function(name, success, fail){
        	$http.get('http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=' + name + '&api_key=3560007ae1982c970859a515efeb3174&format=json')
        	.success(function(data){
        		console.log(data);
        		if(data.artist !== undefined && data.artist.image !== undefined){
        			console.log(data)
        			success(data.artist.image[2]['#text']);
        		}
        	})
        	.error(function(){

        	});
        }


        this.getAlbumImage = function(name, artist , success, fail){
            $http.get('http://ws.audioscrobbler.com/2.0/?method=album.getinfo&artist=' + artist + '&&album=' + name + '&api_key=3560007ae1982c970859a515efeb3174&format=json')
            .success(function(data){
                console.log(data);
                if(data.album !== undefined && data.album.image !== undefined){
                    console.log(data)
                    success(data.album.image[2]['#text']);
                }
            })
            .error(function(){

            });
        }

    }]);
