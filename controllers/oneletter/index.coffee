config = require '../../config'

exports.custom = []
exports.custom.push
    path: '/oneletter'
    callback: (req, res) ->
        res.render 'oneletter', { tlds: config.tlds }

exports.locals =
    regions:
        navbarLinks:
            '/oneletter': 'One letter'
