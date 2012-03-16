module.exports = (io) ->
  (object) ->
    io.sockets.on 'function', (data, cb) ->
      unless data.function? then return cb new Error "Invalid Args"
      functonPath = data.function.split '.'
      functionObject = reduce(functionPath, (memo, current) ->
        return memo[current] if memo?
      object)
      
      return cb new Error "Invalid Function" unless isFunction(functionObject)
      delete data.function
      
      return functionObject(data, cb)
      
    # initializeRoute = (path, object) ->
    #   for key in Object.keys(object)
    #     do(key) ->
    #       if(isFunction(object[key]))
    #         #add rout
    #         app.get "#{path}.#{key}", (req, res) ->
    #           object[key] req.params, (result) ->
    #             res.render(result)
    #       else
    #         initializeRoute("#{path}/#{key}",object[key])
    # return initializeRoute(path, object)
    
    
    
isFunction = (obj) ->
  return !!(obj && obj.constructor && obj.call && obj.apply)