glob = require 'glob'
pathJoin = (require 'path').join

module.exports = (config) ->
  return (req, res, next) ->
    glob (pathJoin config.path, "**/*"), {}, (error, paths) ->
      if error
        res.status(500).send
          message: 'Reading files in path failed'
          code: 0
      else
        res.files = (path: path for path in paths)
        next()
