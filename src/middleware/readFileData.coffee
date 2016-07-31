fs = require 'fs'

module.exports = (config) ->
  return (req, res, next) ->
    res.files = res.files.map (item) ->
      item.stats = fs.statSync item.path

      item.is_file = item.stats.isFile()
      item.is_directory = item.stats.isDirectory()

      return item

    next()
