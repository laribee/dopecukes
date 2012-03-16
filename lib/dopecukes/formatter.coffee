md = require('node-markdown').Markdown
util = require("util")

output = ""

formatFeature = (feature) =>
  @output += "<article class='feature'>"
  @output += "<h1 class='name'>#{feature.name}</h1>"
  @output += "<section class='description'>#{md(feature.description)}</section>"
  formatFeatureElement(element) for element in feature.elements
  @output += "</article>"

formatFeatureElement = (element) => 
  elementType = element.type
  @output += "<section class='#{elementType}'>"
  formatBackground(element) if elementType == "background"
  formatScenario(element) if elementType == "scenario"
  @output += "</section>"

formatBackground = (background) =>
  @output += "<h2>Background</h2>"
  @output += "<ul class='steps'>"
  formatStep(step) for step in background.steps
  @output += "</ul>"

formatScenario = (scenario) =>
  @output += "<h2>#{scenario.name}</h2>"
  @output += "<ul class='steps'>"
  formatStep(step) for step in scenario.steps
  @output += "</ul>"

formatStep = (step) =>
  @output += "<li class='step #{step?.result?.status}'>#{step?.keyword + step?.name}</li>"

formatTags =  (tags) =>
  @output += "<div class='tags'>"
  @output += "</div>"

module.exports = (features) =>
  @output = ""
  formatFeature(feature) for feature in features
  return @output
