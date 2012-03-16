module.exports = function(app, io){
  return {
    objectify: require('./lib/objectify.coffee'),
    routify: require('./lib/routify.coffee')(app),
    socketify: require('./lib/socketify.coffee')(io)
  }
};
