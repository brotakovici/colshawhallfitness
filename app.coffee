express = require('express')
path = require('path')
favicon = require('static-favicon')
logger = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
stylus = require('stylus')
nib = require('nib')
app = express()

app.set('view engine', 'jade')
app.set('views', path.join(__dirname, 'app/views'))

app.use(favicon())
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({urlencoded: true}))

app.use(stylus.middleware({
  src: path.join(__dirname, 'app')
  dest: path.join(__dirname, 'public')
  compile: ((str, location) ->
    return stylus(str)
           .set('filename', location)
           .set('compress', true)
           .use(nib())
  )
}))
app.use(express.static(path.join(__dirname, 'public')))

app.use(cookieParser())

app.set('port', process.env.PORT || 8008)

#  app.use((next) ->
#    err = new Error('Not found')
#    err.status = 404
#    next(err)
#  )

require('./app/routes')(app)
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

module.exports = app
