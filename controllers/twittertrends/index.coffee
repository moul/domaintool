config = require '../../config'

exports.custom = []
exports.custom.push
    path: '/twittertrends'
    callback: (req, res) ->
        res.render 'twittertrends', { tlds: config.tlds }

exports.locals =
    regions:
        navbarLinks:
            '/twittertrends': 'Twitter trends'
