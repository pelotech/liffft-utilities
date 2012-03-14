module.exports = (object) =>
  initializeRoute = (object) ->
    object = {}
    for file in fs.readdirSync(path)
      do(file) ->
        return if file[0] is '.'
    
        [name, extension] = file.split('.')
        if extension is 'coffee'
          object[name] = require(path + '/' + file)
              
        if not extension?
          object[name] = initializeAPI(path + '/' + file)
    return object
    
  return initializeRoute(object)