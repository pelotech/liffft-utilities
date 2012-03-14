module.exports = function(app){
  return {
    objectify: require('./lib/objectify.coffee'),
    routify: require('./lib/routify.coffee')(app)
  }
};
