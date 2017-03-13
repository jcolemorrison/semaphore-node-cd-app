const express = require('express')
const expect = require('chai').expect
const sinon = require('sinon')
const controller = require('../../controllers/index')

describe('Index Controller', function () {
  it('should render the index view with the express title', () => {
    const req = {}
    const res = {
      render: sinon.stub()
    }
    const next = sinon.stub()
    controller.index(req, res, next)
    expect(res.render.getCall(0).args[0]).to.equal('index')
    expect(res.render.getCall(0).args[1]).to.deep.equal({ title: 'Express' })
  })
})
