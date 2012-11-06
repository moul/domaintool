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
            entry.removeClass('info').addClass(result.class)
            entry.find('.info').html result.state

add_buttons = (container) ->
    row = $('<tr></tr>')
    column = $('<td></td>').attr('colspan', 2)
    remove_all =         $('<input />').attr('type', 'button').val('Remove all').addClass('btn btn-primary').click -> container.empty()
    remove_unavailable = $('<input />').attr('type', 'button').val('Remove unavailable').addClass('btn btn-primary').click -> $('.error', container).remove()
    column.append remove_all
    column.append remove_unavailable
    row.append column
    container.append row

$.fn.domainTool_query_multiple = (domains) ->
    container = $(@)
    add_buttons container
    domainTools_containers.push container
    for domain in domains
        row = $('<tr></tr>').attr('data-domain', domain).addClass('info')
        row.append $('<td></td>').addClass('domain').html domain
        row.append $('<td></td>').addClass('info').html 'in progress...'
        container.append row
    add_buttons container
    socket.emit 'domainTool_query_multiple', domains
