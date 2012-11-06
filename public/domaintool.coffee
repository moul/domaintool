socket = false
domainTools_containers = []

$(document).ready ->
    socket = do io.connect
    socket.on 'connect', -> console.log 'on connect'
    socket.on 'reconnect', -> console.log 'on reconnect'
    socket.on 'disconnect', -> console.log 'on disconnect'
    socket.on 'domainTool_result', (domain, result) ->
        for container in domainTools_containers
            entry = container.find("[data-domain='#{domain}']")
            entry.removeClass().addClass(result.class)
            entry.find('.info').html result.state

$.fn.domainTool_query_multiple = (domains) ->
    container = $(@)
    container.parent().find('.remove-all').click -> container.empty()
    container.parent().find('.remove-unavailable').click -> container.find('.error').remove()
    domainTools_containers.push container
    for domain in domains
        if not $("[data-domain='#{domain}']", container).length
          row = $('<tr></tr>').attr('data-domain', domain).addClass('info')
          row.append $('<td></td>').addClass('domain').html domain
          row.append $('<td></td>').addClass('info').html 'in progress...'
          container.append row
    socket.emit 'domainTool_query_multiple', domains
