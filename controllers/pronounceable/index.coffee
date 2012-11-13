config = require '../../config'

exports.custom = []
exports.custom.push
    path: '/pronounceable'
    callback: (req, res) ->
        res.render 'pronounceable', { tlds: config.tlds }

exports.locals =
    regions:
        navbarLinks:
            '/pronounceable': 'Pronounceable'
