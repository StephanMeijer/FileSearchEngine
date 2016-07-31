module.exports = [
  "./middleware/receiveFiles"
  "./middleware/readFileData"
  "./middleware/getFileExtension"
  "./middleware/filterOnExtension"
  "./middleware/filterOnSearchTerm"
].map(require)
