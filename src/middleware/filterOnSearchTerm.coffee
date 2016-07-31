module = {} if not module

module.exports = (config) ->
  return (req, res, next) ->
    next() if not req.query.search

    search = wordToTerm req.query.search

    next() if not search

    res.files = res.files.filter (file) ->
      matchWords file.path, search

    next()

matchWords = (a, b) ->
  a = wordToTerm a
  b = wordToTerm b

  return (a.indexOf b) > -1 or (b.indexOf a) > -1

wordToTerm = (str) -> filterNonAlphaNumeric str.toString().toLowerCase()

filterNonAlphaNumeric = (str) ->
  str.split ''
     .filter (c) -> ("abcdefghijklmnopqrstuvwxyz0123456789".indexOf c.toLowerCase()) > -1
     .join ''
