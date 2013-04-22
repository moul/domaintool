#!/usr/bin/env coffee

config = require './config'
tapas = require('tapas') config.tapas
tapas = do tapas.app

whois = require('whoisjs').whois
who = new whois

try
  require('./app.local') tapas
catch e
  console.log ''

tapas.autodiscover "./controllers"

tapas.io.sockets.on 'connection', (socket) ->
  console.log '[+] new socket.io user !'

  socket.on 'domainTool_query_multiple', (domains) ->
    console.dir domains
    for domain in domains
      if domain != null
        do (->
          _domain = domain
          who.query _domain, (response) ->
            info =
              available:   do response.available
              error:     do response.error
              unavailable: do response.unavailable
              timeout:   do response.timeout
            info.state = "available"   if info.available
            info.state = "unavailable" if info.unavailable
            info.state = "timeout"   if info.timeout
            info.state = "error (quota ?)"     if info.error
            info.state ||= "unknown"
            info.class = "success"   if info.available
            info.class = "error"     if info.unavailable
            info.class = "warning"   if info.timeout
            info.class = "warning"   if info.error
            info.class ||= "unknown"
            info.raw = response.raw
            socket.emit 'domainTool_result', _domain, info
            )

do tapas.run
