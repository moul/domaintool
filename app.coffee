#!/usr/bin/env coffee

config = require './config'
tapas = require('tapas') config.tapas
app = do tapas.app

whois = require('whoisjs').whois
who = new whois

app.autodiscover "./controllers"

app.io.sockets.on 'connection', (socket) ->
    console.log '[+] new socket.io user !'

    socket.on 'domainTool_query_multiple', (domains) ->
        for domain in domains
            do (->
                _domain = domain
                who.query _domain, (response) ->
                    info =
                        available:   do response.available
                        error:       do response.error
                        unavailable: do response.unavailable
                        timeout:     do response.timeout
                    info.state = "available"   if info.available
                    info.state = "unavailable" if info.unavailable
                    info.state = "timeout"     if info.timeout
                    info.state = "error"       if info.error
                    info.state ||= "unknown"
                    info.class = "success"     if info.available
                    info.class = "error"       if info.unavailable
                    info.class = "warning"     if info.timeout
                    info.class = "warning"     if info.error
                    info.class ||= "unknown"
                    socket.emit 'domainTool_result', _domain, info
                    )

do app.run
