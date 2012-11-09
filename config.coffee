exports.tapas =
    port: 9159
    debug: true
    locals:
        site_name:      'DomainTool'
        author:         'Manfred Touron'
        description:    'Domain tool'
        use:
            bootstrap:
                fluid: false
                responsive: true
    dbSchema:
        mongodb:
            url: 'mongodb://localhost/entonnoir'
        #redis2:
        #    port: 6379
        #memory: {}

exports.tlds =
    com:   true
#    fr:    false
#    "co.uk": false
#    us:    false

