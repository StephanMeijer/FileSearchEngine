express = require 'express'

factories = require './middleware'

config = require '../config.json'

app = express()

app.use (factory config) for factory in factories

app.get '/', (req, res) -> res.send(res.files)

app.listen 3000, () ->
  console.log('Example app listening on port 3000!')
