module.exports = exports = {}

redis      = require 'redis'
resque     = require 'coffee-resque'
config     = require './config'

exports.redis = do redis.createClient
exports.resque = resque.connect
    redis: exports.redis
    timeout: 1000
