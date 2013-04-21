exports.tapas =
  port: 9159
  debug: true
  locals:
    site_name:    'DomainTool'
    author:     'Manfred Touron'
    description:  'Domain tool'
    use:
      bootstrap:
        fluid: false
        responsive: true
      jquery: true
  yahooapikey: null
  keywords_default_wordsa: 'the one a '
  keywords_default_wordsb: ''
  keywords_default_wordsc: 'box '

exports.tlds =
  com:   true
  net:   false
  org:   false
  #info:  false
  #eu:    false
  fr:    false
  #"co.uk": false
  #us:  false

try
    require('./config.local') exports
catch e
    console.log ''