module = {} if not module # to run doctests

module.exports = (config) ->
  return (req, res, next) ->
    res.files = res.files.map (item) ->

      if item.stats and item.stats.isFile()
        item.filename = getFilename item.path
        item.extensions = getExtensions item.filename

      return item

    next()

# getFilename :: string -> string
#
# > getFilename('/home/usr/test.java')
# 'test.java'
# > getFilename('/home/test/abc/')
# 'abc'
# > getFilename('/home/testdir')
# 'testdir'
# > getFilename('/')
# null
getFilename = (path) ->
  [_, ..., filename] = (path.split '/').filter (s) -> s

  if filename
    return filename
  else
    return null

# getExtensions :: string -> [string]
#
# > getExtensions('/home/steve')
# []
# > getExtensions('test.tar.gz')
# ['tar', 'gz']
# > getExtensions('test.a.b.c.d.e.f.g.h.i')
# ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']
# > getExtensions('file.ext')
# ['ext']
getExtensions = (filename) -> filename.split('.').splice(1)
