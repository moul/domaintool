exports.tapas =
    port: 9159
    bindaddress: 'dev.onouo.com'
    debug: true
    locals:
        site_name:      'DomainTool'
        author:         'Manfred Touron'
        description:    'Domain tool'
        use:
            bootstrap:
                fluid: false
                responsive: true
    yahooapikey: null

exports.tlds =
    com:   true
    fr:    false
#    "co.uk": false
#    us:    false

