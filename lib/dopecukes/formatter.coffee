md = require('node-markdown').Markdown

output = ""

formatFeature = (feature) =>
  @output += "<h1>#{feature.uri}</h1>"
  @output += "<p>#{md(feature.description)}</p>"

module.exports = (features) =>
  @output = ""
  formatFeature(feature) for feature in features
  return @output
