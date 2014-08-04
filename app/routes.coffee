module.exports = (app) -> 
  
  app.get('/', (req, res) ->
    res.render('index')
  )

  app.get('/contact-location', (req, res) ->
    res.render('contact')
  )

  app.get('/services', (req, res) ->
    res.render('services')
  )

  app.get('/studio', (req, res) ->
    res.render('studio')
  )

  app.get('/about', (req, res) ->
    res.render('/about')
  )
