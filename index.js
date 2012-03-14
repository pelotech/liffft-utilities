function(){
  module.exports = function(app){
    exports.objectify = require('./lib/objectify.coffee');
    exports.routify = require('./lib/routify.coffee')(app);
  };
}();