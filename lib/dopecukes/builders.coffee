_ = require('underscore')
md = require('node-markdown').Markdown

module.exports.FeatureBuilder = class FeatureBuilder

  constructor: (@markdown = md) ->

  toModel: (feature) ->
    model = {
      description: @markdown(feature.description),
      folders: @getFolders(feature.uri),
      tags: @getTags(feature.tags),
      id: feature.id
    }
    addBackground(element, model) for element in feature.elements?
    model

  getFolders: (featureUri) ->
    folders = featureUri.replace('features','').split("\\")
    folders[1..folders.length-2]

  getTags: (tags) ->
    _.map tags, (tag) -> tag.name

  addElement: (element) ->
    elementType = element.type
    addBackground(element, model)

  addBackground: (background) ->
    return unless (element == 'background')


module.exports.BackgroundBuilder = class BackgroundBuilder

  constructor: (@stepBuilder = new StepBuilder) ->

  toModel: (background) ->
    steps = []
    steps.push(@stepBuilder.toModel(step)) for step in background.steps?
    steps


module.exports.StepBuilder = class StepBuilder

  toModel: (step) ->
    { text: "#{step?.keyword + step?.name}", status: "#{step?.result?.status}" }