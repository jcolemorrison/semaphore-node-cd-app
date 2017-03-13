const express = require('express')
const expect = require('chai').expect
const sinon = require('sinon')
const controller = require('../../controllers/users')

describe('Users Controller', function () {
  it('should send `respond with a resource`', () => {
    const req = {}
    const res = {
      send: sinon.stub()
    }
    const next = sinon.stub()
    controller.index(req, res, next)
    expect(res.send.calledWith('respond with a resource')).to.be.true
  })
})
