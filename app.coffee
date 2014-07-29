module.exports = ->  
  express = require('express')
  path = require('path')
  favicon = require('static-favicon')
  logger = require('morgan')
  cookieParser = require('cookie-parser')
  bodyParser = require('body-parser')
  app = express()

  app.set('view engine', 'jade')

  app.use(favicon())
  app.use(logger('dev'))
  app.use(bodyParser.json())
  app.use(bodyParser.urlencoded({urlencoded: true}))
  app.use(cookieParser())

  app.set('port', process.env.PORT || 8008)

  app.use( ->
    err = new Error('Not found')
    err.status = 404
    next(err)
  )

  require('./routes/routes')(app)
  #Error handling?

#  if (app.get('env') == 'development') 
#    app.use((err, req, res, next) ->
#      res.status(err.status || 500)
#      res.render('error', {
#        message: err.message
#        error: err
#      })
#      
#    )
