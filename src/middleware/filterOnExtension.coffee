module = {} if not module

module.exports = (config) ->
  return (req, res, next) ->
    next() if not req.query.extension

    console.log req.query

    if Array.isArray req.query.extension
      extensions = req.query.extension
    else
      extensions = [ req.query.extension ]

    console.log extensions

    res.files = res.files.filter (file) ->
      matchExtensions extensions, file.extensions

    next()

# matchExtensions :: [string] -> [string] -> boolean
#
# > matchExtensions ['abc', 'def', '1'], ['abc']
# true
# > matchExtensions ['def', '1'], ['abc', '1']
# true
# > matchExtensions ['abc', 'def', '1'], ['xyz']
# false
# > matchExtensions ['def'], ['abc', 'def', 'xyz']
# true
# > matchExtensions [ 'coffe' ], [ 'coffee' ]
# false
# > matchExtensions [ 'coffee' ], [ 'coffe' ]
# false
# > matchExtensions [], []
# false
# > matchExtensions null, ['something']
# false
# > matchExtensions ['test'], undefined
matchExtensions = (a, b) ->
  return false if not a or not b
  return false if a.length is 0 or b.length is 0

  for ext1 in a
    for ext2 in b
      return true if ext1 == ext2

  return false
