md = require('node-markdown').Markdown
util = require("util")

output = ""

formatFeature = (feature) =>
  @output += "<h1>#{feature.uri}</h1>"
  @output += "<p>#{md(feature.description)}</p>"
  formatScenario(scenario) for scenario in feature.elements

formatScenario = (scenario) =>
  @output += "<h2>#{scenario.name}</h2>"
  @output += "<ul>"
  formatStep(step) for step in scenario.steps
  @output += "</ul>"

formatStep = (step) =>
  @output += "<li class='#{step?.result?.status}'>#{step?.keyword + step?.name}</li>"

formatTags =  (tags) =>
  @output += "<div class='tags'>"
  @output += "</div>"

module.exports = (features) =>
  @output = ""
  formatFeature(feature) for feature in features
  return @output
