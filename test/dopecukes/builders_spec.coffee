builders = require('../../lib/dopecukes/builders')
should = require('should')
sinon = require('sinon')

describe "FeatureBuilder", ->

  before ->
    cucumberFeature = {
      name: 'A Random Feature',
      id: 'a-random-feature',
      uri: "features\\one\\two\\three.feature",
      desc: "Markdown *description*",
      tags: [{name:'@wip'}, {name:'@dope'}]
    }
    markdownStub = sinon.stub()
    markdownStub.returns("Markdown <i>description</i>")
    @featureModel = new builders.FeatureBuilder(markdownStub).toModel(cucumberFeature)

  it "transforms markdown in description", ->
    @featureModel.description.should.eql("Markdown <i>description</i>")

  it "creates folders from the uri", ->
#    @featureModel.folders.should.eql(['one', 'two'])

  it "includes a list of tags", ->
    @featureModel.tags.should.eql(['@wip', '@dope'])

  it "includes id", ->
    @featureModel.id.should.eql('a-random-feature')

describe "mock test", ->

  it "works", ->


describe "BackgroundBuilder", ->

  it "processes all steps", ->
    stepBuilder = { toModel: (step) ->  }
    sinon.mock(stepBuilder).expects("toModel").exactly(1)

    new builders.BackgroundBuilder(stepBuilder).toModel({ steps: [{}, {}] })
    stepBuilder.toModel.verify

describe "StepBuilder", ->
  before ->
    cucumberStep = {
      keyword: 'Given',
      name: ' the world',
      result: { status: 'passed' }
    }
    @stepModel = new builders.StepBuilder().toModel(cucumberStep)

  it "collapses keyword and name into title", ->
    @stepModel.text.should.eql("Given the world")

  it "returns test run status", ->
    @stepModel.status.should.eql('passed')
