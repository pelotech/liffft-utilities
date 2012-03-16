module.exports = (app) ->
  (path, object) ->
    initializeRoute = (path, object) ->
      for key in Object.keys(object)
        do(key) ->
          if(isFunction(object[key]))
            #add rout
            app.get "#{path}/#{key}", (req, res) ->
              object[key] req.params, (result) ->
                res.render(result)
          else
            initializeRoute("#{path}/#{key}",object[key])
    return initializeRoute(path, object)
    
    
    
isFunction = (obj) ->
  return !!(obj && obj.constructor && obj.call && obj.apply)