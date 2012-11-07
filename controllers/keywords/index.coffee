config = require '../../config'

exports.custom = []
exports.custom.push
    path: '/keywords'
    callback: (req, res) ->
        res.render 'keywords', { tlds: config.tlds }

exports.locals =
    regions:
        navbarLinks:
            '/keywords': 'Keywords'
