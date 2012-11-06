#!/usr/bin/env coffee

config = require './config'
db = require './db'
tapas = require('tapas') config.tapas
app = do tapas.app

app.autodiscover "./controllers"

#app.io.sockets.on 'connection', (socket) ->
#    console.log '[+] new socket.io user !'
#    socket.on config.entonnoir.socket.login, (data) ->
#        if data.username != 'moul' or data.password != 'password42' # TODO: CHANGE THIS !!
#            console.log 'Bad authentication'
#            socket.emit config.entonnoir.socket.error, 'Bad username or password'
#            do socket.disconnect
#        # TODO: check inputs permissions
#        console.log "[+] User `#{data.username}` successfuly authenticated"
#        socket.username = data.username
#        socket.inputs = data.inputs
#        for input in data.inputs
#            socket.join "entonnoir.#{input}"

#    socket.on 'disconnect', ->
#        if not socket.username?
#            console.error "Unknown User disconnecte"
#            return
#        console.log "[+] User `#{socket.username}` disconnected"

#jobs =
#    message: (message, callback = null) ->
#        if config.entonnoir.saveEntriesToDb
#            console.error 'TODO'
#        if false # is doublon
#            console.error 'Doublon'
#            return
#        input = 'anjunabeats' # TODO: automatic
#        console.log "new message from: #{message.author_name}"
#        app.io.sockets.in("entonnoir.#{input}").emit config.entonnoir.socket.message, message
#        if callback?
#            do callback
#    succeed: (arg, callback) ->
#        console.log 'succeed'
#        do callback
#    fail: (arg, callback) ->
#        console.log 'fail'
#        callback(new Error 'fail')

#worker = db.resque.worker '*', jobs
#worker.on 'poll', (worker, queue) -> # console.log 'poll'
#worker.on 'job', (worker, queue, job) -> # console.log 'job'
#worker.on 'error', (err, worker, queue, job) -> console.log 'error', err
#worker.on 'success', (worker, queue, job, result) -> # console.log 'success'
#do worker.start

#db.redis.on 'pmessage', (pattern, channel, message) -> jobs.message JSON.parse message
#db.redis.psubscribe "#{config.entonnoir.redis.channel}.*"

do app.run
