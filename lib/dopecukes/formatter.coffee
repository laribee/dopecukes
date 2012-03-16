md = require('node-markdown').Markdown
util = require("util")
_ = require("underscore")

output = ""

formatFeature = (feature) =>
  @output += "<article class='feature'>"
  @output += "<h1 class='name'>#{feature.name}</h1>"
  formatTags(feature.tags) if feature.tags?
  @output += "<section class='description'>#{md(feature.description)}</section>"
  formatFeatureElement(element) for element in feature.elements
  @output += "</article>"

formatFeatureElement = (element) => 
  elementType = element.type
  @output += "<section class='#{elementType}'>"
  formatBackground(element) if elementType == "background"
  formatScenario(element) if elementType == "scenario"
  formatScenarioOutline(element) if elementType == "scenario_outline"
  @output += "</section>"

formatBackground = (background) =>
  @output += "<h2>Background</h2>"
  formatTags(background.tags) if background.tags?
  @output += "<ul class='steps'>"
  formatStep(step) for step in background.steps
  @output += "</ul>"

formatScenario = (scenario) =>
    @output += "<h2>#{scenario.name}</h2>"
    formatTags(scenario.tags) if scenario.tags?
    @output += "<ul class='steps'>"
    formatStep(step) for step in scenario.steps
    @output += "</ul>"

formatScenarioOutline = (scenario_outline) =>
  @output += "<h2>#{scenario_outline.name}</h2>"
  formatTags(scenario_outline.tags) if scenario_outline.tags?
  @output += "<ul class='steps'>"
  formatStep(step) for step in scenario_outline.steps
  @output += "</ul>"

formatStep = (step) =>
  @output += "<li class='step #{step?.result?.status}'>#{step?.keyword + step?.name}</li>"
  formatTable(step.rows) if step.rows?

formatTable = (rows) =>
  @output += "<li class='step'>"
  @output += "<table class='step-data'>"
  formatTableRow(row) for row in rows
  @output += "</table>"
  @output += "<li>"

formatTableRow = (row) =>
  @output += "<tr>"
  cellHtml = ""
  _.each row.cells, (cell) =>
    cellHtml += "<td>#{cell}</td>"
  @output += cellHtml
  @output += "</tr>"


formatTags =  (tags) =>
  @output += "<ul class='tags'>"
  formatTag(tag) for tag in tags
  @output += "</ul>"

formatTag = (tag) =>
  @output += "<li class='tag'>#{tag.name}</li>"

module.exports = (features) =>
  @output = ""
  formatFeature(feature) for feature in features
  return @output
