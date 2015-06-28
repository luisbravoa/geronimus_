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



    }]);
