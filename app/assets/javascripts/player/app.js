angular.module('player', [
    'ngRoute', 
    'player.AppController', 
    'player.SongController', 
    'player.AlbumController', 
    'player.ArtistController', 
    'player.DataService'
    ])
    .config(function($routeProvider) {
        $routeProvider
            .when('/songs', {
                templateUrl: '/partials/songs.html',
                controller: 'SongController'
            })
            .when('/albums', {
                templateUrl: '/partials/albums.html',
                controller: 'AlbumController'
            })
            .when('/artists', {
                templateUrl: '/partials/artists.html',
                controller: 'ArtistController'
            })
            .otherwise({
                redirectTo: '/songs'
            });
    })
    .run(['$http', function($http) {
        $http.defaults.headers.common.Authorization = $('meta[name=csrf-token]').attr('content');
    }]);
