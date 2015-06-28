angular.module('player', ['ngRoute', 'player.SongController', 'player.AlbumController', 'player.ArtistController'])
.config(function($routeProvider){
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
});

